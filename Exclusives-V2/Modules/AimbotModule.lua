
-- Disconnect old aimbot connection
if _G.ezhubaimbot then _G.ezhubaimbot:Disconnect() end

-- Aimbot Vars

local aimbotSettings = {
	enabled = false,
	showfov = true,
	freeforall = true,
	radius = 150,
	wallcheck = false,
	headshot = true,
	rightmouse = true,
	keybind = Enum.KeyCode.E,
	smoothness = 1
}

local players = game:GetService("Players");
local client = players.LocalPlayer;
local inputService = game:GetService("UserInputService");
local aim = false;

local function getMousePos()
	return inputService:GetMouseLocation() - Vector2.new(0, 36);
end

local function freeForAll(targetplayer)
	if aimbotSettings.freeforall == false then
		if client.Team == targetplayer.Team then
			return false;
		else
			return true;
		end
	else
		return true;
	end
end

local function notObstructing(destination, ignore)
	if aimbotSettings.wallcheck then
		Origin = workspace.CurrentCamera.CFrame.p;
		CheckRay = Ray.new(Origin, destination - Origin);
		Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore);
		return Hit == nil;
	else
		return true;
	end
end

local function worldToScreen(pos)
	return workspace.CurrentCamera:WorldToViewportPoint(pos);
end

local function getClosestToCursor()
	local mousePos = getMousePos();
	local radius = aimbotSettings.radius;
	local closest = math.huge;
	local target = nil;
	for _, v in pairs(game:GetService("Players"):GetPlayers()) do
		if freeForAll(v) then
			if v and v.Character and v.Character:FindFirstChild("Head") and v ~= game.Players.LocalPlayer then
				local point, onScreen = worldToScreen(v.Character.Head.Position);
				local clientChar = client.Character;
				if onScreen and notObstructing(v.Character.Head.Position, {
					clientChar,
					v.Character
				}) then
					local distance = (Vector2.new(point.X, point.Y) - mousePos).magnitude
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

-- The following settings are places outside of the original aimbotSettings
-- table as they ned to access content inside it.

aimbotSettings.aimAtCallback = function()
	if aimbotSettings.headshot then
		return worldToScreen(target.Character.Head.Position);
	else
		return worldToScreen(target.Character.HumanoidRootPart.Position);
	end
end

if _G.Circle then _G.Circle:Remove(); end
_G.Circle = Drawing.new("Circle");
_G.Circle.Radius = 150;
_G.Circle.NumSides = 20;
_G.Circle.Color = Color3.fromRGB(255,0,0);
_G.Circle.Thickness = 1;
_G.Circle.Position = getMousePos();

inputService.InputBegan:Connect(function(key)
	if aimbotSettings.rightmouse and key.UserInputType == Enum.UserInputType.MouseButton2 then
		aim = true;
	elseif key.KeyCode == aimbotSettings.keybind and not aimbotSettings.rightmouse then
		aim = true;
	end
end)

inputService.InputEnded:Connect(function(key)
	if aimbotSettings.rightmouse and key.UserInputType == Enum.UserInputType.MouseButton2 then
		aim = false;
	elseif key.KeyCode == aimbotSettings.keybind and not aimbotSettings.rightmouse then
		aim = false;
	end
end)

_G.ezhubaimbot = game:GetService("RunService").RenderStepped:Connect(function()
	_G.Circle.Position = getMousePos();
	if aimbotSettings.enabled and aimbotSettings.showfov then
		_G.Circle.Visible = true;
	else
		_G.Circle.Visible = false;
	end

	if aimbotSettings.radius ~= _G.Circle.Radius then _G.Circle.Radius = aimbotSettings.radius; end
	if aimbotSettings.enabled == false or aim == false then
		return;
	end

	local target = getClosestToCursor();
	if target then
		local aimAt, visible = aimbotSettings.aimAtCallback();
		mousemoverel((aimAt.X - getMousePos().X) / aimbotSettings.smoothness, (aimAt.Y - getMousePos().Y) / aimbotSettings.smoothness);
	end

end)

_G.change = function(p, v)
	aimbotSettings[p] = v;
end

return aimbotSettings;
