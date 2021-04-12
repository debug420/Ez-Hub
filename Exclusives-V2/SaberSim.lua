----------------------------------------------------------------------

-- Saber Sim  Script

local ezlib;
if _G.CachedEzLib then
	ezlib = loadstring(_G.CachedEzLib)()
else
	ezlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Modules/EzLib.lua"))()
end

local DontLoad = false
if game.PlaceId ~= 3823781113 then
    ezlib:CreateNotice("Failed GameID Check", "The following exclusive that has been executed is not designed for the following game. This could cause the script to misfunction and break. Proceed anyway?", function(response)
        if response ~= "Yes" then
            DontLoad = true
        end
    end)
end
if DontLoad then return end

local MainSaber = ezlib:NewLib("Saber Sim")

----------------------------------------------------------------------

-- Initialize Sections

local MainSection = ezlib:NewSection(MainSaber, "Main")
local TeleportSection = ezlib:NewSection(MainSaber, "Teleports")
local MiscSection = ezlib:NewSection(MainSaber, "Misc")

----------------------------------------------------------------------

-- Main Section

ezlib:NewTitle(MainSection, "Main Cheats")
ezlib:NewDiv(MainSection)

-- Main Autofarm

local AutoVars = {
    Main = false,
    Sell = false,
    BuyS = false,
    BuyD = false,
    BuyA = false,
    BuyPA = false,
    BuyJ = false,
    BuyB = false,
    Coin = false,
    Candy = false
}

function LoopThroughCoin()
    for i,v in pairs(workspace.CoinsHolder:GetChildren()) do
        if AutoVars.Coin == false then break; end
        if v.ClassName == "MeshPart" then
            pcall(function() game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame end)
        end
        wait(.1)
    end
    return;
end

function LoopThroughCandy()
    for i,v in pairs(workspace.CandyHolder:GetChildren()) do
        if AutoVars.Candy == false then break; end
        if v.Name == "CandyCane" then
            pcall(function() game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame end)
        end
        wait(.1)
    end
    return;
end

coroutine.resume(coroutine.create(function()
    while wait() do
        if AutoVars.Coin then
            LoopThroughCoin()
        end
    end
end))

coroutine.resume(coroutine.create(function()
    while wait() do
        if AutoVars.Candy then
            LoopThroughCandy()
        end
    end
end))

local MaxJump = false
coroutine.resume(coroutine.create(function()
    while wait() do
        if AutoVars.Main then
            pcall(function() game:GetService("Players").LocalPlayer.Backpack:GetChildren()[1].Parent = game:GetService("Players").LocalPlayer.Character end)
            game:GetService("ReplicatedStorage").Events.Clicked:FireServer();
        end
        if AutoVars.Sell then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(531.436401, 183.537842, 144.275848)
            game:GetService("ReplicatedStorage").Events.Sell:FireServer()
        end
        if AutoVars.BuyS then
            game:GetService("ReplicatedStorage").Events.BuyAll:FireServer("Swords")
        end
        if AutoVars.BuyD then
            game:GetService("ReplicatedStorage").Events.BuyAll:FireServer("Backpacks")
        end
        if AutoVars.BuyA then
            game:GetService("ReplicatedStorage").Events.BuyAll:FireServer("Auras")
        end
        if AutoVars.BuyPA then
            game:GetService("ReplicatedStorage").Events.BuyAll:FireServer("PetAuras")
        end
        if AutoVars.BuyJ then
            game:GetService("ReplicatedStorage").Events.BuyAll:FireServer("JumpBoosts")
        end
        if AutoVars.BuyB then
            game:GetService("ReplicatedStorage").Events.BuyAll:FireServer("BossBoosts")
        end
        if MaxJump then
            game.Players.LocalPlayer.PlayerScripts["Double Jump"].MaxJumps.Value = 99999999999
        else
            game.Players.LocalPlayer.PlayerScripts["Double Jump"].MaxJumps.Value = 2
        end
    end
end))

ezlib:NewCheckBox(MainSection, "Auto Farm", false, function(state)
    AutoVars.Main = state
end)

ezlib:NewCheckBox(MainSection, "Auto Sell", false, function(state)
    AutoVars.Sell = state
end)

