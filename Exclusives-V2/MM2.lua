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

loadstring(_G["EzHubModules"]["createespmodule"])().newESPTab(mainGUI, function()
    
    local espConfig = {
        -- Toggle
        enabled = false,
        -- ESP Elements
        tracer = true,
        headdot = true,
        tag = true,
        -- ESP Behaviour
        locktocursor = false,
        renderrange = 2000,
        teamcheck = false,
        -- ESP Color
        rainbowcolor = false,
        rainbowspeed = 2,
        setcolor = {255, 255, 255},
        teamcolor = true,
        -- ESP offsets
        xoffset = 2.8,
        yoffsetabovehead = 1.5,
        yoffsetbelowhead = 5.5,
        tagoffset = 8,
        -- Headdot Settings
        headdotfilled = false,
        headdotscale = 2.5
    }
    
    local drawESP;
    local espmem = {};
    local conmem = {};
    
    ----------------------------------------------------------------------
    
    local function getVector3D(vector3)
        local vector, onScreen = workspace.CurrentCamera:WorldToViewportPoint(vector3);
        return {Vector2.new(vector.X, vector.Y), onScreen, vector.Z};
    end
    
    local rainbowcs;
    coroutine.wrap(function()
        while wait() do
            local i = 0;
            repeat
                i = i + (0.001 * espConfig.rainbowspeed);
                rainbowcs = Color3.fromHSV(i,1,1);  --creates a color using i
                wait();
            until i >= 1;
        end
    end)()
    local function getESPColor(playerinstance)
        if not playerinstance then return Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255) end 
        if espConfig.rainbowcolor then
            return rainbowcs or Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255);
        elseif espConfig.teamcolor then
            return (findMurder() == playerinstance and Color3.fromRGB(255, 0, 0)) 
            or (findSheriff() == playerinstance and Color3.fromRGB(0, 0, 255))
            or Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255);
        elseif espConfig.setcolor then
            return Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255);
        end
    end
    
    local function getTracerPoint()
        if espConfig.locktocursor then
            return Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y) + Vector2.new(0, 36);
        else
            return Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y);
        end
    end
    
    local function checkTeam(player)
        if espConfig.teamcheck and player and player.Parent then
            return game:GetService("Players"):FindFirstChild(player.Name).Team ~= game:GetService("Players").LocalPlayer.Team;
        else
            return true;
        end
    end
    
    drawESP = function(player)
        if not player or not player:FindFirstChild("Humanoid") then return end
        if player:FindFirstChild("Humanoid") then
    
            local cachedparent = player.Parent;
    
            -- Make ESP Drawings Mem container
            espmem[player] = {};
    
            -- Tracer
            espmem[player].Tracer = Drawing.new("Line");
    
            -- Box around Player Drawing
            espmem[player].Up = Drawing.new("Line");
            espmem[player].Down = Drawing.new("Line");
            espmem[player].Left = Drawing.new("Line");
            espmem[player].Right = Drawing.new("Line");
    
            -- Headdot
            espmem[player].Headdot = Drawing.new("Circle");
    
            -- Texttag
            espmem[player].Tag = Drawing.new("Text");  -- Name
    
            -- Start Updating ESP
            spawn(function()
    
                conmem[player] = game:GetService("RunService").RenderStepped:Connect(function()
                    
                    -- Initiate Variables
                    local point = getVector3D(player.Head.Position)[1];
                        
                    -- Tracer
                    if getVector3D(player.Head.Position)[2] and espConfig.enabled and espConfig.tracer and espConfig.renderrange > getVector3D(player.Head.Position)[3] and checkTeam(player) and espmem[player].Tracer then
                        local tracer = espmem[player].Tracer; if not tracer then return end;
                        tracer.Thickness = 1;
                        tracer.From = getTracerPoint();
                        tracer.To = point;
                        tracer.Color = getESPColor(game:GetService("Players"):FindFirstChild(player.Name));
                        tracer.Visible = true;
                    elseif espmem[player].Tracer then
                        if not pcall(function()
                            espmem[player].Tracer.Visible = false;
                        end) then
                            conmem[player]:Disconnect();
                        end
                    else
                        conmem[player]:Disconnect();
                    end
    
                    -- ESP Box
                    local headcframe = player.Head.CFrame;
    
                    -- Calculate CFrame
                    local tl = headcframe * CFrame.new(-(espConfig.xoffset), espConfig.yoffsetabovehead, 0);
                    local tr = headcframe * CFrame.new(espConfig.xoffset, espConfig.yoffsetabovehead, 0);
                    local bl = headcframe * CFrame.new(-(espConfig.xoffset),-(espConfig.yoffsetbelowhead),0);
                    local br = headcframe * CFrame.new(espConfig.xoffset,-(espConfig.yoffsetbelowhead),0);
                
                    if getVector3D(player.Head.Position)[2] and espConfig.enabled and espConfig.renderrange > getVector3D(player.Head.Position)[3] and checkTeam(player) and espmem[player].Up and espmem[player].Down and espmem[player].Right and espmem[player].Left then
    
                        -- Top Line
                        espmem[player].Up.From = getVector3D(tl.p)[1];
                        espmem[player].Up.To = getVector3D(tr.p)[1];
                        espmem[player].Up.Thickness = 1;
                        espmem[player].Up.Color = getESPColor(game:GetService("Players"):FindFirstChild(player.Name));
    
                        -- Left Line
                        espmem[player].Left.From = getVector3D(tl.p)[1];
                        espmem[player].Left.To = getVector3D(bl.p)[1];
                        espmem[player].Left.Thickness = 1;
                        espmem[player].Left.Color = getESPColor(game:GetService("Players"):FindFirstChild(player.Name));
    
                        -- Right Line
                        espmem[player].Right.From = getVector3D(tr.p)[1];
                        espmem[player].Right.To = getVector3D(br.p)[1];
                        espmem[player].Right.Thickness = 1;
                        espmem[player].Right.Color = getESPColor(game:GetService("Players"):FindFirstChild(player.Name));
    
                        -- Bottom Line
                        espmem[player].Down.From = getVector3D(bl.p)[1];
                        espmem[player].Down.To = getVector3D(br.p)[1];
                        espmem[player].Down.Thickness = 1;
                        espmem[player].Down.Color = getESPColor(game:GetService("Players"):FindFirstChild(player.Name));
    
                        espmem[player].Down.Visible = true;
                        espmem[player].Right.Visible = true;
                        espmem[player].Left.Visible = true;
                        espmem[player].Up.Visible = true;
                        
                    elseif espmem[player].Up and espmem[player].Down and espmem[player].Right and espmem[player].Left then
                        if not pcall(function()
                            espmem[player].Down.Visible = false;
                            espmem[player].Right.Visible = false;
                            espmem[player].Left.Visible = false;
                            espmem[player].Up.Visible = false;
                        end) then
                            conmem[player]:Disconnect();
                        end
                    else
                        conmem[player]:Disconnect();
                    end
    
                    -- Head Dot
                    if getVector3D(player.Head.Position)[2] and espConfig.enabled and espConfig.headdot and espConfig.renderrange > getVector3D(player.Head.Position)[3] and checkTeam(player) and espmem[player].Headdot then
                        espmem[player].Headdot.Position = point;
                        espmem[player].Headdot.Filled = espConfig.headdotfilled;
                        espmem[player].Headdot.Color = getESPColor(game:GetService("Players"):FindFirstChild(player.Name));
                        espmem[player].Headdot.NumSides = 30;
                        espmem[player].Headdot.Thickness = 1;
    
                        -- Head dot radius
                        local Scale = player.Head.Size.Y / espConfig.headdotscale;
                        local Top = workspace.CurrentCamera:WorldToViewportPoint((headcframe * CFrame.new(0, Scale, 0)).Position);
                        local Bottom = workspace.CurrentCamera:WorldToViewportPoint((headcframe * CFrame.new(0, -Scale, 0)).Position);
                        espmem[player].Headdot.Radius = math.abs((Top - Bottom).y); -- Synapse gets absolute value by default by exploits like KRNL and Scriptware don't
                        -- Causing the circle to not be rendered if radius is a negative value (which makes sense)
    
                        espmem[player].Headdot.Visible = true;
                    elseif espmem[player].Headdot then
                        if not pcall(function()
                            espmem[player].Headdot.Visible = false;
                        end) then
                            conmem[player]:Disconnect();
                        end
                    else
                        conmem[player]:Disconnect();
                    end
                    
                    -- Tag
                
                    if getVector3D(player.Head.Position)[2] and espConfig.enabled and espConfig.tag and espConfig.renderrange > getVector3D(player.Head.Position)[3] and checkTeam(player) and espmem[player].Tag then
    
                        local ScreenPositionUpper = workspace.CurrentCamera:WorldToViewportPoint((player.HumanoidRootPart:GetRenderCFrame() * CFrame.new(0, player.Head.Size.Y + player.HumanoidRootPart.Size.Y + (espConfig.tagoffset - 200 / 25), 0)).Position);
                        if espmem[player].Tag.Font and Drawing and Drawing.Fonts then
                            espmem[player].Tag.Font = Drawing.Fonts.Monospace;
                        end
    
                        espmem[player].Tag.Visible = true;
                        espmem[player].Tag.Center = true;
                        espmem[player].Tag.Color = getESPColor(game:GetService("Players"):FindFirstChild(player.Name));
                        espmem[player].Tag.Outline = true;
                        espmem[player].Tag.Position = Vector2.new(ScreenPositionUpper.X, ScreenPositionUpper.Y) - Vector2.new(0, espmem[player].Tag.TextBounds.Y);
                        espmem[player].Tag.Text = (player.Name or "Unknown").." | ["..math.floor(getVector3D(player.Head.Position)[3]).."]";
                    elseif espmem[player].Tag then
                        if not pcall(function()
                            espmem[player].Tag.Visible = false;
                        end) then
                            conmem[player]:Disconnect();
                        end
                    else
                        conmem[player]:Disconnect();
                    end
    
                end)
    
                -- Wait until player character is dead/leaves ect
                while true do
                    game:GetService("RunService").RenderStepped:Wait()
                    if not game:GetService("Players"):FindFirstChild(player.Name) or not player or not player:FindFirstChild("Humanoid") or player.Parent ~= cachedparent or player.Humanoid.Health == 0 or not player:FindFirstChild("Head") or not espmem[player] then
                        break;
                    end
                end
                pcall(function() conmem[player]:Disconnect() end)
                for _,v in pairs(espmem[player]) do
                    if v then pcall(function() v:Remove() end) end
                end
            end)
        end
    end
    
    ----------------------------------------------------------------------
    
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Name ~= game.Players.LocalPlayer.Name then
            drawESP(player.Character);
            player.CharacterAdded:Connect(function()
                delay(0.5, function()
                    drawESP(player.Character);
                end)
            end)
        end	
    end
    
    game:GetService("Players").PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            delay(0.5, function()
                drawESP(player.Character);
            end)
        end)
    end)
    
    ----------------------------------------------------------------------
    
    _G.change = function(p, v)
        espConfig[p] = v;
    end
    
    if _G.unload then _G.unload(); end
    
    _G.unload = function()
        drawESP = function() return; end
        for i,v in pairs(conmem) do
            v:Disconnect();
        end
        for i,v in pairs(espmem) do
            if type(v) == "table" then
                for ii, vv in pairs(v) do
                    if vv then pcall(function() vv:Remove() end) end
                end
            end
        end
    end
    
    return espConfig;
    
end)

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
