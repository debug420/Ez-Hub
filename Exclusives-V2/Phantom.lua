----------------------------------------------------------------------

-- Phantom Script

local ezlib;
if _G.CachedEzLib then
	ezlib = loadstring(_G.CachedEzLib)()
else
	ezlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Modules/EzLib.lua"))()
end

local DontLoad = false
if game.PlaceId ~= 292439477 then
    ezlib:CreateNotice("Failed GameID Check", "The following exclusive that has been executed is not designed for the following game. This could cause the script to misfunction and break. Proceed anyway?", function(response)
        if response ~= "Yes" then
            DontLoad = true
        end
    end)
end
if DontLoad then return end

local Main = ezlib:NewLib("Phantom Forces")

----------------------------------------------------------------------

-- Initialize Sections

local AimbotSection = ezlib:NewSection(Main, "Aimbot")
local ESPSection = ezlib:NewSection(Main, "ESP")
local MiscSection = ezlib:NewSection(Main, "Misc")

----------------------------------------------------------------------

-- Core Funcs

local getBodyparts;
for i,v in pairs(getgc(true)) do
	if type(v) == "table" and rawget(v, "getbodyparts") then
		getBodyparts = v.getbodyparts
	end
end

local function getPlayerInstanceFromCharacter(character)
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        local bp = getBodyparts(v)
        if bp and bp["head"] == character:FindFirstChild("Head") then
            return v;
        end
    end
end



----------------------------------------------------------------------

-- Aimbot Section


if _G.phantomaimbot then _G.phantomaimbot:Disconnect() end

-- Aimbot Vars

local aimbotsettings = {
	enabled = false,
	showfov = true,
	freeforall = false,
	radius = 150,
	wallcheck = false,
	headshot = false,
	rightmouse = true,
	keybind = Enum.KeyCode.E
}

coroutine.resume(coroutine.create(function()
    while wait() do
        if aimbotsettings.enabled then
            for i,v in pairs(workspace.Players:GetDescendants()) do
                if v.Name == "Player" and v:IsA("Model") then
                    local var = getPlayerInstanceFromCharacter(v)
                    if var then var.Character = v end
                end
            end
        end
    end
end))

-- Aimbot Script

pcall(function()
	do
		if _G.Circle then _G.Circle:Remove() end
		local players = game:GetService("Players")
		local client = players.LocalPlayer
		local inputservice = game:GetService("UserInputService")
		local mouse = client:GetMouse()
		local runservice = game:GetService("RunService")
		local aim = false

		local function GetMouse()
			return Vector2.new(mouse.X, mouse.Y) + Vector2.new(0, 36)
		end

		_G.Circle = Drawing.new("Circle");
		_G.Circle.Radius = 150;
		_G.Circle.NumSides = 20;
		_G.Circle.Color = Color3.fromRGB(255,0,0);
		_G.Circle.Thickness = 1;
		_G.Circle.Position = GetMouse()
		--_G.Circle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2);
		
		inputservice.InputBegan:Connect(function(key)
			if aimbotsettings.rightmouse and key.UserInputType == Enum.UserInputType.MouseButton2 then
				aim = true
			elseif key.KeyCode == aimbotsettings.keybind and not aimbotsettings.rightmouse then
				aim = true
			end
		end)
		inputservice.InputEnded:Connect(function(key)
			if aimbotsettings.rightmouse and key.UserInputType == Enum.UserInputType.MouseButton2 then
				aim = false
			elseif key.KeyCode == aimbotsettings.keybind and not aimbotsettings.rightmouse then
				aim = false
			end
		end)
		local function FreeForAll(targetplayer)
			if aimbotsettings.freeforall == false then
				if client.Team == targetplayer.Team then
					return false
				else
					return true
				end
			else
				return true
			end
		end

		local function isVisible(character)
            if aimbotsettings.wallcheck then
                local Ray = Ray.new(workspace.CurrentCamera.CFrame.p, (character.Head.Position - workspace.CurrentCamera.CFrame.p).unit * 2048)
                local part = workspace:FindPartOnRayWithIgnoreList(Ray, {})
                if part:IsDescendantOf(character) then return true else return false end
            else return true end
        end

		local function WorldToScreen(Position)
			return workspace.CurrentCamera:WorldToViewportPoint(Position)
		end

		local function GetClosestToCuror()
			MousePos = GetMouse()
			Radius = aimbotsettings.radius
			Closest = math.huge
			Target = nil
			for _, v in pairs(game:GetService("Players"):GetPlayers()) do
				if FreeForAll(v) and getBodyparts(v) then
					if v and v.Character and v.Character:FindFirstChild("Head") and v ~= game.Players.LocalPlayer then
						Point, OnScreen = workspace.CurrentCamera:WorldToViewportPoint(v.Character.Head.Position)
						if OnScreen and isVisible(v.Character) then
							Distance = (Vector2.new(Point.X, Point.Y) - MousePos).magnitude
							if Distance < math.min(Radius, Closest) then
								Closest = Distance
								Target = v
							end
						end
					end
				end
			end
            if Target and Target.Character and Target.Name then
			    return Target.Character
            end
		end
		_G.phantomaimbot = runservice.RenderStepped:Connect(function()
			_G.Circle.Position = GetMouse()
			if aimbotsettings.enabled and aimbotsettings.showfov then 
				_G.Circle.Visible = true;
			else
				_G.Circle.Visible = false;
			end

			if aimbotsettings.radius ~= _G.Circle.Radius then _G.Circle.Radius = aimbotsettings.radius end
			if aimbotsettings.enabled == false or aim == false then
				return
			end
			target = GetClosestToCuror()
			if target then
				local aimAt, visible = (function()
					if aimbotsettings.headshot then
						return WorldToScreen(target.Head.Position);
					else
						return WorldToScreen(target.HumanoidRootPart.Position);
					end
				end)()
				mousemoverel((aimAt.X - game:GetService("UserInputService"):GetMouseLocation().X)/2, (aimAt.Y - game:GetService("UserInputService"):GetMouseLocation().Y)/2)
			end
		end)
	end
