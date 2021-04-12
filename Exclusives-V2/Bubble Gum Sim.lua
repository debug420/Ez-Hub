
-- Bubble Gum Sim Script

local ezlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Modules/EzLib.lua"))()

local DontLoad = false
if game.PlaceId ~= 2512643572 then
    ezlib:CreateNotice("Failed GameID Check", "The following exclusive that has been executed is not designed for the following game. This could cause the script to misfunction and break. Proceed anyway?", function(response)
        if response ~= "Yes" then
            DontLoad = true
        end
    end)
end
if DontLoad then return end

local Main = ezlib:NewLib("Bubble Gum Simulator")

-- Get Modules
local guiservice = require(game.Players.LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.GuiService)
local inputservice = require(game.Players.LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.InputService)
local gumm = require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.GumModule)
local worldm = require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.WorldModule)
local worlds = require(game.Players.LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.WorldService)

--guiservice:CutsceneFade(false)
--guiservice:SetOverlay(false)
--guiservice:DisplayBubble(69420)

-- Var for not cancelling tweentp
local isTweening = false;
local isSelling = false;

-- Get Network
-- I switched get network to a diff method that uses garbage collection
local network;
-- for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MainButtons.Sell.MouseButton1Down)) do
--     network = getfenv(v.Function).Network;
-- end

-- Get Table for blow bubble and network
local blowfunc;
for i,v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v, "Break") and rawget(v, "BreakAll") then
        blowfunc = rawget(v, "new")
    end
    if type(v) == "table" and rawget(v, "Bind") and rawget(v, "FireServer") then
        network = v;
    end
end

-- If requried functions are not found then exit out to avoid errors
if not network or not blowfunc then
    warn("Could not find network or blowfunc")
    ezlib:CreateNotice("Major Script Error", "The script could not find network and blow function memory address. You may have executed the script too early. Script is now aborting.", function(response) end)
    return
end

-- Maniupulate gamepass ownership by first copying original values
local cachetbl = network:Call("GetOwnedPasses");
local modifiedtbl = {}
for i,v in pairs(cachetbl) do
    -- and manipulating the one needed to be true
    if i == "Quantum Gum" then
        cachetbl[i] = true; 
    else
        cachetbl[i] = v;
    end
end

-- return the maniupulated table that we made
local gm = getrawmetatable(game)
local oldnamecall = gm.__namecall
setreadonly(gm, false)
gm.__namecall = newcclosure(function(self, ...)
    local m = getnamecallmethod()
    local args = {...}
    if self == network and tostring(m) == "Call" and args[1] == "GetOwnedPasses" then
        return modifiedtbl;
    end
    return oldnamecall(self, ...);
end)
setreadonly(gm, true)

----------------------------------------------------------------------

-- Tween Teleport Function
local function tweenplayer(cframe)
    repeat wait() until game.Players.LocalPlayer.Character 
    and not isSelling;
    isTweening = true
    and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") 
    and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
    local TweenInfo = TweenInfo.new(((cframe.p - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)/30)
    local Objective = {CFrame = cframe}
    local TweenPlayer = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo, Objective)
    TweenPlayer:Play()
    TweenPlayer.Completed:Wait(); wait(.5);
    isTweening = false;
end

-- Sell function that teleports and sells and teleports back to your original position
local function sell()
    repeat wait() until isTweening == false;
    isSelling = true;
    wait(.5);
    local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    getconnections(game.Players.LocalPlayer.PlayerGui.ScreenGui.MainButtons.Sell.MouseButton1Down)[1].Function()
    wait(2)
    isSelling = false
    tweenplayer(oldpos);
end

-- calls the blow func run and unclicks to stop the loop
local function blow()
    blowfunc():Run()
    inputservice:Unclick()
end

-- Checks bubble counter to see if backpack is full
local function isBubbleFull()
    local stat = game.Players.LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Bubble.Amount.Text
    local s = stat:split("/");
    if tonumber(s[1]) >= gumm[network:Call("GetClientData", 2)[2]].AirCapacity then
        return true
    else
        return false
    end
end

---------------------------------------

-- Teleport Section

-- Take to the spawn so that the character is near the coins
local function takeToSpawn()
    if game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(70.4115906, 44.6981506, -238.785828)) > 100 then
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        wait(2)
    end
    tweenplayer(CFrame.new(70.4115906, 44.6981506, -238.785828))
end

-- Finds the nearest coin and teleports there
local function nearestCoin()
    local closest, distance = nil, 200;
    for i,v in pairs(workspace.Pickups:GetChildren()) do
        if v.Name == "Part" and v.Transparency == 0 and game.Players.LocalPlayer:DistanceFromCharacter(v.Position) < distance and (v.Position - Vector3.new(70.4115906, 44.6981506, -238.785828)).Magnitude < 250 then
            closest = v; distance = game.Players.LocalPlayer:DistanceFromCharacter(v.Position);
        end
    end
    return closest;
