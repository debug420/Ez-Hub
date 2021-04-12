----------------------------------------------------------------------

-- Universal Script

local ezlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Modules/EzLib.lua"))()

local DontLoad = false
if game.PlaceId ~= 2629642516 then
    ezlib:CreateNotice("Failed GameID Check", "The following exclusive that has been executed is not designed for the following game. This could cause the script to misfunction and break. Proceed anyway?", function(response)
        if response ~= "Yes" then
            DontLoad = true
        end
    end)
end
if DontLoad then return end

local Main = ezlib:NewLib("Bitcoin Miner")

----------------------------------------------------------------------

-- Initialize Sections

local MainSection = ezlib:NewSection(Main, "Main")
local TeleportSection = ezlib:NewSection(Main, "Teleports")
local BuySection = ezlib:NewSection(Main, "GPU Shop")

----------------------------------------------------------------------

-- Main Section

ezlib:NewTitle(MainSection, "Main Cheats")
ezlib:NewDiv(MainSection)

local autoexchange = false

coroutine.resume(coroutine.create(function()
    while true do
        local p = workspace["Region_ExChang1"].Display.Part.SurfaceGui.Frame.Graph.Grp["11"].AbsoluteSize.Y
        wait(5)
        if workspace["Region_ExChang1"].Display.Part.SurfaceGui.Frame.Graph.Grp["11"].AbsoluteSize.Y > p and autoexchange then
            game:GetService("ReplicatedStorage").Events.ExchangeMoney:FireServer(true)
        end
    end
end))

local antiafk = true
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    if not antiafk then return end;
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

ezlib:NewCheckBox(MainSection, "Auto Exchange", autoexchange, function(state)
    autoexchange = state;
end)

ezlib:NewCheckBox(MainSection, "Anti-AFK", antiafk, function(state)
    antiafk = state;
end)

ezlib:NewButton(MainSection, "Save Plot", function()
    for i,v in pairs(getgc()) do
        if type(v) == "function" and getfenv(v).script and getfenv(v).script.Name:lower() == "build" then
            if #(debug.getconstants(v)) == 30 and debug.getconstant(v, 30) == "FireServer" then v() end
            ezlib:NewNotif(nil, "Saved plot")
        end
    end
end)

local function getPlayerObjects(p)
    if not p then p = game.Players.LocalPlayer end
    return workspace.Buildings[p.Name]:GetChildren()
end

local function getBuildingCost(t)
    local totalCost = 0;
    for i,v in pairs(t) do
        local p = v:FindFirstChild("Price") or v:FindFirstChild("SPrice")
        totalCost = totalCost + p.Value
    end
    return totalCost;
end

ezlib:NewButton(MainSection, "Get Plot Cost", function()
    ezlib:NewNotif(nil, "Your plot is worth "..getBuildingCost(getPlayerObjects()))
end)

----------------------------------------------------------------------

-- Teleport Section

ezlib:NewTitle(TeleportSection, "Teleports")
ezlib:NewDiv(TeleportSection)

local function getTeleports()
    local t = {};
    for i,v in pairs(workspace.Teleports:GetChildren()) do
        t[v.Name:sub(4)] = v.CFrame;
    end
    return t;
end

for i,v in pairs(getTeleports()) do
    ezlib:NewButton(TeleportSection, i, function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v
    end)
end

----------------------------------------------------------------------

-- buy Section

ezlib:NewTitle(BuySection, "GPU Shop")
ezlib:NewDiv(BuySection)

local gpuOptions = {}
for i,v in pairs(workspace.Region_shop.Shows:GetChildren()) do
    if v:IsA("Model") and tonumber(v.Name) then
        local m = v:FindFirstChildOfClass("Model")
        local bps = m:FindFirstChild("bps")
        if not bps then bps = 0.00004 else bps = bps.Value end

        gpuOptions[m.Name] = {m.Price.Value, bps, v.Name};
        
    end
end

for i,v in pairs(gpuOptions) do
    ezlib:NewDesc(BuySection, i.." Price: "..tostring(v[1]).." BPS:"..v[2])
    ezlib:NewButton(BuySection, "Buy", function()
        local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(210.618622, 4.87277555, 74.0331802)
        game:GetService("ReplicatedStorage").Events.BuyCard:FireServer(i, workspace.Region_shop.Shows[v[3]])
        ezlib:NewNotif(nil, "Sent purchase request for "..i)
        wait(.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos;
    end)
    ezlib:NewDiv(BuySection)
end

----------------------------------------------------------------------

-- Active

ezlib:SetActive(MainSection);

