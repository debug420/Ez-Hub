-- Phantom Forces Script

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("Phantom Forces", nil, nil, nil, 292439477);

----------------------------------------------------------------------

for i,v in pairs(getgc(true)) do
	if type(v) == "table" and rawget(v, "getbodyparts") then
		_G.getBodyparts = v.getbodyparts;
	end
end

_G.getPlayerInstanceFromCharacter = function(character)
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        local bp = _G.getBodyparts(v);
        if bp and bp["head"] == character:FindFirstChild("Head") then
            return v;
        end
    end
end

coroutine.resume(coroutine.create(function()
    while wait() do
		for i,v in pairs(workspace.Players:GetDescendants()) do
			if v.Name == "Player" and v:IsA("Model") then
				local var = _G.getPlayerInstanceFromCharacter(v);
				if var then var.Character = v; end
			end
		end
    end
end))

----------------------------------------------------------------------
-- Aimbot module

local aimbotSettings = loadstring(_G["EzHubModules"]["createaimbotmodule"])().newAimbotTab(mainGUI);
aimbotSettings.smoothness = 2;
aimbotSettings.getClosestToCursor = function(aimbotSettings)
    local mousePos = aimbotSettings.getMousePos(aimbotSettings);
	local radius = aimbotSettings.radius;
	local closest = math.huge;
	local target = nil;
	for _, v in pairs(game:GetService("Players"):GetPlayers()) do
		if aimbotSettings.matchesFreeForAllConditions(aimbotSettings, v) and _G.getBodyparts(v) then
			if v and v.Character and v.Character:FindFirstChild("Head") and v ~= game.Players.LocalPlayer then
				local point, onScreen = aimbotSettings.worldToScreen(aimbotSettings, v.Character.Head.Position);
				local ignoreList =  {
					game.Players.LocalPlayer.Character,
					v.Character,	-- Ignore the target's player model
					workspace.CurrentCamera	-- Ignore things like gun model of client
				};

				if onScreen and aimbotSettings.notObstructing(aimbotSettings, v.Character.Head.Position, ignoreList) then
					local distance = (Vector2.new(point.X, point.Y) - mousePos).magnitude;
					if distance < math.min(radius, closest) then
						closest = distance;
						target = v;
					end
				end
			end
		end
	end
	return target;
end

aimbotSettings.aimAtCallback = function(aimbotSettings, target)
	if target and target.Character:FindFirstChild("Head") 
    and target.Character:FindFirstChild("HumanoidRootPart") then
        if aimbotSettings.headshot then
            return aimbotSettings.worldToScreen(aimbotSettings, target.Character.Head.Position);
        else
            return aimbotSettings.worldToScreen(aimbotSettings, target.Character.HumanoidRootPart.Position + Vector3.new(0, 1));	-- A little bit of lazy bullet drop compensation
        end
    end
end

----------------------------------------------------------------------
-- ESP module

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
		teamcheck = true,
		-- ESP Color
		rainbowcolor = false,
		rainbowspeed = 2,
		setcolor = {255, 20, 100},
		teamcolor = false,
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
		if espConfig.rainbowcolor then return rainbowcs end
		if not playerinstance then 
		return Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) 
		or Color3.fromRGB(255,255,255) end 
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
			return player.Parent ~= game.Players.LocalPlayer.Character.Parent;
		else
			return true;
		end
	end

	drawESP = function(player)
		if not player or not player:FindFirstChild("HumanoidRootPart") then return end
		if player:FindFirstChild("HumanoidRootPart") then

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
				if string.find(espmem[player].Tag.Text, "Unknown") and not player 
				or not player:FindFirstChild("HumanoidRootPart") 
				or player.Parent ~= cachedparent 
				or not player:FindFirstChild("Head") 
				or not espmem[player] then
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

	for _, player in pairs(workspace.Players:GetDescendants()) do
		if player.Name == "Player" then
			if _G.getPlayerInstanceFromCharacter(player) and _G.getPlayerInstanceFromCharacter(player).Name ~= game:GetService("Players").LocalPlayer.Name then
				delay(0.5, function()
					drawESP(player);
				end)
			end	
		end
	end

	workspace.Players.DescendantAdded:Connect(function(Player)
		if Player.Name == "Player" and Player:WaitForChild("Head") and Player.Head and _G.getPlayerInstanceFromCharacter(Player) and _G.getPlayerInstanceFromCharacter(Player).Name ~= game:GetService("Players").LocalPlayer.Name then
			delay(0.5, function()
				drawESP(Player);
			end)
		end
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

end);

----------------------------------------------------------------------
-- Misc

local misc = mainGUI.newTab("Misc");
misc.newCheckbox("Update Radar", true, function(state)
    for i, v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v, "radar") and rawget(v, "killfeed") then
            rawget(v, "radar").enabled = state
        end
    end
end)

----------------------------------------------------------------------

mainGUI.openTab(mainGUI.getTab("Aimbot"));
