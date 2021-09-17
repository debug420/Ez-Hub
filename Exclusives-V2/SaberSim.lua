-- Saber Sim  Script

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("Saber Sim", nil, nil, nil, 3823781113);
local main = mainGUI.newTab("Main");
loadstring(_G["EzHubModules"]["createuniversalmodule"])().newTeleportTab(mainGUI, {
    ["Shop"] = CFrame.new(475.177917, 183.950592, 68.667984),
    ["Daily Rewards"] = CFrame.new(491.230225, 183.537842, 121.609573),
    ["Sell Area"] = CFrame.new(521.237305, 183.537842, 142.017639),
    ["Upgrade Skill"] = CFrame.new(553.974792, 183.537842, 140.078659),
    ["Boss Ring"] = CFrame.new(364.134155, 185.674408, 168.704376),
    ["Construction Site"] = CFrame.new(583.555115, 210.413422, -195.103607),
    ["Crown Shop"] = CFrame.new(725.772156, 183.787842, 169.91925),
    ["Volcano"] = CFrame.new(705.309326, 170.944824, 460.842804),
    ["Island Portal"] = CFrame.new(530.833862, 185.689117, -37.1283569)
});
loadstring(_G["EzHubModules"]["createuniversalmodule"])().newUniversalTab(mainGUI);

----------------------------------------------------------------------
-- Main Section

main.newTitle("Main Cheats");
main.newDiv();

-- Main Autofarm

local autoVars = {
    Main = false,
    Sell = false,
    BuyS = false,
    BuyD = false,
    BuyA = false,
    BuyPA = false,
    BuyJ = false,
    BuyB = false,
    Coin = false,
    Candy = false
}

local function loopThroughCoin()
    for i,v in pairs(workspace.CoinsHolder:GetChildren()) do
        if autoVars.Coin == false then break; end
        if v.ClassName == "MeshPart" then
            pcall(function() game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame end);
        end
        wait(.1);
    end
end

local function loopThroughCandy()
    for i,v in pairs(workspace.CandyHolder:GetChildren()) do
        if autoVars.Candy == false then break; end
        if v.Name == "CandyCane" then
            pcall(function() game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame end);
        end
        wait(.1);
    end
end

coroutine.resume(coroutine.create(function()
    while wait() do
        if autoVars.Coin then
            loopThroughCoin();
        end
    end
end))

coroutine.resume(coroutine.create(function()
    while wait() do
        if autoVars.Candy then
            loopThroughCandy();
        end
    end
end))

local maxJump = false;
coroutine.resume(coroutine.create(function()
    while wait() do
        pcall(function()
            if autoVars.Main then
                pcall(function() game:GetService("Players").LocalPlayer.Backpack:GetChildren()[1].Parent =
                    game:GetService("Players").LocalPlayer.Character end);
                game:GetService("ReplicatedStorage").Events.Clicked:FireServer();
            end
            if autoVars.Sell then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(531.436401, 183.537842, 144.275848);
                game:GetService("ReplicatedStorage").Events.Sell:FireServer();
            end
            if autoVars.BuyS then
                game:GetService("ReplicatedStorage").Events.BuyAll:FireServer("Swords");
            end
            if autoVars.BuyD then
                game:GetService("ReplicatedStorage").Events.BuyAll:FireServer("Backpacks");
            end
            if autoVars.BuyA then
                game:GetService("ReplicatedStorage").Events.BuyAll:FireServer("Auras");
            end
            if autoVars.BuyPA then
                game:GetService("ReplicatedStorage").Events.BuyAll:FireServer("PetAuras");
            end
            if autoVars.BuyJ then
                game:GetService("ReplicatedStorage").Events.BuyAll:FireServer("JumpBoosts");
            end
            if autoVars.BuyB then
                game:GetService("ReplicatedStorage").Events.BuyAll:FireServer("BossBoosts");
            end
            if maxJump then
                game.Players.LocalPlayer.PlayerScripts["Double Jump"].MaxJumps.Value = 99999999999;
            else
                game.Players.LocalPlayer.PlayerScripts["Double Jump"].MaxJumps.Value = 2;
            end
        end)
    end
end))

main.newCheckbox("Auto Farm", false, function(state)
    autoVars.Main = state;
end)

main.newCheckbox("Auto Sell", false, function(state)
    autoVars.Sell = state;
end)

main.newDiv();

main.newCheckbox("Auto Buy Saber", false, function(state)
    autoVars.BuyS = state;
end)

main.newCheckbox("Auto Buy DNA", false, function(state)
    autoVars.BuyD = state;
end)

main.newCheckbox("Auto Buy Aura", false, function(state)
    autoVars.BuyA = state;
end)

main.newCheckbox("Auto Buy Jump Boosts", false, function(state)
    autoVars.BuyJ = state;
end)

main.newCheckbox("Auto Buy Pet Aura", false, function(state)
    autoVars.BuyPA = state;
end)

main.newDiv();

main.newCheckbox("Auto Coin", false, function(state)
    autoVars.Coin = state;
end)

main.newCheckbox("Auto Candy", false, function(state)
    autoVars.Candy = state;
end)

main.newDiv();
main.newButton("Unlock All Islands", function()
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Gui.Submenus.Portal.Frame.ScrollingFrame.Frame:GetChildren()) do
        if v:IsA("ImageLabel") then
            v.Unlock.Visible = false;
            v.Teleport.Visible = true;
            v.IMG.Visible = true;
            if v:FindFirstChild("Locked") then v.Locked.Visible = false; end
        end
    end
    ezlib.newNotif(ezlib.enum.notifType.text, "Unlocked all islands.").play().delete();
end)

main.newCheckbox("Unlimited Jump", false, function(state)
    maxJump = state;
end)

----------------------------------------------------------------------

-- Active

mainGUI.openTab(main);
