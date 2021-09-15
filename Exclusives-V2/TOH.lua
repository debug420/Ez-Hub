
-- TOH Script

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("TOH", nil, nil, nil, 1962086868);
local main = mainGUI.newTab("Main");

----------------------------------------------------------------------
-- Main Section

main.newTitle("Main Cheats");
main.newDiv();

local infjumpenabled = false
-- local godmodeenabled = false
local bunnyjumpdisablerenabled = false

game:GetService("UserInputService").JumpRequest:Connect(function()
	if infjumpenabled then
		game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState("Jumping")
	end
end)

-- This section disables the games anticheat. There is one function that
-- kicks a player. I simply hooked kick namecall and removed anticheat script

pcall(function()

    local oldNamecall;
    local oldIndex;
    local oldspeed, oldjump = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed, game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower
    
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        if getnamecallmethod() == "Kick" and self == game.Players.LocalPlayer then return;
        -- elseif args[1] == "kills" and getnamecallmethod() == "FindFirstChild" and godmodeenabled then
        --     return false
        elseif getnamecallmethod() == "GetState" and self == game.Players.LocalPlayer.Character.Humanoid and bunnyjumpdisablerenabled then
            return Enum.HumanoidStateType.Climbing;
        end
        return oldNamecall(self, ...);
    end)

    oldIndex = hookmetamethod(game, "__index", function(self, key)
        if key == "WalkSpeed" and self == game.Players.LocalPlayer.Character.Humanoid then
            return oldspeed;
        elseif key == "JumpPower" and self == game.Players.LocalPlayer.Character.Humanoid then
            return oldjump;
        else
            return oldIndex(self, key);
        end
    end)

    game.Players.LocalPlayer.PlayerScripts.LocalScript:Destroy();

end)

main.newCheckbox("Inf Jump", false, function(state)
    infjumpenabled = state;
end)

main.newCheckbox("No Bunny-Jump", false, function(state)
    bunnyjumpdisablerenabled = state;
end)

local connection;
main.newCheckbox("God Mode", false, function(state)
    -- godmodeenabled = state;
    if state then

        connection = game.Players.LocalPlayer.CharacterAdded:Connect(function()
            delay(4, function()
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.Name == "hitbox" then v.Parent = game.CoreGui end
                end
            end);
        end)
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v.Name == "hitbox" then v.Parent = game.CoreGui; end
        end

    else

        for i,v in pairs(game.CoreGui:GetChildren()) do
            if v.Name == "hitbox" then v.Parent = game.Players.LocalPlayer.Character end
        end
        if connection then connection:Disconnect() end

    end
    
end)

main.newButton("Finish", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
    workspace.tower.finishes:FindFirstChild("Finish").CFrame;
end)

main.newDiv();

main.newSlider("Walk Speed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 0, 200, function(val)
	game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = val;
end)

main.newSlider("Jump Power", game.Players.LocalPlayer.Character.Humanoid.JumpPower, 0, 300, function(val)
	game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = val;
end)

----------------------------------------------------------------------
-- Active

mainGUI.openTab(main);

