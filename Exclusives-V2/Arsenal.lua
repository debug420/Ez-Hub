----------------------------------------------------------------------

-- Arsenal Script

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("Arsenal", nil, nil, nil, 286090429);

----------------------------------------------------------------------

-- Initialize Sections

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

local funcEnv, updateInventory;
for i,v in pairs(getgc(true)) do
    if type(v) == 'table' and rawget(v,'updateInventory') and rawget(v,'firebullet') then
        funcEnv = getfenv(v.firebullet);
        updateInventory = v.updateInventory;
    end
end

game:GetService("RunService").Stepped:Connect(function()
    if fireRate then
        funcEnv.DISABLED = false;
        funcEnv.DISABLED2 = false;
    end
    if noRecoil then
        funcEnv.recoil = 0;
    end
    if infAmmo then
        debug.setupvalue(updateInventory, 3, 70);
    end
    if automaticMode then
        funcEnv.mode = 'automatic';
    end
    if noSpread then
        funcEnv.currentspread = 0;
        funcEnv.spreadmodifier = 0;
    end
end)

weaponModTab.newCheckbox("No Recoil", noRecoil, function(state)
	noRecoil = state;
end)

weaponModTab.newCheckbox("Automatic", automaticMode, function(state)
	automaticMode = state;
end)

weaponModTab.newCheckbox("No Spread", noSpread, function(state)
	noSpread = state;
end)

weaponModTab.newCheckbox("Fire Rate", fireRate, function(state)
	fireRate = state;
end)

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

----------------------------------------------------------------------

-- Active

mainGUI.openTab(mainGUI.getTab("Aimbot"));

