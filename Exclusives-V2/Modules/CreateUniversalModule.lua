-- Ezlib

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();

----------------------------------------------------------------------
-- Misc Tab funcs and vars

local settings = {
    noclip = false,
    infJumpEnabled = false,
    loopApply = false,
    desiredSpeed = nil,
    desiredJump = nil,
    flingPower = 500,
    flingEnabled = false
};

local players = game:GetService("Players");
local client = players.LocalPlayer;

local oldGravity = workspace.Gravity;
local oldSpeed;
local oldJump;
if not pcall(function()
    oldSpeed = client.Character.Humanoid.WalkSpeed;
    oldJump = client.Character.Humanoid.JumpPower;
end) then
    oldSpeed = 16;
    oldJump = 50;
end

local oldIndex;
oldIndex = hookmetamethod(game, "__index", function(self, key)
	if tostring(self) == "Humanoid" then
		if key == "WalkSpeed" then
			return oldSpeed;
		elseif key == "JumpPower" then
			return oldJump;
		end
    elseif self == workspace and key == "Gravity" then
        return oldGravity;
	end
	return oldIndex(self, key);
end)

local oldNamecall;
oldNamecall = hookmetamethod(game, "__namecall", function(...)
    if (settings.noclip or settings.infJumpEnabled) and getnamecallmethod() == "GetState" and tostring(({...})[1]) == "Humanoid" then
        return 8;
    end
    return oldNamecall(...);
end)

local whitelistedParts = {
    "Head",
    "Torso",
    "Left Leg",
    "Right Leg",
    "UpperTorso",
    "LowerTorso",
    "HumanoidRootPart"
};

game:GetService("RunService").RenderStepped:Connect(function()
    if settings.noclip then
	    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11);
    end
    if settings.loopApply then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = settings.desiredJump;
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = settings.desiredSpeed;
    end
end)

game:GetService("RunService").Stepped:Connect(function()
    if settings.flingEnabled then
        for i,v in pairs(client.Character:GetChildren()) do
            if table.find(whitelistedParts, v.Name) then
                v.CanCollide = false;
            end
        end
    end
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if settings.infJumpEnabled then
        client.Character.Humanoid:ChangeState("Jumping");
    end
end)

local function toggleFling(state)
    settings.flingEnabled = state;
    if state and client.Character and client.Character.HumanoidRootPart then
        local thrust = Instance.new("BodyThrust", client.Character.HumanoidRootPart);
        thrust.Force = Vector3.new(settings.flingPower, 0, settings.flingPower);
        thrust.Location = thrust.Parent.Position;
    else
        if client.Character.HumanoidRootPart:FindFirstChild("BodyThrust") then
            client.Character.HumanoidRootPart.BodyThrust:Destroy();
            client.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0,0,0);
        end
    end
end

----------------------------------------------------------------------
-- Teleport Funcs and vars

local chosenTeleportMethod = 0; -- 0 is instant, 1 is tween. Could not be bothered implementing enum system.
local tweenTime = 1;

local playersChanged = Instance.new("BindableEvent");
game:GetService("Players").PlayerAdded:Connect(function() playersChanged:Fire(); end)
game:GetService("Players").PlayerRemoving:Connect(function() playersChanged:Fire(); end)

local function teleport(cframe)
    local char = game:GetService("Players").LocalPlayer.Character;
    if not char then return end;

    if chosenTeleportMethod == 0 then
        char.HumanoidRootPart.CFrame = cframe;
    elseif chosenTeleportMethod == 1 then
        game:GetService("TweenService"):Create(char.HumanoidRootPart, TweenInfo.new(tweenTime), {CFrame = cframe}):Play();
    end
end

local function teleportToPlayer(playerInstance)
    if not playerInstance.Parent == game:GetService("Players") then return end
    pcall(teleport, playerInstance.Character:FindFirstChild("HumanoidRootPart").CFrame);
end

----------------------------------------------------------------------

