
-- Bubble Gum Sim Script

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("Bubble Gum Simulator", nil, nil, nil, 2512643572);
local autofarm = mainGUI.newTab("Autofarm");
local teleport = mainGUI.newTab("Teleport");

----------------------------------------------------------------------

-- Get Modules
local guiservice = require(game.Players.LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.GuiService);
local inputservice = require(game.Players.LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.InputService);
local gumm = require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.GumModule);
local worldm = require(game:GetService("ReplicatedStorage").Assets.Modules.ItemDataService.WorldModule);
local worlds = require(game.Players.LocalPlayer.PlayerGui.ScreenGui.ClientScript.Modules.WorldService);

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
        blowfunc = rawget(v, "new");
    end
    if type(v) == "table" and rawget(v, "Bind") and rawget(v, "FireServer") then
        network = v;
    end
end

-- If requried functions are not found then exit out to avoid errors
if not network or not blowfunc then
    warn("Could not find network or blowfunc");
    ezlib.newNotif(ezlib.enum.notifType.longText,
    "Major Script Error", "The script could not find network and blow function memory address. You may have executed the script too early. Script aborting.").play().delete();
    return;
end

-- Maniupulate gamepass ownership by first copying original values
local cachedOwnedPasses = network:Call("GetOwnedPasses");
local modifiedTable = {};
for i,v in pairs(cachedOwnedPasses) do
    -- and manipulating the one needed to be true
    if i == "Quantum Gum" then
        cachedOwnedPasses[i] = true;
    else
        cachedOwnedPasses[i] = v;
    end
end

-- return the maniupulated table that we made
local oldNamecall;
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local m = getnamecallmethod();
    local args = {...};
    if self == network and tostring(m) == "Call" and args[1] == "GetOwnedPasses" then
        return modifiedTable;
    end
    return oldNamecall(self, ...);
end)

----------------------------------------------------------------------

-- Tween Teleport Function
local function tweenplayer(cframe)
    repeat wait() until game.Players.LocalPlayer.Character
    and not isSelling
    and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") 
    and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0;

    isTweening = true;

    local tweenInfo = TweenInfo.new(((cframe.p - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude) / 30);
    local tweenPlayer = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
    tweenInfo, {CFrame = cframe});
    tweenPlayer:Play();
    tweenPlayer.Completed:Wait(); wait(.5);

    isTweening = false;
end

-- Sell function that teleports and sells and teleports back to your original position
local function sell()
    repeat wait() until not isTweening;
    isSelling = true;
    wait(.5);
    local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
    -- Simulates mouse click on the sell button so that it's not easily detectable
    getconnections(game.Players.LocalPlayer.PlayerGui.ScreenGui.MainButtons.Sell.MouseButton1Down)[1].Function();
    wait(2);
    isSelling = false;
    tweenplayer(oldPos);
end

-- calls the blow func run and unclicks to stop the loop
local function blow()
    blowfunc():Run();
    inputservice:Unclick();
end

-- Checks bubble counter to see if backpack is full
-- The reason that I did not just check GUI max and instead bothered with getting client data
-- is because the max display did not show the true max because of the gamepass bypass code I made above
local function isBubbleFull()
    local stat = game.Players.LocalPlayer.PlayerGui.ScreenGui.StatsFrame.Bubble.Amount.Text
    local s = stat:split("/");
    if tonumber(s[1]) >= gumm[network:Call("GetClientData", 2)[2]].AirCapacity then
        return true;
    else
        return false;
    end
end

---------------------------------------

-- Take to the spawn so that the character is near the coins
local function takeToSpawn()
    if game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(70.4115906, 44.6981506, -238.785828)) > 100 then
        game.Players.LocalPlayer.Character.Humanoid.Health = 0;
        wait(2);
    end
    tweenplayer(CFrame.new(70.4115906, 44.6981506, -238.785828));
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

local autoBlow = false;
local autoSell = false;
local autoPickup = false;

coroutine.resume(coroutine.create(function()
    while wait() do

        if autoSell and isBubbleFull() then
            sell();
        end

    end
end))

coroutine.resume(coroutine.create(function()
    while wait() do

        if autoPickup and worlds:GetCurrentWorld() == "Overworld" then
            if game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(70.4115906, 44.6981506, -238.785828)) < 100 then
                takeToSpawn();
            end
            local n = nearestCoin();
            if n and not n:IsA("Model") then
                tweenplayer(n.CFrame);
            end
        end

    end
end))

coroutine.resume(coroutine.create(function()
    while wait() do

        if autoBlow and not isBubbleFull() then
            blow();
        end

    end
end))

-- _G.changeb = function(v) autoBlow = v end
-- _G.changes = function(v) autoSell = v end
-- _G.changep = function(v) autoPickup = v end

-- Teleport Locations that can be used with network
-- network:FireServer("Teleport", "LabLeaveSpawn")
-- network:FireServer("Teleport", "Sell")
-- network:FireServer("Teleport", "Buy")

-- Other random network vulns
-- network:FireServer("UnequipAllPets")
-- network:FireServer("UnequipAllHats")

local function teleportPlayer(isNetwork, location)
    if isNetwork then
        network:FireServer("Teleport", location);
    else
        worlds:SetWorld(location);
    end
end

--example of above: teleportPlayer(true, "Buy")
--same as network:FireServer("Teleport", "Buy")

----------------------------------------------------------------------

-- Autofarm Section

autofarm.newTitle("Autofarm");
autofarm.newDiv();

autofarm.newCheckbox("Auto Blow", autoBlow, function(state)
    autoBlow = state;
end)

autofarm.newCheckbox("Auto Sell", autoSell, function(state)
    autoSell = state;
end)

autofarm.newCheckbox("Auto Pick-up", autoPickup, function(state)
    autoPickup = state;
end)

----------------------------------------------------------------------

-- Teleport Section

teleport.newTitle("Teleport");
teleport.newDiv();

teleport.newButton("Sell Area", function()
    teleportPlayer(true, "Sell");
end)

teleport.newButton("Buy Area", function()
    teleportPlayer(true, "Buy");
end)

teleport.newButton("Lab Leave Spawn", function()
    teleportPlayer(true, "LabLeaveSpawn");
end)

teleport.newDiv();

for i, _ in pairs(worldm) do
    teleport.newButton(i, function()
        teleportPlayer(false, i);
    end)
end

----------------------------------------------------------------------

-- Active

mainGUI.openTab(autofarm);

