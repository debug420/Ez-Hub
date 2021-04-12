----------------------------------------------------------------------

-- Universal Script

local ezlib;
if _G.CachedEzLib then
	ezlib = loadstring(_G.CachedEzLib)()
else
	ezlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Modules/EzLib.lua"))()
end
--local ezlib = loadstring(readfile("test.txt"))()
local Main = ezlib:NewLib("Universal")

----------------------------------------------------------------------

-- Initialize Sections

local LocalSection = ezlib:NewSection(Main, "Main")
local AimbotSection = ezlib:NewSection(Main, "Aimbot")
local ESPSection = ezlib:NewSection(Main, "ESP")
local MiscSection = ezlib:NewSection(Main, "Misc")

----------------------------------------------------------------------

-- Local Section

-- Game Meta Vars
local gamemt = getrawmetatable(game);
local oldindex = gamemt.__index;
local oldspeed, oldjump = pcall(function() return char.Humanoid.WalkSpeed end) or 16, pcall(function() return char.Humanoid.JumpPower end) or 50
local IndexAnticheat = false

-- Noclip
local noclip = false
local flynoclip = false
game:GetService("RunService").RenderStepped:Connect(function()
	if noclip or flynoclip then
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
	end
end)

-- Fly Vars

local char = game.Players.LocalPlayer.Character
local flysettings = {
	enabled = false,
	speed = 5
}
local holding = {
	["w"] = false,
	["a"] = false,
	["s"] = false,
	["d"] = false,
	["e"] = false,
	["q"] = false
}

-- Fly Script

pcall(function()
	do
		game:GetService("UserInputService").InputBegan:Connect(function(key)
			if holding[tostring(key.KeyCode.Name):lower()] ~= nil then
				holding[tostring(key.KeyCode.Name):lower()] = true
			end
		end)
		game:GetService("UserInputService").InputEnded:Connect(function(key)
			if holding[tostring(key.KeyCode.Name):lower()] ~= nil then
				holding[tostring(key.KeyCode.Name):lower()] = false
			end
		end)
		coroutine.resume(coroutine.create(function()
			while wait() do
				if flysettings.enabled then
					flynoclip = true
					if holding["w"] then
						char.HumanoidRootPart.CFrame = char.Torso.CFrame:ToWorldSpace(CFrame.new(0, 0, -1 * flysettings.speed))
					end
					if holding["a"] then
						char.HumanoidRootPart.CFrame = char.Torso.CFrame:ToWorldSpace(CFrame.new(flysettings.speed, 0, 0))
					end
					if holding["s"] then
						char.HumanoidRootPart.CFrame = char.Torso.CFrame:ToWorldSpace(CFrame.new(0, 0, flysettings.speed))
					end
					if holding["d"] then
						char.HumanoidRootPart.CFrame = char.Torso.CFrame:ToWorldSpace(CFrame.new(-1 * flysettings.speed, 0, 0))
					end
					if holding["e"] then
						char.HumanoidRootPart.CFrame = char.Torso.CFrame:ToWorldSpace(CFrame.new(0, flysettings.speed, 0))
					end
					if holding["q"] then
						char.HumanoidRootPart.CFrame = char.Torso.CFrame:ToWorldSpace(CFrame.new(0, -1 * flysettings.speed, 0))
					end
				else
					flynoclip = false
				end
			end
		end))
	end
end)

ezlib:NewTitle(LocalSection, "General Cheats")
ezlib:NewDiv(LocalSection)

-- Anticheat for walkspeed and jumppower for games with client sided val checks

setreadonly(gamemt, false)
gamemt.__index = newcclosure(function(self, key)
	if key == "WalkSpeed" and self == game.Players.LocalPlayer.Character.Humanoid and IndexAnticheat then
		return oldspeed;
	elseif key == "JumpPower" and self == game.Players.LocalPlayer.Character.Humanoid and IndexAnticheat then
		return oldjump;
	else
		return oldindex(self, key);
	end
end)
setreadonly(gamemt, true)

local char = char
local hum; if char then hum = char:FindFirstChild("Humanoid") end 
local function Gethumval(v)
	if hum then return hum[v] end;
end

ezlib:NewSlider(LocalSection, "Walk Speed", Gethumval("WalkSpeed") or 16, 0, 200, function(val)
	char.Humanoid.WalkSpeed = val
end)

