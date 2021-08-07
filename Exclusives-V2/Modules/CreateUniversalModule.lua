local settings = {
    noclip = false,
    infJumpEnabled = false,
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

return {
    newUniversalTab = function(mainGUIInstance)
        local tab = mainGUIInstance.newTab("Misc");
        tab.newTitle("Misc");
        tab.newDiv();

        tab.newSlider("Walkspeed", 0, 0, 100, function(state)
            client.Character.Humanoid.WalkSpeed = state;
        end);

        tab.newSlider("JumpPower", 0, 0, 100, function(state)
            client.Character.Humanoid.JumpPower = state;
        end)

        tab.newDiv();

        tab.newCheckbox("Noclip", false, function(state)
            settings.noclip = state;
            coroutine.wrap(function() 
                ezlib.newNotif(ezlib.enum.notifType.text, state and "Enabled noclip" or "Disabled noclip").play().delete();
            end)()
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

    end
}