end

local AutoBlow = false
local AutoSell = false
local AutoPickUp = false

coroutine.resume(coroutine.create(function()
    while wait() do

        if AutoSell and isBubbleFull() then
            sell()
        end

    end
end))

coroutine.resume(coroutine.create(function()
    while wait() do

        if AutoPickUp and worlds:GetCurrentWorld() == "Overworld" then
            print("yes")
            if game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(70.4115906, 44.6981506, -238.785828)) < 100 then
                takeToSpawn();
            end
            local n = nearestCoin()
            if n and not n:IsA("Model") then
                tweenplayer(n.CFrame)
            end
        end

    end
end))

coroutine.resume(coroutine.create(function()
    while wait() do

        if AutoBlow and not isBubbleFull() then
            blow()
        end

    end
end))

-- _G.changeb = function(v) AutoBlow = v end
-- _G.changes = function(v) AutoSell = v end
-- _G.changep = function(v) AutoPickUp = v end

-- Teleport Locations that can be used with network
-- network:FireServer("Teleport", "LabLeaveSpawn")
-- network:FireServer("Teleport", "Sell")
-- network:FireServer("Teleport", "Buy")

-- Other random network vulns
-- network:FireServer("UnequipAllPets")
-- network:FireServer("UnequipAllHats")

local function teleportPlayer(isNetwork, location)
    if isNetwork then
        network:FireServer("Teleport", location)
    else
        worlds:SetWorld(location)
    end
end

--example of above: teleportPlayer(true, "Buy")
--same as network:FireServer("Teleport", "Buy")

----------------------------------------------------------------------

-- Initialize Sections

local AutoSection = ezlib:NewSection(Main, "Autofarm")
local TeleportSection = ezlib:NewSection(Main, "Teleport")

----------------------------------------------------------------------

-- Get Modules
local guiservice = require(game.Players.LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.GuiService)
local inputservice = require(game.Players.LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.InputService)
local gumm = require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.GumModule)
local worldm = require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.WorldModule)
local worlds = require(game.Players.LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.WorldService)

--guiservice:CutsceneFade(false)
--guiservice:SetOverlay(false)
--guiservice:DisplayBubble(69420)

-- Var for not cancelling tweentp
local isTweening = false;
local isSelling = false;

-- Get Network
-- I switched get network to a diff method that uses garbage collection
local network;
-- for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MainButtons.Sell.MouseButton1Down)) do
--     network = getfenv(v.Function).Network;
-- end

-- Get Table for blow bubble and network
local blowfunc;
for i,v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v, "Break") and rawget(v, "BreakAll") then
        blowfunc = rawget(v, "new")
    end
    if type(v) == "table" and rawget(v, "Bind") and rawget(v, "FireServer") then
        network = v;
    end
end

-- If requried functions are not found then exit out to avoid errors
if not network or not blowfunc then
    warn("Could not find network or blowfunc")
    ezlib:CreateNotice("Major Script Error", "The script could not find network and blow function memory address. You may have executed the script too early. Script is now aborting.", function(response) end)
    return
end

-- Maniupulate gamepass ownership by first copying original values
local cachetbl = network:Call("GetOwnedPasses");
local modifiedtbl = {}
for i,v in pairs(cachetbl) do
    -- and manipulating the one needed to be true
    if i == "Quantum Gum" then
        cachetbl[i] = true; 
    else
        cachetbl[i] = v;
    end
end

-- return the maniupulated table that we made
local gm = getrawmetatable(game)
local oldnamecall = gm.__namecall
setreadonly(gm, false)
gm.__namecall = newcclosure(function(self, ...)
    local m = getnamecallmethod()
    local args = {...}
    if self == network and tostring(m) == "Call" and args[1] == "GetOwnedPasses" then
        return modifiedtbl;
    end
    return oldnamecall(self, ...);
end)
setreadonly(gm, true)

----------------------------------------------------------------------

local spawnPointBasedOnIsland = Vector3.new(70.4115906, 44.6981506, -238.785828)

-- Tween Teleport Function
local function tweenplayer(cframe)
    repeat wait() until game.Players.LocalPlayer.Character 
    and not isSelling;
    isTweening = true
    and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") 
    and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
    local TweenInfo = TweenInfo.new(((cframe.p - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)/30)
    local Objective = {CFrame = cframe}
    local TweenPlayer = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo, Objective)
    TweenPlayer:Play()
    TweenPlayer.Completed:Wait(); wait(.5);
    isTweening = false;