ezlib:NewSlider(LocalSection, "Jump Power", Gethumval("JumpPower") or 50, 0, 300, function(val)
	char.Humanoid.JumpPower = val
end)

ezlib:NewCheckBox(LocalSection, "No-Clip", false, function(state)
	noclip = state
end)

ezlib:NewCheckBox(LocalSection, "Index Anticheat", false, function(state)
	IndexAnticheat = state
end)

ezlib:NewDiv(LocalSection)

ezlib:NewCheckBox(LocalSection, "Fly", false, function(state)
	flysettings.enabled = state
end)

ezlib:NewSlider(LocalSection, "Fly Speed", 5, 1, 50, function(val)
	flysettings.speed = val
end)

ezlib:NewDiv(LocalSection)

-- Fling Vars

local flingpower = 500

ezlib:NewCheckBox(LocalSection, "Fling", false, function(state)
	if state then

		if char.Humanoid.RigType == Enum.HumanoidRigType.R6 then
			flingcon = game:GetService('RunService').Stepped:Connect(function()
				char.Head.CanCollide = false
				char.Torso.CanCollide = false
				char["Left Leg"].CanCollide = false
				char["Right Leg"].CanCollide = false
			end)
		else
			flingcon = game:GetService('RunService').Stepped:Connect(function()
				char.Head.CanCollide = false
				char.UpperTorso.CanCollide = false
				char.LowerTorso.CanCollide = false
				char.HumanoidRootPart.CanCollide = false
			end)
		end
		
		local bt = Instance.new("BodyThrust")
		bt.Parent = char.HumanoidRootPart
		bt.Name = "nword"
		bt.Force = Vector3.new(flingpower, 0, flingpower)
		bt.Location = bt.Parent.Position

	else
		if char.HumanoidRootPart["nword"] and flingcon ~= nil then
			flingcon:Disconnect()
			char.HumanoidRootPart["nword"]:Destroy()
		end
	end
end)

ezlib:NewSlider(LocalSection, "Fling Power", 500, 1, 1000, function(val)
	if char.HumanoidRootPart["nword"] then
		char.HumanoidRootPart["nword"].Force = Vector3.new(flingpower, 0, flingpower)
		flingpower = val
	else
		flingpower = val
	end
end)

----------------------------------------------------------------------

-- Aimbot Section

if _G.CreateAimbotModule then
	loadstring(_G.CreateAimbotModule)()(ezlib, AimbotSection)
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Exclusives-V2/Modules/CreateAimbotModule.lua"))()(ezlib, AimbotSection)
end

----------------------------------------------------------------------

-- ESP Section

if _G.CreateESPModule then
	loadstring(_G.CreateESPModule)()(ezlib, ESPSection)
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Exclusives-V2/Modules/CreateESPModule.lua"))()(ezlib, ESPSection)
end

----------------------------------------------------------------------

-- Misc Section

ezlib:NewTitle(MiscSection, "Misc")
ezlib:NewDiv(MiscSection)

-- Inf Jump Script

local infjumpenabled = false
game:GetService("UserInputService").JumpRequest:Connect(function()
    if infjumpenabled then
        char.Humanoid:ChangeState("Jumping")
    end
end)

ezlib:NewCheckBox(MiscSection, "Inf Jump", false, function(state)
    infjumpenabled = state
end)

ezlib:NewCheckBox(MiscSection, "Xray", false, function(state)
    if state then
        for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and not v.Parent.Parent:FindFirstChild("Humanoid") then
				v.Transparency = v.Transparency + 0.5
			end
		end
    else
        for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and not v.Parent.Parent:FindFirstChild("Humanoid") then
				v.Transparency = v.Transparency - 0.5
			end
		end
    end
end)

ezlib:NewSlider(MiscSection, "FOV", 70, 1, 120, function(val)
    workspace.Camera.FieldOfView = val
end)

ezlib:NewSlider(MiscSection, "Gravity", 190, 1, 500, function(val)
    workspace.Gravity = val
end)

ezlib:NewButton(MiscSection, "Give Btools", function()
    local tool1 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
	local tool2 = Instance.new("HopperBin",game.Players.LocalPlayer.Backpack)
	tool1.BinType = "Clone"
	tool2.BinType = "Hammer"
end)

----------------------------------------------------------------------

-- Active

ezlib:SetActive(LocalSection);

