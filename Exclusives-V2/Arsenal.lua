----------------------------------------------------------------------

-- Arsenal Script

local ezlib;
if _G.CachedEzLib then
	ezlib = loadstring(_G.CachedEzLib)()
else
	ezlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Modules/EzLib.lua"))()
end

local DontLoad = false
if game.PlaceId ~= 286090429 then
    ezlib:CreateNotice("Failed GameID Check", "The following exclusive that has been executed is not designed for the following game. This could cause the script to misfunction and break. Proceed anyway?", function(response)
        if response ~= "Yes" then
            DontLoad = true
        end
    end)
end
if DontLoad then return end

local MainArsenal = ezlib:NewLib("Arsenal")

----------------------------------------------------------------------

-- Initialize Sections

local AimbotSection = ezlib:NewSection(MainArsenal, "Aimbot")
local ESPSection = ezlib:NewSection(MainArsenal, "ESP")
local GunSection = ezlib:NewSection(MainArsenal, "Gun Mods")

----------------------------------------------------------------------

-- Aimbot Section

if _G.CreateAimbotModule then
	loadstring(_G.CreateAimbotModule)()(ezlib, AimbotSection)
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Exclusives-V2/Modules/CreateAimbotModule.lua"))()(ezlib, AimbotSection)
end

----------------------------------------------------------------------

-- ESP Section

if _G.CreateESPModule then
	loadstring(_G.CreateESPModule)()(ezlib, ESPSection)
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Exclusives-V2/Modules/CreateESPModule.lua"))()(ezlib, ESPSection)
end

----------------------------------------------------------------------

-- Gun Section

ezlib:NewTitle(GunSection, "Gun Mods")
ezlib:NewDiv(GunSection)

local InfAmmoVar = false
local NoRecoilVar = false
local AutomaticModeVar = false
local NoSpreadVar = false
local FireRateVar = false

local FuncEnv, UInv;
for i,v in pairs(getgc(true)) do
    if type(v) == 'table' and rawget(v,'updateInventory') and rawget(v,'firebullet') then
        FuncEnv = getfenv(v.firebullet)
        UInv = v.updateInventory
    end
end

game:GetService("RunService").Stepped:Connect(function()
    if FireRateVar then
        FuncEnv.DISABLED = false
        FuncEnv.DISABLED2 = false
    end
    if NoRecoilVar then
        FuncEnv.recoil = 0
    end
    if InfAmmoVar then
        debug.setupvalue(UInv, 3, 70)
    end
    if AutomaticModeVar then
        FuncEnv.mode = 'automatic'
    end
    if NoSpreadVar then
        FuncEnv.currentspread = 0
        FuncEnv.spreadmodifier = 0
    end
end)

ezlib:NewCheckBox(GunSection, "No Recoil", NoRecoilVar, function(state)
	NoRecoilVar = state
end)	

ezlib:NewCheckBox(GunSection, "Automatic", AutomaticModeVar, function(state)
	AutomaticModeVar = state
end)

ezlib:NewCheckBox(GunSection, "No Spread", NoSpreadVar, function(state)
	NoSpreadVar = state
end)

ezlib:NewCheckBox(GunSection, "Fire Rate", FireRateVar, function(state)
	FireRateVar = state
end)

local gm = getrawmetatable(game);
local wallbangenabled = false;
local oldn = gm.__namecall;
setreadonly(gm, false);

gm.__namecall = newcclosure(function(self, ...)
    local arg = {...};
    if tostring(getnamecallmethod()) == "FindPartOnRayWithIgnoreList" then
        if wallbangenabled then table.insert(arg[2], workspace.Map); end
    end
    return oldn(self, ...);
end)

setreadonly(gm, true);

-- Toggles wallbang
ezlib:NewCheckBox(GunSection, "Wallbang", false, function(state)
    wallbangenabled = state
    if state then
        ezlib:NewNotif(nil, "Enabled wallbang successfully.")
    else
        ezlib:NewNotif(nil, "Disabled wallbang successfully.")
    end
end)

----------------------------------------------------------------------

-- Active

ezlib:SetActive(AimbotSection);

