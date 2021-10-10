-- MM2 Script

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("MM2", nil, nil, nil, 142823291);
local main = mainGUI.newTab("Main");
local emote = mainGUI.newTab("Emotes");
loadstring(_G["EzHubModules"]["createaimbotmodule"])().newAimbotTab(mainGUI);


----------------------------------------------------------------------

-- Main Section

main.newTitle("Main Cheats");
main.newDiv();

local function findMurder()
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Character and v.Character:FindFirstChild("Knife") or v.Backpack:FindFirstChild("Knife") then
            return v;
        end
    end
end

local function findSheriff()
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Character and v.Character:FindFirstChild("Revolver") or v.Backpack:FindFirstChild("Revolver") then
            return v;
        end
        if v.Character and v.Character:FindFirstChild("Gun") or v.Backpack:FindFirstChild("Gun") then
            return v;
        end
    end
end

main.newButton("Find Murderer", function()
    if findMurder() then 
        ezlib.newNotif(ezlib.enum.notifType.text, "Murderer: "..findMurder().Name)
        .play().delete();
    else
        ezlib.newNotif(ezlib.enum.notifType.text, "Unable to find murderer").play().delete();
    end
end)

main.newButton("TP to Murderer", function()
    if findMurder() then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        findMurder().Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0);
    else
        ezlib.newNotif(ezlib.enum.notifType.text, "Unable to find murderer").play().delete();
    end
end)

main.newButton("Find Sheriff", function()
    if findSheriff() then
        ezlib.newNotif(ezlib.enum.notifType.text, "Sheriff: "..findSheriff().Name)
        .play().delete();
    else
        ezlib.newNotif(ezlib.enum.notifType.text, "Unable to find sheriff").play().delete();
    end
end)

main.newButton("TP to Sheriff", function()
    if findSheriff() then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
        findSheriff().Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0);
    else
        ezlib.newNotif(ezlib.enum.notifType.text, "Unable to find sheriff").play().delete();
    end
end)

----------------------------------------------------------------------

local autofarmEnabled = false

local function findMap()
    for i,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("CoinContainer") then
            return v;
        end
    end
end

local function isInRound()
    return game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Waiting.Visible == false;
end

local function getClosestCoin()
    if not isInRound() then return false end
    -- find map, and prepare vars
    local closest, map = nil, findMap();
    if not map then return false end

    -- make table of closest of coins in terms of distance
    local t = {};
    for i,v in pairs(findMap().CoinContainer:GetChildren()) do
        if v.Name ~= "CollectedCoin" then
            table.insert(t, 1, {v, game:GetService("Players").LocalPlayer:DistanceFromCharacter(v.Position)});
        end
    end

    -- Sort table for computation
    table.sort(t, function(a,b)
        return a[2] < b[2];
    end)

    -- compute closest coin that is accessible
    for _, v in pairs(t) do
        local pathfinding = game:GetService("PathfindingService");
        local path = pathfinding:CreatePath();
        path:ComputeAsync(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, v[1].Position);
        if path.Status == Enum.PathStatus.Success then
            closest = path;
            break;
        end
    end

    -- return
    return closest;
end

local controls = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule")):GetControls();
local moveOnEvent = Instance.new("BindableEvent");

coroutine.wrap(function()
    while wait() do
        pcall(function()
            if not isInRound() then
                moveOnEvent:Fire();
            end
            if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                moveOnEvent:Fire();
            end
        end)
    end
end)()

local function connectEvent()
    spawn(function()
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").MoveToFinished:Connect(function(reached)
            moveOnEvent:Fire();
        end)
    end)
end
connectEvent();
game.Players.LocalPlayer.CharacterAdded:Connect(connectEvent);

coroutine.resume(coroutine.create(function()
    while wait() do
        if autofarmEnabled then
            local s, e = pcall(function()
                -- Initialize and call nesseccary functions
                local returnVal = getClosestCoin();
                if type(returnVal) == "boolean" or returnVal == nil then return end;

                -- Disable controls so moveto is not yielded
                controls:Disable();

                -- Loop through computed path
                for i,v in pairs(returnVal:GetWaypoints()) do
                    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.Humanoid.Health > 0 and isInRound() then
                        game.Players.LocalPlayer.Character.Humanoid:MoveTo(v.Position);
                        if v.Action == Enum.PathWaypointAction.Jump then
                            game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
                        end
                        moveOnEvent.Event:Wait();
                    else
                        return;
                    end
                end
            end)
            -- Enable controlers
            controls:Enable()
        end
    end
end))

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame);
    wait(1);
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame);
end)

main.newCheckbox("Autofarm", false, function(state)
    autofarmEnabled = state;
    ezlib.newNotif(ezlib.enum.notifType.text, state and "Initializing autofarm..."
    or "Disabled autofarm").play().delete();
    controls:Enable();
end)

----------------------------------------------------------------------

-- ESP Section

loadstring(_G["EzHubModules"]["createespmodule"])().newESPTab(mainGUI);

----------------------------------------------------------------------

-- Emote Section

emote.newTitle("Emotes");
emote.newDiv();

local function playEmote(emote)
    game:GetService("ReplicatedStorage").PlayEmote:Fire(emote);
end

emote.newButton("Zen", function()
    playEmote("zen");
end)

emote.newButton("Sit", function()
    playEmote("sit");
end)

emote.newButton("Zombie", function()
    playEmote("zombie");
end)

emote.newButton("Spray Paint", function()
    playEmote("SprayPaint");
end)

emote.newButton("Floss", function()
    playEmote("floss");
end)

emote.newButton("Dab", function()
    playEmote("dab");
end)

emote.newButton("Ninja", function()
    playEmote("ninja");
end)

----------------------------------------------------------------------

-- Active

mainGUI.openTab(main);
