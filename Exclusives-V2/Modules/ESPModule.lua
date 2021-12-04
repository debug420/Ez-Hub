-- unload old esp (if it exists)
if _G.unloadESP then _G.unloadESP(); end

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
    xoffset = 1.6,
    yoffsetaboveorigin = 2.5,
    yoffsetbeloworigin = 3.5,
    tagoffset = 8,
    -- Headdot Settings
    headdotfilled = false,
    headdotscale = 2.5
}

local isPhantom = (game.PlaceId == 292439477 and _G.getBodyparts and
_G.getPlayerInstanceFromCharacter and _G.getCharacterFromPlayerInstance);

local isMM2 = (game.PlaceId == 142823291);

local drawESP;
local espmem = {};
local conmem = {};

----------------------------------------------------------------------
-- The reason that certain functions are stored in espConfig is because certain games may require specific modifications to functions
-- This is so that I don't have to copy and paste the entire ESP module code for each game that requires minor changes

local function getVector3D(vector3)
    local vector, onScreen = workspace.CurrentCamera:WorldToViewportPoint(vector3);
    return {Vector2.new(vector.X, vector.Y), onScreen, vector.Z};
end

espConfig.rainbowcs = nil;
coroutine.wrap(function()
    while wait() do
        local i = 0;
        repeat
            i = i + (0.001 * espConfig.rainbowspeed);
            espConfig.rainbowcs = Color3.fromHSV(i,1,1);  --creates a color using i
            wait();
        until i >= 1;
    end
end)();

local function getESPColor(playerinstance)
    if not playerinstance then
        return Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3])
    end
    if espConfig.rainbowcolor then
        return espConfig.rainbowcs or Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]);
    elseif espConfig.teamcolor then
        if isMM2 then
            return (findMurder() == playerinstance and Color3.fromRGB(255, 0, 0))
            or (findSheriff() == playerinstance and Color3.fromRGB(0, 0, 255))
            or Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3])
        else
            return playerinstance.TeamColor.Color or Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255);
        end
    elseif espConfig.setcolor then
        return Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]);
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
        if isPhantom then
            return _G.getPlayerInstanceFromCharacter(player).Team ~= game.Players.LocalPlayer.Team;
        else
            return game:GetService("Players"):FindFirstChild(player.Name).Team ~= game:GetService("Players").LocalPlayer.Team;
        end
    else
        return true;
    end
end

