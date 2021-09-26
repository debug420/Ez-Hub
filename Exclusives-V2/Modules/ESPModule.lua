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
    xoffset = 2,
    yoffsetabovehead = 3,
    yoffsetbelowhead = 3.5,
    tagoffset = 8,
    -- Headdot Settings
    headdotfilled = false,
    headdotscale = 2.5
}

local drawESP;
local espmem = {};
local conmem = {};

----------------------------------------------------------------------
-- The reason that certain functions are stored in espConfig is because certain games may require specific modifications to functions
-- This is so that I don't have to copy and paste the entire ESP module code for each game that requires minor changes

espConfig.getVector3D = function(vector3)
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

espConfig.getESPColor = function(playerinstance)
    if not playerinstance then return Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255) end 
    if espConfig.rainbowcolor then
        return espConfig.rainbowcs or Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255);
    elseif espConfig.teamcolor then
        return playerinstance.TeamColor.Color or Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255);
    elseif espConfig.setcolor then
        return Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255);
    end
end

espConfig.getTracerPoint = function()
    if espConfig.locktocursor then
        return Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y) + Vector2.new(0, 36);
    else
        return Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y);
    end
end

espConfig.checkTeam = function(player)
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
                local point = espConfig.getVector3D(player.Head.Position)[1];
                    
                -- Tracer
                if espConfig.getVector3D(player.Head.Position)[2] and espConfig.enabled and espConfig.tracer and espConfig.renderrange > espConfig.getVector3D(player.Head.Position)[3] and espConfig.checkTeam(player) and espmem[player].Tracer then
                    local tracer = espmem[player].Tracer; if not tracer then return end;
                    tracer.Thickness = 1;
                    tracer.From = espConfig.getTracerPoint();
                    tracer.To = point;
                    tracer.Color = espConfig.getESPColor(game:GetService("Players"):FindFirstChild(player.Name));
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
                local espBoxOriginCFrame = (player:FindFirstChild("Torso") or player:FindFirstChild("Head") or player:FindFirstChild("HumanoidRootPart"))
                .CFrame:ToWorldSpace();

                -- Calculate CFrame
                -- Variables stand for the corresponding box corner - tl = top left
                local tl = espBoxOriginCFrame * CFrame.new(-(espConfig.xoffset), espConfig.yoffsetabovehead, 0);
                local tr = espBoxOriginCFrame * CFrame.new(espConfig.xoffset, espConfig.yoffsetabovehead, 0);
                local bl = espBoxOriginCFrame * CFrame.new(-(espConfig.xoffset), -(espConfig.yoffsetbelowhead),0);
                local br = espBoxOriginCFrame * CFrame.new(espConfig.xoffset, -(espConfig.yoffsetbelowhead),0);
            
                if espConfig.getVector3D(player.Head.Position)[2] and espConfig.enabled and espConfig.renderrange > espConfig.getVector3D(player.Head.Position)[3] and espConfig.checkTeam(player) and espmem[player].Up and espmem[player].Down and espmem[player].Right and espmem[player].Left then

                    -- Top Line
                    espmem[player].Up.From = espConfig.getVector3D(tl.p)[1];
                    espmem[player].Up.To = espConfig.getVector3D(tr.p)[1];
                    espmem[player].Up.Thickness = 1;
                    espmem[player].Up.Color = espConfig.getESPColor(game:GetService("Players"):FindFirstChild(player.Name));

                    -- Left Line
                    espmem[player].Left.From = espConfig.getVector3D(tl.p)[1];
                    espmem[player].Left.To = espConfig.getVector3D(bl.p)[1];
                    espmem[player].Left.Thickness = 1;
                    espmem[player].Left.Color = espConfig.getESPColor(game:GetService("Players"):FindFirstChild(player.Name));

                    -- Right Line
                    espmem[player].Right.From = espConfig.getVector3D(tr.p)[1];
                    espmem[player].Right.To = espConfig.getVector3D(br.p)[1];
                    espmem[player].Right.Thickness = 1;
                    espmem[player].Right.Color = espConfig.getESPColor(game:GetService("Players"):FindFirstChild(player.Name));

                    -- Bottom Line
                    espmem[player].Down.From = espConfig.getVector3D(bl.p)[1];
                    espmem[player].Down.To = espConfig.getVector3D(br.p)[1];
                    espmem[player].Down.Thickness = 1;
                    espmem[player].Down.Color = espConfig.getESPColor(game:GetService("Players"):FindFirstChild(player.Name));

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
                if espConfig.getVector3D(player.Head.Position)[2] and espConfig.enabled and espConfig.headdot and espConfig.renderrange > espConfig.getVector3D(player.Head.Position)[3] and espConfig.checkTeam(player) and espmem[player].Headdot then
                    espmem[player].Headdot.Position = point;
                    espmem[player].Headdot.Filled = espConfig.headdotfilled;
                    espmem[player].Headdot.Color = espConfig.getESPColor(game:GetService("Players"):FindFirstChild(player.Name));
                    espmem[player].Headdot.NumSides = 30;
                    espmem[player].Headdot.Thickness = 1;

                    -- Head dot radius
                    local Scale = player.Head.Size.Y / espConfig.headdotscale;
                    local Top = workspace.CurrentCamera:WorldToViewportPoint((player.Head.CFrame * CFrame.new(0, Scale, 0)).Position);
                    local Bottom = workspace.CurrentCamera:WorldToViewportPoint((player.Head.CFrame * CFrame.new(0, -Scale, 0)).Position);
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
            
                if espConfig.getVector3D(player.Head.Position)[2] and espConfig.enabled and espConfig.tag and espConfig.renderrange > espConfig.getVector3D(player.Head.Position)[3] and espConfig.checkTeam(player) and espmem[player].Tag then

                    local ScreenPositionUpper = workspace.CurrentCamera:WorldToViewportPoint((player.HumanoidRootPart:GetRenderCFrame() * CFrame.new(0, player.Head.Size.Y + player.HumanoidRootPart.Size.Y + (espConfig.tagoffset - 200 / 25), 0)).Position);
                    if espmem[player].Tag.Font and Drawing and Drawing.Fonts then
                        espmem[player].Tag.Font = Drawing.Fonts.Monospace;
                    end

                    espmem[player].Tag.Visible = true;
                    espmem[player].Tag.Center = true;
                    espmem[player].Tag.Color = espConfig.getESPColor(game:GetService("Players"):FindFirstChild(player.Name));
                    espmem[player].Tag.Outline = true;
                    espmem[player].Tag.Position = Vector2.new(ScreenPositionUpper.X, ScreenPositionUpper.Y) - Vector2.new(0, espmem[player].Tag.TextBounds.Y);
                    espmem[player].Tag.Text = (player.Name or "Unknown").." | ["..math.floor(espConfig.getVector3D(player.Head.Position)[3]).."]";
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