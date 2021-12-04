local terminalPrint = _G.EzHubTerminal.print;
local addCommand = _G.EzHubTerminal.addCommand;

terminalPrint("Initializing Ez Hub Aimbot Terminal...", "b");

local function aimbotInit()
    local aimbotModule = loadstring(_G["EzHubModules"]["aimbotmodule"])();
    aimbotModule.enabled = not aimbotModule.enabled;
end

addCommand({"loadaimbot"}, "Loads the Aimbot. Can also be used to reload the Aimbot.", function()
    aimbotInit();
    terminalPrint("Loaded and enabled Aimbot.", "b");
end)

addCommand({"unloadaimbot"}, "Unloads the Aimbot.", function()
    if _G.unloadAimbot then _G.unloadAimbot() end
    terminalPrint("Unloaded Aimbot module...", "r");
end);

terminalPrint("Loaded Ez Hub Aimbot Terminal successfully! Type cmdlist to get the new list of commands.", "b");