end)

-- _G.change = function(p, v)
-- 	aimbotsettings[p] = v;
-- end

ezlib:NewTitle(AimbotSection, "Aimbot")
ezlib:NewDiv(AimbotSection)

ezlib:NewCheckBox(AimbotSection, "Enabled", aimbotsettings.enabled, function(state)
    aimbotsettings.enabled = state;
end)

ezlib:NewCheckBox(AimbotSection, "Free For All", aimbotsettings.freeforall, function(state)
    aimbotsettings.freeforall = state;
end)

ezlib:NewCheckBox(AimbotSection, "Headshot Only", aimbotsettings.headshot, function(state)
    aimbotsettings.headshot = state;
end)

ezlib:NewCheckBox(AimbotSection, "WallCheck", aimbotsettings.wallcheck, function(state)
    aimbotsettings.wallcheck = state;
end)

ezlib:NewSlider(AimbotSection, "Radius", aimbotsettings.radius, 10, 400, function(val)
    aimbotsettings.radius = val
end)

ezlib:NewCheckBox(AimbotSection, "Show FOV", aimbotsettings.showfov, function(state)
    aimbotsettings.showfov = state
end)

ezlib:NewDiv(AimbotSection)

ezlib:NewCheckBox(AimbotSection, "Right-mouse", aimbotsettings.rightmouse, function(state)
    aimbotsettings.rightmouse = state;
end)

ezlib:NewKeyBind(AimbotSection, "Keybind", aimbotsettings.keybind, function(i)
    aimbotsettings.keybind = i.KeyCode;
end)

----------------------------------------------------------------------

-- ESP Section

local espConfig = {
    -- Toggle
    Enabled = false,
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
    setcolor = {255, 255, 255},
    teamcolor = true,
    -- ESP offsets
    XOffset = 2.8,
    YOffsetAboveHead = 1.5,
    YOffsetBelowHead = 5.5,
    TagOffset = 8,
    -- Headdot Settings
    HeaddotFilled = false,
    HeaddotScale = 2.5
}

