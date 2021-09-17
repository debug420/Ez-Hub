
-- Bitcoin Miner Script (The game, not an actual miner lmao)

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("Bitcoin Miner", nil, nil, nil, 2629642516);
local mainTab = mainGUI.newTab("Main");
loadstring(_G["EzHubModules"]["createuniversalmodule"])().newTeleportTab(mainGUI, (function()
    local t = {};
    for i,v in pairs(workspace.Teleports:GetChildren()) do
        t[v.Name:sub(4)] = v.CFrame;
    end
    return t;
end)());

local buyTab = mainGUI.newTab("GPU Shop");

----------------------------------------------------------------------

-- Main Section

mainTab.newTitle("Main Cheats");
mainTab.newDiv();

local autoExchange = false;

coroutine.wrap(function()
    while true do
        local price = tonumber(({string.gsub(workspace["Region_ExChang1"].Display.Part.SurfaceGui.Frame.Csh.Value.Text, " Cash", "")})[1]);
        wait(5)
        -- Makes sure to sell when the price goes higher. Of course, not the best method but the easiest to implement
        local newPrice = tonumber(({string.gsub(workspace["Region_ExChang1"].Display.Part.SurfaceGui.Frame.Csh.Value.Text, " Cash", "")})[1]);
        if newPrice > price
        and autoExchange then
            game:GetService("ReplicatedStorage").Events.ExchangeMoney:FireServer(true);
        end
    end
end)();

local antiAFK = true;
game:GetService("Players").LocalPlayer.Idled:connect(function()
    if not antiAFK then return end;
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame);
    wait(1);
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame);
end)

mainTab.newCheckbox("Auto Exchange", autoExchange, function(state)
    autoExchange = state;
end)

mainTab.newCheckbox("Anti-AFK", antiAFK, function(state)
    antiAFK = state;
end)

-- Most of these functions were going to be used for
-- an autobuild system. I later decided that I can not be
-- bothered doing it and instead invested my time in something else
-- The functions are implemented so if you want to continue the legacy feel free

mainTab.newButton("Save Plot", function()
    for i,v in pairs(getgc()) do
        if type(v) == "function" and getfenv(v).script and getfenv(v).script.Name:lower() == "build" then
            if #(debug.getconstants(v)) == 30 and debug.getconstant(v, 30) == "FireServer" then v(); end
            coroutine.wrap(function()
                ezlib.newNotif(ezlib.enum.notifType.text, "Saved plot").play().delete();
            end)();
            return;
        end
    end
end)

local function getPlayerObjects(p)
    if not p then p = game.Players.LocalPlayer; end
    return workspace.Buildings[p.Name]:GetChildren();
end

local function getBuildingCost(t)
    local totalCost = 0;
    for i,v in pairs(t) do
        local p = v:FindFirstChild("Price") or v:FindFirstChild("SPrice");
        totalCost = totalCost + p.Value;
    end
    return totalCost;
end

mainTab.newButton("Get Plot Cost", function()
    ezlib.newNotif(ezlib.enum.notifType.text, "Your plot is worth "..getBuildingCost(getPlayerObjects())).play().delete();
end)

----------------------------------------------------------------------

-- buy Section

buyTab.newTitle("GPU Shop");
buyTab.newDiv();

local gpuOptions = {};
for i,v in pairs(workspace.Region_shop.Shows:GetChildren()) do
    if v:IsA("Model") and tonumber(v.Name) then
        local m = v:FindFirstChildOfClass("Model");
        local bps = m:FindFirstChild("bps");
        if not bps then bps = 0.00004 else bps = bps.Value; end
        gpuOptions[m.Name] = {m.Price.Value, bps, v.Name};
    end
end

for i,v in pairs(gpuOptions) do
    buyTab.newDesc(i.." Price: "..tostring(v[1]).." BPS:"..v[2]);
    buyTab.newButton("Buy", function()
        local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(210.618622, 4.87277555, 74.0331802);
        wait();
        game:GetService("ReplicatedStorage").Events.BuyCard:FireServer(i, workspace.Region_shop.Shows[v[3]]);
        coroutine.wrap(function() 
            ezlib.newNotif(ezlib.enum.notifType.longText, "Sent purchase request for "..i).play().delete();
        end)();
        wait(.5);
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos;
    end)
    buyTab.newDiv();
end

----------------------------------------------------------------------

-- Active

mainGUI.openTab(mainTab);

