----------------------------------------------------------------------

-- Tiny Tanks Script

local ezlib;
if _G.CachedEzLib then
	ezlib = loadstring(_G.CachedEzLib)()
else
	ezlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Modules/EzLib.lua"))()
end

local DontLoad = false
if game.PlaceId ~= 204990346 then
    ezlib:CreateNotice("Failed GameID Check", "The following exclusive that has been executed is not designed for the following game. This could cause the script to misfunction and break. Proceed anyway?", function(response)
        if response ~= "Yes" then
            DontLoad = true
        end
    end)
end
if DontLoad then return end

local MainTinyTanks = ezlib:NewLib("Tiny Tanks")

----------------------------------------------------------------------

-- Initialize Sections

local MainSection = ezlib:NewSection(MainTinyTanks, "Main")
local MiscSection = ezlib:NewSection(MainTinyTanks, "Misc")

----------------------------------------------------------------------

-- Local Section

ezlib:NewTitle(MainSection, "Main")
ezlib:NewDiv(MainSection)

local function GetTank()
    return workspace.Tanks:FindFirstChild("Tank-"..game:GetService("Players").LocalPlayer.Name);
end 

local TankSettings = {
    MoveSpeed = 100,
    RotationSpeed = 500,
    LoadedShots = 500,
    ReloadTime = 0,
    MaxFireRate = 0.05,
    AbilityCooldown = 0.05
}

local TankMods = false

local function UpdateConfig()
    if TankMods == false then return end;
    pcall(function()
        for i,v in pairs(TankSettings) do
            GetTank().Settings[i].Value = v;
        end
    end)
end

spawn(function()
    while wait(1) do
        UpdateConfig()
    end
end)

ezlib:NewCheckBox(MainSection, "Enabled", false, function(state)
    TankMods = state;
end)

ezlib:NewDiv(MainSection)
ezlib:NewTitle(MainSection, "Speed Mods")

ezlib:NewSlider(MainSection, "Move Speed", TankSettings.MoveSpeed, 1, 300, function(val)
    TankSettings.MoveSpeed = val;
end)

ezlib:NewSlider(MainSection, "Rotation Speed", TankSettings.RotationSpeed, 1, 500, function(val)
    TankSettings.RotationSpeed = val;
end)

ezlib:NewDiv(MainSection)
ezlib:NewTitle(MainSection, "Fire Mods")

ezlib:NewCheckBox(MainSection, "0 Reload Time", true, function(state)
    if state then
        TankSettings.ReloadTime = 0
    else
        TankSettings.ReloadTime = 1
    end
end)

ezlib:NewSlider(MainSection, "Loaded Shots", TankSettings.LoadedShots, 1, 500, function(val)
    TankSettings.LoadedShots = val;
end)

ezlib:NewCheckBox(MainSection, "Max Fire-Rate", true, function(state)
    if state then
        TankSettings.MaxFireRate = 0.05
    else
        TankSettings.MaxFireRate = 0.2
    end
end)

ezlib:NewDiv(MainSection)
ezlib:NewTitle(MainSection, "Other")

ezlib:NewCheckBox(MainSection, "Ability Cooldown", true, function(state)
    if state then
        TankSettings.AbilityCooldown = 0.05
    else
        TankSettings.AbilityCooldown = 20
    end
end)

----------------------------------------------------------------------

-- Misc Section

local ff = false
local ais = false

spawn(function()
    while wait() do
        if ff then
            for i, v in pairs(game.Players:GetPlayers()) do
                if workspace.Tanks:FindFirstChild("Tank-"..v.Name) then
                    if v.TeamColor == game.Players.LocalPlayer.TeamColor then
                        game:GetService("ReplicatedStorage").Remotes.FireAbility:FireServer(GetTank(), "Absorb", Tank.Base.Position, Vector3.new(Tank.Base.Position.X-70,Tank.Base.Position.Y,Tank.Base.Position.Z-70))
                    end
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if ais then
            if GetTank() then
                GetTank().Settings.AllowedInSpawn.Value = true
            end
        end
    end
end)

ezlib:NewCheckBox(MiscSection, "Force-Field", false, function(state)
    ff = state
end)

ezlib:NewCheckBox(MiscSection, "Allow In Spawn", false, function(state)
    ais = state
end)

----------------------------------------------------------------------

-- Active

ezlib:SetActive(MainSection);

