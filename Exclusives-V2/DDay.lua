-- Dday Script

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("Dday");

loadstring(_G["EzHubModules"]["createaimbotmodule"])().newAimbotTab(mainGUI);
loadstring(_G["EzHubModules"]["createespmodule"])().newESPTab(mainGUI);
local gunMods = mainGUI.newTab("Gun Mods");

----------------------------------------------------------------------

-- Disable connections that ensure nothing changes to the client PlayerScripts

local mainClient = game.Players.LocalPlayer.PlayerScripts._Client_Main_;
local changedClientConnection = getconnections(mainClient.Changed);
local ancestryChangedClientConnnection = getconnections(mainClient.AncestryChanged);

for i,v in pairs(changedClientConnection) do v:Disable(); end
for i,v in pairs(ancestryChangedClientConnnection) do v:Disable(); end

-- Disable ban remote

local oldNamecall;
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    if getnamecallmethod() == "FireServer" then
        if tostring(self) == "Set_Ban" then
            return nil;
        end
    end
    
    return oldNamecall(self, ...);
end)

-- Apply gun mods

local function applyGunMods(mode)
    for i,v in pairs(game:GetService("ReplicatedStorage").Weapons:GetChildren()) do
        local setting = v:FindFirstChild("Setting");
        if setting then setting = require(setting);

            if mode == "noreload" then
                if setting.ReloadTime then setting.ReloadTime = 0.03 end
                if setting.ReloadAnimationSpeed then setting.ReloadAnimationSpeed = 5 end
            end

            if mode == "nospread" then
                if setting.Spread then setting.Spread = 0.03 end
                if setting.SpreadMove then setting.SpreadMove = 0.03 end
            end
            
            -- Fire rate and ammoclip cannot be modified as checks are made on the server
            --if setting.FireRate then setting.FireRate = 0.03 end
            
            if mode == "infammo" then
                if setting.AmmoPerClip then setting.AmmoPerClip = 69 end
            end

        end
    end
end

--[[
    The below was the original method I came up with
    I did not use it because of two reasons
    - hookfunction is unreliable with lua closures. the reason that hookfunction doesn't work is because I wanted to create a toggle and therefore
    I needed nocamerashake as an upvalue, however, because of hookfunction restrictions, it did not allow me
    - Lua "syntaxically" can't do require(module) = function() end as the module returned the function not a table.
    This means there was no way for me to reference to the original function

    If I missed something, please let me know as I am actually curious as how one would get the original function by following lua syntax
    The below would work perfectly fine if I didn't include nocamerashake as an upvalue
]]--

-- local nocamerashake = false;
-- local shakeCameraModule = game:GetService("ReplicatedStorage").Modules.Client.Shake_Camera;
-- local oldShake;
-- oldShake = hookfunction(require(shakeCameraModule), function(...)
--     local args = {...};
    
--     -- 1 is whether the player is aiming
--     -- 2 is camera instance
--     -- 3 and 4 are related to intensity of shake
--     for i,v in pairs(args) do print(i,v) end
    
--     -- There are numerous ways of approaching this. You can either modify 3 and 4
--     -- in the settings of each Weapons
--     -- I decided to do it by hooking it. Instead of modifying args 3 and 4
--     -- I modified 2 and made a fake "Camera" that the script will apply its changes to
    
--     if nocamerashake then
--         arg[2] = {
--             CoordinateFrame,
--             Focus = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
--         }
--     end

--     return oldShake(table.unpack(args));
-- end)

-- This is the new solution that does not rely on hooking functions. Not as happy with it, but it does the job
local shakeCameraModule = game:GetService("ReplicatedStorage").Modules.Client.Shake_Camera;

local function setCameraShake(state)
    local constants = debug.getconstants(require(shakeCameraModule));
    for i,v in pairs(constants) do
        if tostring(v) == (state and "CoordinateFrame" or "EzHubGud") then 
            debug.setconstant(require(shakeCameraModule), i, state and "EzHubGud" or "CoordinateFrame");
        end
    end
end

gunMods.newCheckbox("No Camera Shake", false, function(state)
    setCameraShake(state);
end)

gunMods.newButton("No Reload", function(state)
    applyGunMods("noreload");
end)

gunMods.newButton("No Spread", function(state)
    applyGunMods("nospread");
end)

gunMods.newDiv();
gunMods.newDesc("Note that inf ammo can be detected. Use with caution.=.");

gunMods.newButton("Inf Ammo", function(state)
    applyGunMods("infammo");
end)

----------------------------------------------------------------------

mainGUI.openTab(mainGUI.getTab("Aimbot"));