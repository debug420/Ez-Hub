----------------------------------------------------------------------

-- TOH Script

local ezlib;
if _G.CachedEzLib then
	ezlib = loadstring(_G.CachedEzLib)()
else
	ezlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Modules/EzLib.lua"))()
end

local DontLoad = false
if game.PlaceId ~= 1962086868 then
    ezlib:CreateNotice("Failed GameID Check", "The following exclusive that has been executed is not designed for the following game. This could cause the script to misfunction and break. Proceed anyway?", function(response)
        if response ~= "Yes" then
            DontLoad = true
        end
    end)
end
if DontLoad then return end

local Main = ezlib:NewLib("TOH")

----------------------------------------------------------------------

-- Initialize Sections

local LocalSection = ezlib:NewSection(Main, "Main")

----------------------------------------------------------------------

-- Local Section

ezlib:NewTitle(LocalSection, "Main Cheats")
ezlib:NewDiv(LocalSection)

local infjumpenabled = false
-- local godmodeenabled = false
local bunnyjumpdisablerenabled = false

game:GetService("UserInputService").JumpRequest:Connect(function()
	if infjumpenabled then
		game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState("Jumping")
	end
end)

-- This section disables the games anticheat. The devs are actually retarded. They have one function that
-- kicks a player. I simply hooked kick namecall and removed anticheat script

pcall(function()
    local gm = getrawmetatable(game)
    setreadonly(gm, false)
    local OldNameCall = gm.__namecall
    local OldIndex = gm.__index
    local oldspeed, oldjump = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed, game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower
    gm.__namecall = newcclosure(function(self, ...)
        if getnamecallmethod() == "Kick" and self == game.Players.LocalPlayer then return 
        -- elseif args[1] == "kills" and getnamecallmethod() == "FindFirstChild" and godmodeenabled then 
        --     return false
        elseif getnamecallmethod() == "GetState" and self == game.Players.LocalPlayer.Character.Humanoid and bunnyjumpdisablerenabled then
            return Enum.HumanoidStateType.Climbing
        end
        return OldNameCall(self, ...)
    end)
    gm.__index = newcclosure(function(self, key)
        if key == "WalkSpeed" and self == game.Players.LocalPlayer.Character.Humanoid then
            return oldspeed;
        elseif key == "JumpPower" and self == game.Players.LocalPlayer.Character.Humanoid then
            return oldjump;
        else
            return OldIndex(self, key)
        end
    end)
    setreadonly(gm, true)
    game.Players.LocalPlayer.PlayerScripts.LocalScript:Destroy()
end)

ezlib:NewCheckBox(LocalSection, "Inf Jump", false, function(state)
    infjumpenabled = state;
end)

ezlib:NewCheckBox(LocalSection, "No Bunny-Jump", false, function(state)
    bunnyjumpdisablerenabled = state;
end)

local connection
ezlib:NewCheckBox(LocalSection, "God Mode", false, function(state)
    -- godmodeenabled = state;
    if state then

        connection = game.Players.LocalPlayer.CharacterAdded:Connect(function()
            delay(4, function()
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.Name == "hitbox" then v.Parent = game.CoreGui end 
                end 
            end)
        end)
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v.Name == "hitbox" then v.Parent = game.CoreGui end 
        end 

    else
        
        for i,v in pairs(game.CoreGui:GetChildren()) do
            if v.Name == "hitbox" then v.Parent = game.Players.LocalPlayer.Character end
        end
        if connection then connection:Disconnect() end

    end
end)

ezlib:NewButton(LocalSection, "Finish", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.tower.finishes:FindFirstChild("Finish").CFrame
end)

ezlib:NewDiv(LocalSection)

ezlib:NewSlider(LocalSection, "Walk Speed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 0, 200, function(val)
	game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = val
end)

ezlib:NewSlider(LocalSection, "Jump Power", game.Players.LocalPlayer.Character.Humanoid.JumpPower, 0, 300, function(val)
	game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = val
end)

-- Active

ezlib:SetActive(LocalSection);

