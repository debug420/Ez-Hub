-- Legends of Speed Script

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("Legends of Speed", nil, nil, nil, 3101667897);
local main = mainGUI.newTab("Main");
local teleport = mainGUI.newTab("Teleports");

----------------------------------------------------------------------

-- Main Section

main.newTitle("Main Cheats");
main.newDiv();

local autofarms = {
    main = {
        primary = {
            threshhold = 0.03,
            enabled = false
        },
        tempd = false
    },
    race = {
        primary = false,
        tempd =  false
    },
    hoop = {
        primary = {
            threshhold = 0.03,
            enabled = false
        },
        tempd = false
    },
    rebirth = {
        primary = false,
        tempd = false
    }
}

coroutine.resume(coroutine.create(function()
    while wait(autofarms.main.primary.threshhold) do
        pcall(function()
            if autofarms.main.primary.enabled and autofarms.main.tempd == false then
                for i,v in pairs(workspace.orbFolder[game.Players.LocalPlayer.currentMap.Value]:GetChildren()) do
                    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", v.Name, game.Players.LocalPlayer.currentMap.Value);
                    if autofarms.main.tempd or autofarms.main.primary.enabled == false then break; end
                end
            end
        end)
    end
end))

coroutine.resume(coroutine.create(function()
    while wait()  do
        pcall(function()
            if autofarms.hoop.primary.enabled and autofarms.hoop.tempd == false then
                for i,v in pairs(workspace.Hoops:GetChildren()) do
                    if v:IsA("MeshPart") and v.Name == "Hoop" then
                        wait(autofarms.hoop.primary.threshhold);
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame;
                    end
                    if autofarms.hoop.tempd or autofarms.hoop.primary.enabled == false then break; end
                end
            end
        end)
    end
end))

local raceevent, selectedmap = game:GetService("ReplicatedStorage").rEvents.raceEvent;
raceevent.OnClientEvent:Connect(function(a, map, c)
    pcall(function()
        if a == "raceStarting" and autofarms.race.primary and autofarms.race.tempd == false then
            autofarms.hoop.tempd = true;
            selectedmap = map;
            spawn(function()
                wait(2);
                raceevent:FireServer("joinRace");
            end)
        elseif a == "beginRace" and autofarms.race.primary and autofarms.race.tempd == false then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.raceMaps[selectedmap].finishPart.CFrame;
            wait(.5);
            autofarms.hoop.tempd = false;
        end
    end)    
end)

coroutine.resume(coroutine.create(function()
    while wait() do
        pcall(function()
            if autofarms.rebirth.primary and autofarms.rebirth.tempd == false and game:GetService("Players").LocalPlayer.PlayerGui.gameGui.statsFrame.levelLabel.maxLabel.Visible then
                autofarms.main.tempd = true;
                autofarms.hoop.tempd = true;
                wait(.5);
                game.ReplicatedStorage.rEvents.rebirthEvent:FireServer("rebirthRequest");
                wait(.5);
                autofarms.main.tempd = false;
                autofarms.hoop.tempd = false;
            end
        end)
    end
end))

main.newCheckbox("Main Autofarm", false, function(state)
    autofarms.main.primary.enabled = state;
end)

main.newSlider("Threshhold", 0, 0, 10, function(val)
    autofarms.main.primary.threshhold = val / 100;
end)

main.newDiv();

main.newCheckbox("Auto-Rebirth", false, function(state)
    autofarms.rebirth.primary = state
    if autofarms.main.primary.enabled and state then 
        ezlib.newNotif(ezlib.enum.notifType.longText, "Auto-Rebirth will be slower than usual when using Main Autofarm along side it.").play().delete();
    end
end)

main.newDiv()

main.newCheckbox("Auto-Race", false, function(state)
    autofarms.race.primary = state;
    if autofarms.main.primary.enabled and state then
        ezlib.newNotif(ezlib.enum.notifType.longText, "Auto-Race will not work when Main Autofarm is enabled.").play().delete();
    end
end)

main.newDiv();

main.newCheckbox("Hoop Autofarm", false, function(state)
    autofarms.hoop.primary.enabled = state;
end)

main.newSlider("Threshhold", 0, 0, 10, function(val)
    autofarms.hoop.primary.threshhold = val / 100;
end)

----------------------------------------------------------------------

-- Teleports

teleport.newTitle("Teleports");
teleport.newDiv();

local crystalTeleports = {};
local rewardChestTeleports = {};

for i,v in pairs(workspace.mapCrystalsFolder:GetChildren()) do
    if string.find(v.Name, "Crystal") and v:IsA("Model") then
        crystalTeleports[v.Name] = v.guiPart.CFrame;
    end
end

for i,v in pairs(workspace.rewardChests:GetChildren()) do
    if v.Name == "rewardChest" and v:IsA("Model") then
        rewardChestTeleports["Reward Chest "..i] = v.PrimaryPart.CFrame;
    end
end

teleport.newDropdown("Crystal Teleports", "Select", crystalTeleports, function(state)
    if crystalTeleports[state] then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = crystalTeleports[state];
    end
end)

teleport.newDropdown("Chest Teleports", "Select", rewardChestTeleports, function(state)
    if rewardChestTeleports[state] then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = rewardChestTeleports[state];
    end
end)

----------------------------------------------------------------------

-- Active

mainGUI.openTab(main);

