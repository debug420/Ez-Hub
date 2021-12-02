local terminalPrint = _G.EzHubTerminal.print;
local addCommand = _G.EzHubTerminal.addCommand;

terminalPrint("Initializing Ez Hub ESP Terminal...", "b");

local function espInit()
    local espModule = loadstring(_G["EzHubModules"]["espmodule"])();
    espModule.enabled = not espModule.enabled;
end

addCommand({"loadesp"}, "Loads the ESP. Can also be used to reload the ESP.", function()
    espInit();
    terminalPrint("Loaded and enabled ESP.", "b");
end)

addCommand({"unloadesp"}, "Unloads the ESP.", function()
    _G.unloadESP();
    terminalPrint("Unloaded ESP module...", "r");
end);

terminalPrint("Loaded Ez Hub ESP Terminal successfully! Type cmdlist to get the new list of commands.", "b");