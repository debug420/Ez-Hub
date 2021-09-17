
-- Tiny Tanks Script

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("Tiny Tanks", nil, nil, nil, 204990346);
local main = mainGUI.newTab("Main");
local misc = mainGUI.newTab("Misc");

----------------------------------------------------------------------
-- Main Section

main.newTitle("Main");
main.newDiv();

local function getTank()
    return workspace.Tanks:FindFirstChild("Tank-"..game:GetService("Players").LocalPlayer.Name);
end

local tankSettings = {
    MoveSpeed = 100,
    RotationSpeed = 500,
    LoadedShots = 500,
    ReloadTime = 0,
    MaxFireRate = 0.05,
    AbilityCooldown = 0.05
}

local tankMods = false;

local function updateConfig()
    if tankMods == false then return end;
    pcall(function()
        for i,v in pairs(tankSettings) do
            getTank().Settings[i].Value = v;
        end
    end)
end

local oldNamecall;
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    if tostring(self) == "LeftSpawn" and tostring(getnamecallmethod()) == "FireServer" then
       updateConfig();
    end
    return oldNamecall(self, ...);
end)

main.newCheckbox("Enabled", false, function(state)
    tankMods = state;
end)

main.newDiv();
main.newTitle("Speed Mods");

main.newSlider("Move Speed", tankSettings.MoveSpeed, 1, 300, function(val)
    tankSettings.MoveSpeed = val;
    updateConfig();
end)

main.newSlider("Rotation Speed", tankSettings.RotationSpeed, 1, 500, function(val)
    tankSettings.RotationSpeed = val;
    updateConfig();
end)

main.newDiv();
main.newTitle("Fire Mods");

main.newCheckbox("0 Reload Time", true, function(state)
    if state then
        tankSettings.ReloadTime = 0;
    else
        tankSettings.ReloadTime = 1;
    end
    updateConfig();
end)

main.newSlider("Loaded Shots", tankSettings.LoadedShots, 1, 500, function(val)
    tankSettings.LoadedShots = val;
    updateConfig();
end)

main.newCheckbox("Max Fire-Rate", true, function(state)
    if state then
        tankSettings.MaxFireRate = 0.05;
    else
        tankSettings.MaxFireRate = 0.2;
    end
    updateConfig();
end)

main.newDiv();
main.newTitle("Other");

main.newCheckbox("Ability Cooldown", true, function(state)
    if state then
        tankSettings.AbilityCooldown = 0.05;
    else
        tankSettings.AbilityCooldown = 20;
    end
    updateConfig();
end)

----------------------------------------------------------------------
-- Misc Section

local ff = false;
local ais = false;

coroutine.resume(coroutine.create(function()
    while wait() do
        if ff then
            for i, v in pairs(game.Players:GetPlayers()) do
                if workspace.Tanks:FindFirstChild("Tank-"..v.Name) then
                    if v.TeamColor == game.Players.LocalPlayer.TeamColor then
                        game:GetService("ReplicatedStorage").Remotes.FireAbility:FireServer(getTank(), "Absorb", Tank.Base.Position, Vector3.new(Tank.Base.Position.X-70,Tank.Base.Position.Y,Tank.Base.Position.Z-70))
                    end
                end
            end
        end
    end
end));

coroutine.resume(coroutine.create(function()
    while wait() do
        if ais then
            if getTank() then
                getTank().Settings.AllowedInSpawn.Value = true;
            end
        end
    end
end))

misc.newCheckbox("Force-Field", false, function(state)
    ff = state;
end)

misc.newCheckbox("Allow In Spawn", false, function(state)
    ais = state;
end)

----------------------------------------------------------------------
-- Active

mainGUI.openTab(main);