local DrawESP;
local espmem = {};
local conmem = {};
--pcall(function()

    local function GetVector3D(vector3)
        local vector, onScreen = workspace.CurrentCamera:WorldToViewportPoint(vector3)
        return {Vector2.new(vector.X, vector.Y), onScreen, vector.Z};
    end

    local rainbowcs;
    coroutine.wrap(function()
        while wait() do
            local i = 0
            repeat
                i = i + (0.001 * espConfig.rainbowspeed)
                rainbowcs = Color3.fromHSV(i,1,1) --creates a color using i
                wait()
            until i >= 1
        end
    end)()
    local function GetESPColor(playerinstance)
        if not playerinstance then return Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255) end 
        if espConfig.rainbowcolor then
            return rainbowcs or Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255);
        elseif espConfig.teamcolor then
            return playerinstance.TeamColor.Color or Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255);
        elseif espConfig.setcolor then
            return Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255);
        end
    end

    local function GetTracerPoint()
        if espConfig.locktocursor then
            return Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y) + Vector2.new(0, 36);
        else
            return Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y);
        end
    end

    local function CheckTeam(player)
        if espConfig.teamcheck and player and player.Parent then
            return player.Parent ~= game.Players.LocalPlayer.Character.Parent;
        else
            return true;
        end
    end

    local DrawESP = function(player)
        if not player or not player:FindFirstChild("HumanoidRootPart") then return end
        if player:FindFirstChild("HumanoidRootPart") then
            local cachedparent = player.Parent

            -- Make ESP Drawings Mem container
            espmem[player] = {}

            -- Tracer
            espmem[player].Tracer = Drawing.new("Line")

            -- Box around Player Drawing
            espmem[player].Up = Drawing.new("Line")
            espmem[player].Down = Drawing.new("Line")
            espmem[player].Left = Drawing.new("Line")
            espmem[player].Right = Drawing.new("Line")

            -- Headdot
            espmem[player].Headdot = Drawing.new("Circle")

            -- Texttag
            espmem[player].Tag = Drawing.new("Text")   -- Name

            -- Start Updating ESP
            spawn(function()

                conmem[player] = game:GetService("RunService").RenderStepped:Connect(function()
                    
                    -- Initiate Variables
                    local point = GetVector3D(player.Head.Position)[1]
                    local playerInstance = getPlayerInstanceFromCharacter(player)
                        
                    -- Tracer
                    if GetVector3D(player.Head.Position)[2] and espConfig.Enabled and espConfig.tracer and espConfig.renderrange > GetVector3D(player.Head.Position)[3] and CheckTeam(player) and espmem[player].Tracer then
                        local tracer = espmem[player].Tracer
                        tracer.Thickness = 1
                        tracer.From = GetTracerPoint()
                        tracer.To = point
                        tracer.Color = GetESPColor(playerInstance)
                        tracer.Visible = true
                    elseif espmem[player].Tracer then
                        espmem[player].Tracer.Visible = false
                    else
                        conmem[player]:Disconnect()
                    end

                    -- ESP Box
                    local headcframe = player.Head.CFrame

                    -- Calculate CFrame
                    local tl = headcframe * CFrame.new(-(espConfig.XOffset), espConfig.YOffsetAboveHead, 0)
                    local tr = headcframe * CFrame.new(espConfig.XOffset, espConfig.YOffsetAboveHead, 0)
                    local bl = headcframe * CFrame.new(-(espConfig.XOffset),-(espConfig.YOffsetBelowHead),0)
                    local br = headcframe * CFrame.new(espConfig.XOffset,-(espConfig.YOffsetBelowHead),0)
                
                    if GetVector3D(player.Head.Position)[2] and espConfig.Enabled and espConfig.renderrange > GetVector3D(player.Head.Position)[3] and CheckTeam(player) and espmem[player].Up and espmem[player].Down and espmem[player].Right and espmem[player].Left then

                        -- Top Line
                        espmem[player].Up.From = GetVector3D(tl.p)[1]
                        espmem[player].Up.To = GetVector3D(tr.p)[1]
                        espmem[player].Up.Thickness = 1
                        espmem[player].Up.Color = GetESPColor(playerInstance)

                        -- Left Line
                        espmem[player].Left.From = GetVector3D(tl.p)[1]
                        espmem[player].Left.To = GetVector3D(bl.p)[1]
                        espmem[player].Left.Thickness = 1
                        espmem[player].Left.Color = GetESPColor(playerInstance)

                        -- Right Line
                        espmem[player].Right.From = GetVector3D(tr.p)[1]
                        espmem[player].Right.To = GetVector3D(br.p)[1]
                        espmem[player].Right.Thickness = 1
                        espmem[player].Right.Color = GetESPColor(playerInstance)

                        -- Bottom Line
                        espmem[player].Down.From = GetVector3D(bl.p)[1]
                        espmem[player].Down.To = GetVector3D(br.p)[1]
                        espmem[player].Down.Thickness = 1
                        espmem[player].Down.Color = GetESPColor(playerInstance)

                        espmem[player].Down.Visible = true
                        espmem[player].Right.Visible = true
                        espmem[player].Left.Visible = true
                        espmem[player].Up.Visible = true
                        
                    elseif espmem[player].Up and espmem[player].Down and espmem[player].Right and espmem[player].Left then
                        espmem[player].Down.Visible = false
                        espmem[player].Right.Visible = false
                        espmem[player].Left.Visible = false
                        espmem[player].Up.Visible = false
                    else
                        conmem[player]:Disconnect()
                    end

                    -- Head Dot
                    if GetVector3D(player.Head.Position)[2] and espConfig.Enabled and espConfig.headdot and espConfig.renderrange > GetVector3D(player.Head.Position)[3] and CheckTeam(player) and espmem[player].Headdot then
                        espmem[player].Headdot.Position = point
                        espmem[player].Headdot.Filled = espConfig.HeaddotFilled
                        espmem[player].Headdot.Color = GetESPColor(playerInstance)
                        espmem[player].Headdot.NumSides = 50
                        espmem[player].Headdot.Thickness = 1

                        -- Head dot radius
                        local Scale = player.Head.Size.Y / espConfig.HeaddotScale;
                        local Top = workspace.CurrentCamera:WorldToViewportPoint((headcframe * CFrame.new(0, Scale, 0)).Position);
                        local Bottom = workspace.CurrentCamera:WorldToViewportPoint((headcframe * CFrame.new(0, -Scale, 0)).Position);
                        espmem[player].Headdot.Radius = (Top - Bottom).y;

                        espmem[player].Headdot.Visible = true
                    elseif espmem[player].Headdot then
                        espmem[player].Headdot.Visible = false
                    else
                        conmem[player]:Disconnect()
                    end
                    
                    -- Tag
                
                    if GetVector3D(player.Head.Position)[2] and espConfig.Enabled and espConfig.tag and espConfig.renderrange > GetVector3D(player.Head.Position)[3] and CheckTeam(player) and espmem[player].Tag then

                        local ScreenPositionUpper = workspace.CurrentCamera:WorldToViewportPoint((player.HumanoidRootPart:GetRenderCFrame() * CFrame.new(0, player.Head.Size.Y + player.HumanoidRootPart.Size.Y + (espConfig.TagOffset - 200 / 25), 0)).Position);
                        if espmem[player].Tag.Font and Drawing and Drawing.Fonts then
                            espmem[player].Tag.Font = Drawing.Fonts.Monospace
                        end

                        espmem[player].Tag.Visible = true
                        espmem[player].Tag.Center = true
                        espmem[player].Tag.Color = GetESPColor(playerInstance)
                        espmem[player].Tag.Outline = true
                        espmem[player].Tag.Position = Vector2.new(ScreenPositionUpper.X, ScreenPositionUpper.Y) - Vector2.new(0, espmem[player].Tag.TextBounds.Y);
                        if playerInstance and playerInstance.Name then
                            espmem[player].Tag.Text = (playerInstance.Name or "Unknown").." | ["..math.floor(GetVector3D(player.Head.Position)[3]).."]";
                        else
                            espmem[player].Tag.Text = "Unknown".." | ["..math.floor(GetVector3D(player.Head.Position)[3]).."]";
                        end
                        
                    elseif espmem[player].Tag then
                        espmem[player].Tag.Visible = false
                    else
                        conmem[player]:Disconnect()
                    end

                end)

                -- Wait until player character is dead/leaves ect
                while true do
                    game:GetService("RunService").RenderStepped:Wait()
                    if string.find(espmem[player].Tag.Text, "Unknown") and not player or not player:FindFirstChild("HumanoidRootPart") or player.Parent ~= cachedparent or not player:FindFirstChild("Head") or not espmem[player] then
                        break
                    end
                end
                pcall(function() conmem[player]:Disconnect() end)
                for _,v in pairs(espmem[player]) do
                    if v then pcall(function() v:Remove() end) end
                end
            end)
        end
    end