drawESP = function(player)
    if not player or not (isPhantom and player:FindFirstChild("Left Arm") or player:FindFirstChild("Humanoid")) then return end
    
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

        local renderESPConnection = Instance.new("BindableEvent");
        coroutine.wrap(function()
            while game:GetService("RunService").RenderStepped:Wait() do
                renderESPConnection:Fire();
            end
        end)()

        conmem[player] = renderESPConnection.Event:Connect(function()
            if not (isPhantom and player:FindFirstChild("Left Arm") or player:FindFirstChild("Head")) then return end;

            -- Initiate Variables
            local point = getVector3D(player.Head.Position)[1];
            local espColor = getESPColor(isPhantom and _G.getPlayerInstanceFromCharacter(player) or game:GetService("Players"):FindFirstChild(player.Name));

            -- Tracer
            if getVector3D(player.Head.Position)[2] and espConfig.enabled and espConfig.tracer and espConfig.renderrange > getVector3D(player.Head.Position)[3] and checkTeam(player) and espmem[player].Tracer then
                local tracer = espmem[player].Tracer; if not tracer then return end;
                tracer.Thickness = 1;
                tracer.From = getTracerPoint();
                tracer.To = point;
                tracer.Color = espColor;
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
            local espBoxOriginCFrame;
            if player:FindFirstChild("Torso") and player.Torso:IsA("BasePart") then espBoxOriginCFrame = player.Torso.CFrame:ToWorldSpace();
            elseif player:FindFirstChild("LowerTorso") and player.LowerTorso:IsA("BasePart")
                and player:FindFirstChild("UpperTorso") and player.UpperTorso:IsA("BasePart") then
                espBoxOriginCFrame = CFrame.new(((player:FindFirstChild("LowerTorso").Position) + (player:FindFirstChild("UpperTorso").Position)) / 2):ToWorldSpace();
            elseif player:FindFirstChild("Head") then espBoxOriginCFrame = player:FindFirstChild("Head").CFrame:ToWorldSpace();
            else
                espBoxOriginCFrame = player:FindFirstChild("HumanoidRootPart").CFrame:ToWorldSpace();
            end

            -- Calculate CFrame
            -- Variables stand for the corresponding box corner - tl = top left
            local tl = espBoxOriginCFrame * CFrame.new(-(espConfig.xoffset), espConfig.yoffsetaboveorigin, 0);
            local tr = espBoxOriginCFrame * CFrame.new(espConfig.xoffset, espConfig.yoffsetaboveorigin, 0);
            local bl = espBoxOriginCFrame * CFrame.new(-(espConfig.xoffset), -(espConfig.yoffsetbeloworigin), 0);
            local br = espBoxOriginCFrame * CFrame.new(espConfig.xoffset, -(espConfig.yoffsetbeloworigin), 0);
        
            if getVector3D(player.Head.Position)[2] and espConfig.enabled and espConfig.renderrange > getVector3D(player.Head.Position)[3] and checkTeam(player) and espmem[player].Up and espmem[player].Down and espmem[player].Right and espmem[player].Left then

                -- Top Line
                espmem[player].Up.From = getVector3D(tl.p)[1];
                espmem[player].Up.To = getVector3D(tr.p)[1];
                espmem[player].Up.Thickness = 1;
                espmem[player].Up.Color = espColor;

                -- Left Line
                espmem[player].Left.From = getVector3D(tl.p)[1];
                espmem[player].Left.To = getVector3D(bl.p)[1];
                espmem[player].Left.Thickness = 1;
                espmem[player].Left.Color = espColor;

                -- Right Line
                espmem[player].Right.From = getVector3D(tr.p)[1];
                espmem[player].Right.To = getVector3D(br.p)[1];
                espmem[player].Right.Thickness = 1;
                espmem[player].Right.Color = espColor;

                -- Bottom Line
                espmem[player].Down.From = getVector3D(bl.p)[1];
                espmem[player].Down.To = getVector3D(br.p)[1];
                espmem[player].Down.Thickness = 1;
                espmem[player].Down.Color = espColor;

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
                espmem[player].Headdot.Color = espColor;
                espmem[player].Headdot.NumSides = 15;
                espmem[player].Headdot.Thickness = 1;

                -- Head dot radius
                local Scale = player.Head.Size.Y / espConfig.headdotscale;
                local Top = workspace.CurrentCamera:WorldToViewportPoint((player.Head.CFrame * CFrame.new(0, Scale, 0)).Position);
                local Bottom = workspace.CurrentCamera:WorldToViewportPoint((player.Head.CFrame * CFrame.new(0, -Scale, 0)).Position);

                -- Synapse gets absolute value by default but exploits like KRNL and Scriptware don't
                -- Causing the circle to not be rendered if radius is a negative value (which makes sense)
                espmem[player].Headdot.Radius = math.abs((Top - Bottom).y);

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

                local ScreenPositionUpper;
                if isPhantom then
                    ScreenPositionUpper = workspace.CurrentCamera:WorldToViewportPoint((player.Torso:GetRenderCFrame() * CFrame.new(0, player.Head.Size.Y + player.Torso.Size.Y + (espConfig.tagoffset - 200 / 25), 0)).Position);
                else
                    ScreenPositionUpper = workspace.CurrentCamera:WorldToViewportPoint((player.HumanoidRootPart:GetRenderCFrame() * CFrame.new(0, player.Head.Size.Y + player.HumanoidRootPart.Size.Y + (espConfig.tagoffset - 200 / 25), 0)).Position);
                end

                if espmem[player].Tag.Font and Drawing and Drawing.Fonts then
                    espmem[player].Tag.Font = Drawing.Fonts.Monospace;
                end

                espmem[player].Tag.Visible = true;
                espmem[player].Tag.Center = true;
                espmem[player].Tag.Color = espColor;
                espmem[player].Tag.Outline = true;
                espmem[player].Tag.Position = Vector2.new(ScreenPositionUpper.X, ScreenPositionUpper.Y) - Vector2.new(0, espmem[player].Tag.TextBounds.Y);
                
                playerName = isPhantom and _G.getPlayerInstanceFromCharacter(player).Name or player.Name;
                espmem[player].Tag.Text = (playerName or "Unknown").." | ["..math.floor(getVector3D(player.Head.Position)[3]).."]";
                
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
        while game:GetService("RunService").RenderStepped:Wait() do
            
            if not player
            or not (isPhantom and player:FindFirstChild("Left Arm") or player:FindFirstChild("HumanoidRootPart"))
            or player.Parent ~= cachedparent or not player:IsDescendantOf(workspace)
            or (not isPhantom and player.Humanoid.Health == 0)
            or not espmem[player] then break end

        end

        pcall(function() conmem[player]:Disconnect() end)
        for _,v in pairs(espmem[player]) do
            if v then pcall(function() v:Remove() end) end
        end
        espmem[player] = nil;

    end)

end

----------------------------------------------------------------------

if not isPhantom then
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
else
    for _, player in pairs(workspace.Players:GetDescendants()) do
		if player.Name == "Player" then
			if _G.getPlayerInstanceFromCharacter(player) 
            and _G.getPlayerInstanceFromCharacter(player).Name ~= game:GetService("Players").LocalPlayer.Name then
				delay(0.5, function()
					drawESP(player);
				end)
			end
		end
	end

	workspace.Players.DescendantAdded:Connect(function(Player)
		if Player.Name == "Player" and Player:FindFirstChild("Left Arm") and _G.getPlayerInstanceFromCharacter(Player) 
        and _G.getPlayerInstanceFromCharacter(Player).Name ~= game:GetService("Players").LocalPlayer.Name then
			delay(0.5, function()
				drawESP(Player);
			end)
		end
	end)
end

----------------------------------------------------------------------

_G.change = function(p, v)
    espConfig[p] = v;
end

_G.unloadESP = function()
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