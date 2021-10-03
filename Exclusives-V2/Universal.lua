local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();

-- Below is a list of games that the universal is not recommended to be ran on
-- as there could be an exclusive specifically tuned and made for that game

local listOfGames = {
    ["Phantom Forces"] = 292439477,
    ["DDay"] = 901793731,
    ["Arsenal"] = 286090429,
    ["Redwood Prison"] = 402122991,
    ["Prison Life"] = 155615604,
    ["Legends of Speed"] = 3101667897,
    ["Mad City"] = 1224212277,
    ["Shindo"] = 4616652839,
    ["Rise of Nations"] = 2569453732,
    ["Bloxburg"] = 185655149,
    ["Wild West"] = 2317712696,
    ["Jailbreak"] = 606849621
}

for i,v in pairs(listOfGames) do
    if game.PlaceId == v then
        coroutine.wrap(function()
            ezlib.newNotif(ezlib.enum.notifType.longText,
                "The following game is not recommended for Universal use. Look in the exclusives V2 section for a script specifically made for "..i.."."
                ).play(10).delete();
        end)();
    end
end

----------------------------------------------------------------------
-- Universal Script

local mainGUI = ezlib.create("Universal");

-- Init tabs

loadstring(_G["EzHubModules"]["createuniversalmodule"])().newUniversalTab(mainGUI);
loadstring(_G["EzHubModules"]["createuniversalmodule"])().newTeleportTab(mainGUI);
loadstring(_G["EzHubModules"]["createespmodule"])().newESPTab(mainGUI);
loadstring(_G["EzHubModules"]["createaimbotmodule"])().newAimbotTab(mainGUI);

----------------------------------------------------------------------

-- Open the main tab by default

mainGUI.openTab(mainGUI.getTab("Misc"));