--end)

for _, Player in next, workspace.Players:GetDescendants() do
    if Player.Name == "Player" then
        if getPlayerInstanceFromCharacter(Player) and getPlayerInstanceFromCharacter(Player).Name ~= game:GetService("Players").LocalPlayer.Name then
            delay(0.5, function()
                DrawESP(Player)
            end)
        end	
    end
end

workspace.Players.DescendantAdded:Connect(function(Player)
    if Player.Name == "Player" and Player:WaitForChild("Head") and Player.Head and getPlayerInstanceFromCharacter(Player) and getPlayerInstanceFromCharacter(Player).Name ~= game:GetService("Players").LocalPlayer.Name then
        delay(0.5, function()
            DrawESP(Player)
        end)
    end
end)

-- _G.change = function(p, v)
--     espConfig[p] = v;
-- end

if _G.unload then _G.unload() end

_G.unload = function()
    DrawESP = function() return; end
    for i,v in pairs(conmem) do
        v:Disconnect()
    end
    for i,v in pairs(espmem) do
        if type(v) == "table" then
            for ii, vv in pairs(v) do
                if vv then pcall(function() vv:Remove() end) end
            end
        end
    end
end

ezlib:NewTitle(ESPSection, "ESP Engine V4")
ezlib:NewDiv(ESPSection)