ezlib:NewDiv(MainSection)

ezlib:NewCheckBox(MainSection, "Auto Buy Saber", false, function(state)
    AutoVars.BuyS = state
end)

ezlib:NewCheckBox(MainSection, "Auto Buy DNA", false, function(state)
    AutoVars.BuyD = state
end)

ezlib:NewCheckBox(MainSection, "Auto Buy Aura", false, function(state)
    AutoVars.BuyA = state
end)

ezlib:NewCheckBox(MainSection, "Auto Buy Jump Boosts", false, function(state)
    AutoVars.BuyJ = state
end)

ezlib:NewCheckBox(MainSection, "Auto Buy Pet Aura", false, function(state)
    AutoVars.BuyPA = state
end)

ezlib:NewDiv(MainSection)

ezlib:NewCheckBox(MainSection, "Auto Coin", false, function(state)
    AutoVars.Coin = state
end)

ezlib:NewCheckBox(MainSection, "Auto Candy", false, function(state)
    AutoVars.Candy = state
end)

----------------------------------------------------------------------

-- Teleport Section

ezlib:NewTitle(TeleportSection, "Teleport")
ezlib:NewDiv(TeleportSection)

local TeleportT = {
    ["Shop"] = CFrame.new(475.177917, 183.950592, 68.667984),
    ["Daily Rewards"] = CFrame.new(491.230225, 183.537842, 121.609573),
    ["Sell Area"] = CFrame.new(521.237305, 183.537842, 142.017639),
    ["Upgrade Skill"] = CFrame.new(553.974792, 183.537842, 140.078659),
    ["Boss Ring"] = CFrame.new(364.134155, 185.674408, 168.704376),
    ["Construction Site"] = CFrame.new(583.555115, 210.413422, -195.103607),
    ["Crown Shop"] = CFrame.new(725.772156, 183.787842, 169.91925),
    ["Volcano"] = CFrame.new(705.309326, 170.944824, 460.842804),
    ["Island Portal"] = CFrame.new(530.833862, 185.689117, -37.1283569)
}

for i,v in pairs(TeleportT) do
    ezlib:NewButton(TeleportSection, i, function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v
    end)
end

----------------------------------------------------------------------

-- Misc Section

ezlib:NewTitle(MiscSection, "Misc")
ezlib:NewDiv(MiscSection)

ezlib:NewButton(MiscSection, "Unlock All Islands", function()
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Gui.Submenus.Portal.Frame.ScrollingFrame.Frame:GetChildren()) do
        if v:IsA("ImageLabel") then
            v.Unlock.Visible = false
            v.Teleport.Visible = true
            v.IMG.Visible = true
            if v:FindFirstChild("Locked") then v.Locked.Visible = false end
        end
    end
    ezlib:NewNotif(nil, "Unlocked all islands.")
end)

ezlib:NewCheckBox(MiscSection, "Unlimited Jump", false, function(state)
    MaxJump = state
end)

ezlib:NewDiv(MiscSection);

-- Game Meta Vars
local gamemt = getrawmetatable(game);
local oldindex = gamemt.__index;
local oldspeed, oldgrav = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed, workspace.Gravity
local IndexAnticheat = true

-- Anticheat for walkspeed and jumppower for games with client sided val checks

setreadonly(gamemt, false)
gamemt.__index = newcclosure(function(self, key)
	if key == "WalkSpeed" and self == game.Players.LocalPlayer.Character.Humanoid and IndexAnticheat then
		return oldspeed;
    elseif key == "Gravity" and self == workspace then
        return oldgrav;
	else
		return oldindex(self, key);
	end
end)
setreadonly(gamemt, true)

ezlib:NewTitle(MiscSection, "Universal")

local requestedw, requestedg = oldspeed, oldgrav

game:GetService("RunService").RenderStepped:Connect(function()
    game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = requestedw
    workspace.Gravity = requestedg
end)

ezlib:NewSlider(MiscSection, "Walk Speed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 0, 200, function(val)
    requestedw = val
end)

ezlib:NewSlider(MiscSection, "Gravity", workspace.Gravity, 0, 500, function(val)
	requestedg = val
end)

----------------------------------------------------------------------

-- Active

ezlib:SetActive(MainSection);