return {
    newUniversalTab = function(mainGUIInstance)
        local tab = mainGUIInstance.newTab("Misc");
        tab.newTitle("Misc");
        tab.newDiv();

        tab.newCheckbox("Loop Apply", false, function(state)
            settings.loopApply = state;
        end)

        tab.newSlider("Walkspeed", 0, 0, 100, function(state)
            client.Character.Humanoid.WalkSpeed = state;
            settings.desiredSpeed = state;
        end);

        tab.newSlider("JumpPower", 0, 0, 100, function(state)
            client.Character.Humanoid.JumpPower = state;
            settings.desiredJump = state;
        end)

        tab.newDiv();

        tab.newCheckbox("Noclip", false, function(state)
            settings.noclip = state;
            coroutine.wrap(function()
                ezlib.newNotif(ezlib.enum.notifType.text, state and "Enabled noclip" or "Disabled noclip").play().delete();
            end)();
        end)

        tab.newCheckbox("Inf Jump", false, function(state)
            settings.infJumpEnabled = state;
        end)

        tab.newDiv();

        tab.newCheckbox("Fling", false, function(state)
            toggleFling(state);
        end)

        tab.newSlider("Fling Power", 500, 10, 1000, function(state)
            settings.flingPower = state;
        end)

        tab.newDiv();

        tab.newCheckbox("Xray", false, function(state)
            for i,v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and not v.Parent.Parent:FindFirstChild("Humanoid") then
                    v.Transparency = state and v.Transparency + 0.5 or v.Transparency - 0.5;
                end
            end
        end)

        tab.newSlider("Gravity", 190, 1, 500, function(state)
            workspace.Gravity = state;
        end)
        
        tab.newButton("Give Btools", function()
            Instance.new("HopperBin",game.Players.LocalPlayer.Backpack).BinType = "Clone";
            Instance.new("HopperBin",game.Players.LocalPlayer.Backpack).BinType = "Hammer";
        end)

        tab.newSlider("FOV", 70, 1, 120, function(state)
            workspace.Camera.FieldOfView = state;
        end)

    end,

    -- premadeTeleportDictionary is for premade teleports. It is supplied with a vector/dictionary
    newTeleportTab = function(mainGUIInstance, premadeTeleportDictionary)
        local tab = mainGUIInstance.newTab("Teleport");
        tab.newTitle("Teleport");
        tab.newDiv();

        tab.newDropdown("Teleport Method", "Instant TP", {"Instant TP", "Tween TP"}, function(state)
            chosenTeleportMethod = state == "Instant TP" and 0 or 1;
        end)

        if premadeTeleportDictionary then
            tab.newDiv();
            tab.newTitle("Pre-made Teleports");
            tab.newDropdown("Pre-made Teleports", "Select...", premadeTeleportDictionary, function(state)
                if premadeTeleportDictionary[state] then teleport(premadeTeleportDictionary[state]); end
            end)
        end

        tab.newDiv();
        
        local playerTeleportDropdown = tab.newDropdown("Player Teleport", game:GetService("Players").LocalPlayer.Name,
        game:GetService("Players"):GetPlayers(), function(state)
            pcall(function() teleportToPlayer(game:GetService("Players")[state]) end);
        end)

        playersChanged.Event:Connect(function()
            playerTeleportDropdown.changeData(game:GetService("Players"):GetPlayers());
            playerTeleportDropdown.changeState("Select...");
        end)

        tab.newButton("TP to random", function()
            teleportToPlayer(game:GetService("Players"):GetPlayers()[math.random(#game:GetService("Players"):GetPlayers())]);
        end)

        tab.newDiv();
        tab.newTitle("Waypoint System");
        tab.newDiv();

        local selectedWaypoint = nil;
        local waypoints = {};

        local waypointDropdown = tab.newDropdown("Select waypoint", "Select...", waypoints, function(state)
            selectedWaypoint = state;
        end);

        tab.newButton("TP to waypoint", function()
            if not pcall(function() teleport(waypoints[selectedWaypoint]); end) then
                coroutine.wrap(function() ezlib.newNotif(ezlib.enum.notifType.text, "No waypoint selected...").play().delete(); end)();
            end
        end)

        tab.newDiv();

        -- Blank callback as I will just use waypointNameInput.getState
        local waypointNameInput = tab.newTextbox("Waypoint Name", "Waypoint", function(state) end)

        tab.newButton("Make waypoint", function()
            if waypoints[waypointNameInput.getState()] then
                coroutine.wrap(function() ezlib.newNotif(ezlib.enum.notifType.text, "Waypoint name unavailable").play().delete(); end)();
                return end
            waypoints[waypointNameInput.getState()] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame;
            waypointDropdown.changeData(waypoints);
            waypointDropdown.changeState(waypointNameInput.getState());
            coroutine.wrap(function() ezlib.newNotif(ezlib.enum.notifType.longText, "Created waypoint at current user position. Use waypoint selector to teleport.").play().delete(); end)();
        end);

    end
}
