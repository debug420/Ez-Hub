-- Arsenal Script

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("Arsenal", nil, nil, nil, 286090429);
loadstring(_G["EzHubModules"]["createaimbotmodule"])().newAimbotTab(mainGUI);
loadstring(_G["EzHubModules"]["createespmodule"])().newESPTab(mainGUI);
local weaponModTab = mainGUI.newTab("Gun Mods");

----------------------------------------------------------------------
-- Gun Section

weaponModTab.newTitle("Gun Mods");
weaponModTab.newDiv();

local infAmmo = false;
local noRecoil = false;
local automaticMode = false;
local noSpread = false;
local fireRate = false;

local weaponModule = require(game.Players.LocalPlayer.PlayerGui.GUI.Client.Functions.Weapons);
local fireBulletEnv = getfenv(weaponModule.firebullet);

local oldFirebullet;
local function bulletFired(...)

    if noSpread and fireBulletEnv.spreadmodifier and fireBulletEnv.currentspread then
        pcall(function() fireBulletEnv.currentspread.Value = 0;
        fireBulletEnv.spreadmodifier.Value = 0; end)
    end

    if automaticMode and fireBulletEnv.mode then
        pcall(function() fireBulletEnv.mode = "automatic"; end)
    end

    if infAmmo and fireBulletEnv.ammocount2 and fireBulletEnv.ammocount then
        pcall(function() fireBulletEnv.ammocount.Value = 69;
        fireBulletEnv.ammocount2.Value = 69; end)
    end

    if noRecoil and fireBulletEnv.recoil then
        pcall(function() fireBulletEnv.recoil = 0; end)
    end

	oldFirebullet(...);
end

oldFirebullet = hookfunction(weaponModule.firebullet, bulletFired);

weaponModTab.newCheckbox("No Recoil", noRecoil, function(state)
    noRecoil = state;
end)

weaponModTab.newCheckbox("Automatic", automaticMode, function(state)
    automaticMode = state;
end)

weaponModTab.newCheckbox("Infinite Ammo", infAmmo, function(state)
    infAmmo = state;
end)

weaponModTab.newCheckbox("No Spread", noSpread, function(state)
    noSpread = state;
end)

weaponModTab.NewDiv();

if syn then
    -- Namecall metamethod in charge of wallbang
    local oldNamecall, wallbangEnabled;
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        if tostring(getnamecallmethod()) == "FindPartOnRayWithIgnoreList" then
            if wallbangEnabled then table.insert(({...})[2], workspace.Map); end
        end
        return oldNamecall(self, ...);
    end)

    -- Toggles wallbang
    weaponModTab.newCheckbox("Wallbang", false, function(state)
        wallbangEnabled = state;
        coroutine.wrap(function()
            ezlib.newNotif(ezlib.enum.notifType.text, (state or "Enabled" and "Disabled").." wallbang successfully.").play().delete();
        end)();
    end)
else
    weaponModTab.newDesc("Your exploit does not support wallbang");
end

----------------------------------------------------------------------
-- Active

mainGUI.openTab(mainGUI.getTab("Aimbot"));

