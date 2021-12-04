-- Disconnect old aimbot connection
if _G.unloadAimbot then _G.unloadAimbot() end

local isPhantom = (game.PlaceId == 292439477 and _G.getBodyparts and
_G.getPlayerInstanceFromCharacter and _G.getCharacterFromPlayerInstance);

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
	smoothness = 1.5,
	camerasense = 0.2,
	fovcolor = {255, 0, 0}
}

-- Mouse settings
-- Automatically tweaks mouse sens best for aimbot
UserSettings():GetService("UserGameSettings").MouseSensitivityFirstPerson = Vector2.new(aimbotSettings.camerasense, aimbotSettings.camerasense);
UserSettings():GetService("UserGameSettings").MouseSensitivityThirdPerson = Vector2.new(aimbotSettings.camerasense, aimbotSettings.camerasense);

local inputService = game:GetService("UserInputService");
local aim = false;

-------------------------------------------------------------------------------------------------

-- Aimbot funcs

local function getMousePos()
	return inputService:GetMouseLocation() - Vector2.new(0, 36);
end

local function matchesFreeForAllConditions(targetPlayer)
	if aimbotSettings.freeforall == false then
		if game.Players.LocalPlayer.Team == targetPlayer.Team then
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
		local parts = workspace.CurrentCamera:GetPartsObscuringTarget({destination}, ignore);
		for i,v in pairs(parts) do
			if v:IsA("BasePart") and v.Transparency <= 2.5 then
				return false;
			end
		end
	end
	return true;
end

local function worldToScreen(pos)
	return workspace.CurrentCamera:WorldToScreenPoint(pos);
end

local function getClosestToCursor()
	local mousePos = getMousePos();
	local radius = aimbotSettings.radius;
	local closest = math.huge;
	local target = nil;
	for _, v in pairs(game:GetService("Players"):GetPlayers()) do
		if matchesFreeForAllConditions(v) and (isPhantom and _G.getBodyparts(v) or true) then
			if v and v.Character and (isPhantom and v.Character:FindFirstChild("Left Arm") or v.Character:FindFirstChild("Head"))
			and v ~= game.Players.LocalPlayer then
				local point, onScreen = worldToScreen(v.Character.Head.Position);
				if onScreen and notObstructing(v.Character.Head.Position, {
					game.Players.LocalPlayer.Character,
					v.Character,	-- Ignore the target's player model
                    workspace.CurrentCamera	-- Ignore things like gun model of client
				}) then
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

local function aimAtCallback(target)
	if target and aimbotSettings.headshot then
		return worldToScreen(target.Character.Head.Position);
	elseif not isPhantom then
		return worldToScreen(target.Character.HumanoidRootPart.Position);
	elseif isPhantom then
		return worldToScreen(target.Character.Torso.Position);
	end
end

-------------------------------------------------------------------------------------------------

if _G.Circle then _G.Circle:Remove(); end
_G.Circle = Drawing.new("Circle");
_G.Circle.Radius = 150;
_G.Circle.NumSides = 20;
_G.Circle.Color = Color3.fromRGB(255,0,0);
_G.Circle.Thickness = 1;
_G.Circle.Position = getMousePos() + Vector2.new(0, 36);

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

local updateAimbot = Instance.new("BindableEvent");
coroutine.wrap(function()
	while game:GetService("RunService").RenderStepped:Wait() do
		updateAimbot:Fire();
	end
end)();

_G.ezhubAimbot = updateAimbot.Event:Connect(function()

	_G.Circle.Position = getMousePos() + Vector2.new(0, 36);
	_G.Circle.Color = Color3.fromRGB(aimbotSettings.fovcolor[1], aimbotSettings.fovcolor[2], aimbotSettings.fovcolor[3]);
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
	if target and (isPhantom and target:FindFirstChild("Left Arm") or true) then
		local aimAt, visible = aimAtCallback(target);
		if aimAt and aimAt.X and aimAt.Y then
			mousemoverel(
			(aimAt.X - getMousePos().X) / aimbotSettings.smoothness,
			(aimAt.Y - getMousePos().Y) / aimbotSettings.smoothness
			- 2);	-- The 2 pixels is just a little bit of bullet compensation (I could not be bothered making a proper system)
		end
	end

end)

_G.unloadAimbot = function()
	if _G.ezhubAimbot then _G.ezhubAimbot:Disconnect() end
	if _G.Circle then _G.Circle:Remove() end
end

_G.change = function(p, v)
	aimbotSettings[p] = v;
end

return aimbotSettings;