ezlib:NewCheckBox(ESPSection, "Enabled", espConfig.Enabled, function(state)
    espConfig.Enabled = state
end)

ezlib:NewDiv(ESPSection)
ezlib:NewTitle(ESPSection, "ESP Elements")

ezlib:NewCheckBox(ESPSection, "Tracer", espConfig.tracer, function(state)
    espConfig.tracer = state
end)

ezlib:NewCheckBox(ESPSection, "Headdot", espConfig.headdot, function(state)
    espConfig.headdot = state
end)

ezlib:NewCheckBox(ESPSection, "Info Tag", espConfig.tag, function(state)
    espConfig.tag = state
end)

ezlib:NewDiv(ESPSection)
ezlib:NewTitle(ESPSection, "ESP Behaviour")

ezlib:NewCheckBox(ESPSection, "Lock to cursor", espConfig.locktocursor, function(state)
    espConfig.locktocursor = state
end)

ezlib:NewCheckBox(ESPSection, "Teamcheck", espConfig.teamcheck, function(state)
    espConfig.teamcheck = state
end)

ezlib:NewSlider(ESPSection, "Render Range", espConfig.renderrange, 100, 5000, function(val)
    espConfig.renderrange = val
end)

ezlib:NewDiv(ESPSection)
ezlib:NewTitle(ESPSection, "ESP Colors")

ezlib:NewCheckBox(ESPSection, "Rainbow", espConfig.rainbowcolor, function(state)
    espConfig.rainbowcolor = state
end)

ezlib:NewSlider(ESPSection, "Rainbow Speed", espConfig.rainbowspeed, 1, 5, function(val)
    espConfig.rainbowspeed = val
end)

ezlib:NewCheckBox(ESPSection, "Team Color", espConfig.teamcolor, function(state)
    espConfig.teamcolor = state
end)

ezlib:NewDiv(ESPSection)
ezlib:NewTitle(ESPSection, "ESP SetColor")
ezlib:NewSlider(ESPSection, "R", espConfig.setcolor[1], 0, 255, function(val)
    espConfig.setcolor[1] = val
end)
ezlib:NewSlider(ESPSection, "G", espConfig.setcolor[2], 0, 255, function(val)
    espConfig.setcolor[2] = val
end)
ezlib:NewSlider(ESPSection, "B", espConfig.setcolor[3], 0, 255, function(val)
    espConfig.setcolor[3] = val
end)

ezlib:NewDiv(ESPSection)
ezlib:NewTitle(ESPSection, "Headdot Settings")

ezlib:NewCheckBox(ESPSection, "Headdot Filled", espConfig.HeaddotFilled, function(state)
    espConfig.HeaddotFilled = state
end)

ezlib:NewSlider(ESPSection, "Headdot Scale", espConfig.HeaddotScale * 2, 1, 10, function(val)
    espConfig.HeaddotScale = val / 2
end)

----------------------------------------------------------------------

-- Misc Section

ezlib:NewTitle(MiscSection, "Misc")
ezlib:NewDiv(MiscSection)

ezlib:NewCheckBox(MiscSection, "Update Radar", true, function(state)
    for i, v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v, "radar") and rawget(v, "killfeed") then
            rawget(v, "radar").enabled = state
        end
    end
end)

----------------------------------------------------------------------

-- Active

ezlib:SetActive(AimbotSection);
