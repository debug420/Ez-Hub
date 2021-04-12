----------------------------------------------------------------------

-- Legends of Speed Script

local ezlib;
if _G.CachedEzLib then
	ezlib = loadstring(_G.CachedEzLib)()
else
	ezlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Modules/EzLib.lua"))()
end

local DontLoad = false
if game.PlaceId ~= 3101667897 then
    ezlib:CreateNotice("Failed GameID Check", "The following exclusive that has been executed is not designed for the following game. This could cause the script to misfunction and break. Proceed anyway?", function(response)
        if response ~= "Yes" then
            DontLoad = true
        end
    end)
end
if DontLoad then return end

local Main = ezlib:NewLib("Legends of Speed")

----------------------------------------------------------------------

-- Initialize Sections

local MainSection = ezlib:NewSection(Main, "Main")
local TeleportSection = ezlib:NewSection(Main, "Teleports")

----------------------------------------------------------------------

-- Main Section

ezlib:NewTitle(MainSection, "Main Cheats")
ezlib:NewDiv(MainSection)

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
                    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", v.Name, game.Players.LocalPlayer.currentMap.Value)
                    if autofarms.main.tempd or autofarms.main.primary.enabled == false then break end
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
                        wait(autofarms.hoop.primary.threshhold)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    end
                    if autofarms.hoop.tempd or autofarms.hoop.primary.enabled == false then break end
                end
            end
        end)
    end
end))

local raceevent, selectedmap = game:GetService("ReplicatedStorage").rEvents.raceEvent
raceevent.OnClientEvent:Connect(function(a, map, c)
    pcall(function()
        if a == "raceStarting" and autofarms.race.primary and autofarms.race.tempd == false then
            autofarms.hoop.tempd = true
            selectedmap = map
            spawn(function()
                wait(2)
                raceevent:FireServer("joinRace")
            end)
        elseif a == "beginRace" and autofarms.race.primary and autofarms.race.tempd == false then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.raceMaps[selectedmap].finishPart.CFrame
            wait(.5)
            autofarms.hoop.tempd = false
        end
    end)    
end)

coroutine.resume(coroutine.create(function()
    while wait() do
        pcall(function()
            if autofarms.rebirth.primary and autofarms.rebirth.tempd == false and game:GetService("Players").LocalPlayer.PlayerGui.gameGui.statsFrame.levelLabel.maxLabel.Visible then
                autofarms.main.tempd = true
                autofarms.hoop.tempd = true
                wait(.5)
                game.ReplicatedStorage.rEvents.rebirthEvent:FireServer("rebirthRequest")
                wait(.5)
                autofarms.main.tempd = false
                autofarms.hoop.tempd = false
            end
        end)
    end
end))

ezlib:NewCheckBox(MainSection, "Main Autofarm", false, function(state)
    autofarms.main.primary.enabled = state
end)

ezlib:NewSlider(MainSection, "Threshhold", 0, 0, 10, function(val)
    autofarms.main.primary.threshhold = val/100
end)

ezlib:NewDiv(MainSection)

ezlib:NewCheckBox(MainSection, "Auto-Rebirth", false, function(state)
    autofarms.rebirth.primary = state
    if autofarms.main.primary.enabled and state then ezlib:NewNotif(nil, "Auto-Rebirth will be slower than usual when using Main Autofarm along side it.", 10) end
end)

ezlib:NewDiv(MainSection)

ezlib:NewCheckBox(MainSection, "Auto-Race", false, function(state)
    autofarms.race.primary = state
    if autofarms.main.primary.enabled and state then ezlib:NewNotif(nil, "Auto-Race will not work when Main Autofarm is enabled.", 10) end
end)

ezlib:NewDiv(MainSection)

ezlib:NewCheckBox(MainSection, "Hoop Autofarm", false, function(state)
    autofarms.hoop.primary.enabled = state
end)

ezlib:NewSlider(MainSection, "Threshhold", 0, 0, 10, function(val)
    autofarms.hoop.primary.threshhold = val/100
end)

----------------------------------------------------------------------

-- Teleports

ezlib:NewTitle(TeleportSection, "Teleports")
ezlib:NewDiv(TeleportSection)

for i,v in pairs(workspace.mapCrystalsFolder:GetChildren()) do
    if string.find(v.Name, "Crystal") and v:IsA("Model") then
        ezlib:NewButton(TeleportSection, v.Name, function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.guiPart.CFrame
        end)
    end
end

ezlib:NewDiv(TeleportSection)

for i,v in pairs(workspace.rewardChests:GetChildren()) do
    if v.Name == "rewardChest" and v:IsA("Model") then
        ezlib:NewButton(TeleportSection, "Reward Chest "..i, function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame
        end)
    end
end

----------------------------------------------------------------------

-- Active

ezlib:SetActive(MainSection);

