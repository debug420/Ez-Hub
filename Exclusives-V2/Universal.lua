----------------------------------------------------------------------

-- Universal Script

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("Universal");

-- Init tabs

loadstring(_G["EzHubModules"]["createuniversalmodule"])().newUniversalTab(mainGUI);
loadstring(_G["EzHubModules"]["createuniversalmodule"])().newTeleportTab(mainGUI);
loadstring(_G["EzHubModules"]["createespmodule"])().newESPTab(mainGUI);
loadstring(_G["EzHubModules"]["createaimbotmodule"])().newAimbotTab(mainGUI);

----------------------------------------------------------------------

-- Open the main tab by default

mainGUI.openTab(mainGUI.getTab("Misc"));