end

-- Sell function that teleports and sells and teleports back to your original position
local function sell()
    repeat wait() until isTweening == false;
    isSelling = true;
    wait(.5);
    local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    getconnections(game.Players.LocalPlayer.PlayerGui.ScreenGui.MainButtons.Sell.MouseButton1Down)[1].Function()
    wait(2)
    isSelling = false
    tweenplayer(oldpos);
end

-- calls the blow func run and unclicks to stop the loop
local function blow()
    blowfunc():Run()
    inputservice:Unclick()
end

-- Checks bubble counter to see if backpack is full
local function isBubbleFull()
    local stat = game.Players.LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Bubble.Amount.Text
    local s = stat:split("/");
    if tonumber(s[1]) >= gumm[network:Call("GetClientData", 2)[2]].AirCapacity then
        return true
    else
        return false
    end
end

---------------------------------------

-- Teleport Section

-- Take to the spawn so that the character is near the coins
local function takeToSpawn()
    if game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(70.4115906, 44.6981506, -238.785828)) > 100 then
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        wait(2)
    end
    tweenplayer(CFrame.new(70.4115906, 44.6981506, -238.785828))
end

-- Finds the nearest coin and teleports there
local function nearestCoin()
    local closest, distance = nil, 200;
    for i,v in pairs(workspace.Pickups:GetChildren()) do
        if v.Name == "Part" and v.Transparency == 0 and game.Players.LocalPlayer:DistanceFromCharacter(v.Position) < distance and (v.Position - Vector3.new(70.4115906, 44.6981506, -238.785828)).Magnitude < 250 then
            closest = v; distance = game.Players.LocalPlayer:DistanceFromCharacter(v.Position);
        end
    end
    return closest;
end

local AutoBlow = false
local AutoSell = false
local AutoPickUp = false

coroutine.resume(coroutine.create(function()
    while wait() do

        if AutoSell and isBubbleFull() then
            sell()
        end

    end
end))

coroutine.resume(coroutine.create(function()
    while wait() do

        if AutoPickUp and worlds:GetCurrentWorld() == "Overworld" then
            print("yes")
            if game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(70.4115906, 44.6981506, -238.785828)) < 100 then
                takeToSpawn();
            end
            local n = nearestCoin()
            if n and not n:IsA("Model") then
                tweenplayer(n.CFrame)
            end
        end

    end
end))

coroutine.resume(coroutine.create(function()
    while wait() do

        if AutoBlow and not isBubbleFull() then
            blow()
        end

    end
end))

-- _G.changeb = function(v) AutoBlow = v end
-- _G.changes = function(v) AutoSell = v end
-- _G.changep = function(v) AutoPickUp = v end

-- Teleport Locations that can be used with network
-- network:FireServer("Teleport", "LabLeaveSpawn")
-- network:FireServer("Teleport", "Sell")
-- network:FireServer("Teleport", "Buy")

-- Other random network vulns
-- network:FireServer("UnequipAllPets")
-- network:FireServer("UnequipAllHats")

local function teleportPlayer(isNetwork, location)
    if isNetwork then
        network:FireServer("Teleport", location)
    else
        worlds:SetWorld(location)
    end
end

--example of above: teleportPlayer(true, "Buy")
--same as network:FireServer("Teleport", "Buy")

----------------------------------------------------------------------

-- Autofarm Section

ezlib:NewTitle(AutoSection, "Autofarm")
ezlib:NewDiv(AutoSection)

ezlib:NewCheckBox(AutoSection, "Auto Blow", AutoBlow, function(state)
    AutoBlow = state
end)

ezlib:NewCheckBox(AutoSection, "Auto Sell", AutoSell, function(state)
    AutoSell = state
end)

ezlib:NewCheckBox(AutoSection, "Auto Pick-up", AutoPickUp, function(state)
    AutoPickUp = state
end)

----------------------------------------------------------------------

-- Teleport Section

ezlib:NewTitle(TeleportSection, "Teleport")
ezlib:NewDiv(TeleportSection)

ezlib:NewButton(TeleportSection, "Sell Area", function()
    teleportPlayer(true, "Sell")
end)

ezlib:NewButton(TeleportSection, "Buy Area", function()
    teleportPlayer(true, "Buy")
end)

ezlib:NewButton(TeleportSection, "Lab Leave Spawn", function()
    teleportPlayer(true, "LabLeaveSpawn")
end)

ezlib:NewDiv(TeleportSection)

for i, _ in pairs(worldm) do
    ezlib:NewButton(TeleportSection, i, function()
        teleportPlayer(false, i)
    end)
end

----------------------------------------------------------------------

-- Active

ezlib:SetActive(AutoSection);

