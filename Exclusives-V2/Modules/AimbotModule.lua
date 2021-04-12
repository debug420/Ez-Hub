if _G.ezhubaimbot then _G.ezhubaimbot:Disconnect() end

-- Aimbot Vars

local aimbotsettings = {
	enabled = false,
	showfov = true,
	freeforall = true,
	radius = 150,
	wallcheck = false,
	headshot = true,
	rightmouse = true,
	keybind = Enum.KeyCode.E
}

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
		local function NotObstructing(destination, ignore)
			if aimbotsettings.wallcheck then
				Origin = workspace.CurrentCamera.CFrame.p
				CheckRay = Ray.new(Origin, destination - Origin)
				Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore)
				return Hit == nil
			else
				return true
			end
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
				if FreeForAll(v) then
					if v and v.Character and v.Character:FindFirstChild("Head") and v ~= game.Players.LocalPlayer then
						Point, OnScreen = workspace.CurrentCamera:WorldToViewportPoint(v.Character.Head.Position)
						clientchar = client.Character
						if OnScreen and NotObstructing(v.Character.Head.Position, {
							clientchar,
							v.Character
						}) then
							Distance = (Vector2.new(Point.X, Point.Y) - MousePos).magnitude
							if Distance < math.min(Radius, Closest) then
								Closest = Distance
								Target = v
							end
						end
					end
				end
			end
			return Target
		end
		_G.ezhubaimbot = runservice.RenderStepped:Connect(function()
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
						return WorldToScreen(target.Character.Head.Position);
					else
						return WorldToScreen(target.Character.HumanoidRootPart.Position);
					end
				end)()
				mousemoverel((aimAt.X - game:GetService("UserInputService"):GetMouseLocation().X), (aimAt.Y - game:GetService("UserInputService"):GetMouseLocation().Y))
			end
		end)
	end
end)

_G.change = function(p, v)
	aimbotsettings[p] = v;
end

return aimbotsettings;
