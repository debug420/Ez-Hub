----------------------------------------------------------------------

-- Redwood Prison Script

local ezlib;
if _G.CachedEzLib then
	ezlib = loadstring(_G.CachedEzLib)()
else
	ezlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Modules/EzLib.lua"))()
end

local DontLoad = false
if game.PlaceId ~= 402122991 then
    ezlib:CreateNotice("Failed GameID Check", "The following exclusive that has been executed is not designed for the following game. This could cause the script to misfunction and break. Proceed anyway?", function(response)
        if response ~= "Yes" then
            DontLoad = true
        end
    end)
end
if DontLoad then return end

local MainRedwood = ezlib:NewLib("Redwood Prison")

----------------------------------------------------------------------

-- Initialize Sections

local MainCheats = ezlib:NewSection(MainRedwood, "Main")
local LocalSection = ezlib:NewSection(MainRedwood, "Local")
local AimbotSection = ezlib:NewSection(MainRedwood, "Aimbot")
local TeleportsSection = ezlib:NewSection(MainRedwood, "Teleports")
local RageSection = ezlib:NewSection(MainRedwood, "Rage")

----------------------------------------------------------------------

-- Main Section

ezlib:NewTitle(MainCheats, "Main Cheats")
ezlib:NewDiv(MainCheats)

local function getgp(s)
	local t = {
		"hasSwat",
		"hasSpecOps",
		"hasMerc",
		"hasPilot",
		"hasAtv"
	}
	
	for i,v in pairs(t) do
	   workspace.resources.RemoteFunction:InvokeServer("setDataValue", v, s) 
	end
end

ezlib:NewButton(MainCheats, "Give All Guns", function()
	
	getgp(true)
	local t = {
		"L86A2",
		"M16",
		"Beretta M9",
		"M16",
		"SPAS-12",
		"Beretta M9",
		"M98B",
		"UMP-45",
		"M60",
		"M1014",
		"AK47",
		"Beretta M9",
		"Hammer",
		"Fake ID Card",
		"SPAS-12",
		"S&W 638",
		"ACR",
		"Revolver",
		"M14",
		"Makarov",
		"AK47-U",
		"Parachute"
	}
	
	local function get(n)
		for i,v in pairs(workspace:GetChildren()) do
			if v.Name == n and v:FindFirstChild("gunGiver") then
			   return v; 
			end
		end
	end
	
	local old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	
	for i,v in pairs(t) do
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = get(v).CFrame
		workspace.resources.RemoteFunction:InvokeServer("giveItemFromGunGiver", get(v)) 
	end
	
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = old
end)

ezlib:NewDiv(MainCheats);

ezlib:NewButton(MainCheats, "Own All Gamepasses", function()
	getgp(true)
end)

ezlib:NewButton(MainCheats, "Un-own All Gamepasses", function()
	getgp(false)
end)

ezlib:NewDiv(MainCheats);

ezlib:NewButton(MainCheats, "Inmate", function()
	workspace.resources.RemoteFunction:InvokeServer("requestTeam", "prisoners")
end)

ezlib:NewButton(MainCheats, "Fugitive", function()
	local PrevLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-600.429688, -24.2923031, -343.648865) wait()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PrevLocation
end)

ezlib:NewButton(MainCheats, "Police", function()
	workspace.resources.RemoteFunction:InvokeServer("requestTeam", "police")
end)

----------------------------------------------------------------------

-- Local Section

-- Game Meta Vars
local gamemt = getrawmetatable(game);
local oldindex = gamemt.__index;
local oldspeed, oldjump = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed, game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower
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

ezlib:NewSlider(LocalSection, "Walk Speed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 0, 200, function(val)
	game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = val
end)

ezlib:NewSlider(LocalSection, "Jump Power", game.Players.LocalPlayer.Character.Humanoid.JumpPower, 0, 300, function(val)
	game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = val
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

		if game:GetService("Players").LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
			flingcon = game:GetService('RunService').Stepped:Connect(function()
				game:GetService("Players").LocalPlayer.Character.Head.CanCollide = false
				game:GetService("Players").LocalPlayer.Character.Torso.CanCollide = false
				game:GetService("Players").LocalPlayer.Character["Left Leg"].CanCollide = false
				game:GetService("Players").LocalPlayer.Character["Right Leg"].CanCollide = false
			end)
		else
			flingcon = game:GetService('RunService').Stepped:Connect(function()
				game:GetService("Players").LocalPlayer.Character.Head.CanCollide = false
				game:GetService("Players").LocalPlayer.Character.UpperTorso.CanCollide = false
				game:GetService("Players").LocalPlayer.Character.LowerTorso.CanCollide = false
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CanCollide = false
			end)
		end
		
		local bt = Instance.new("BodyThrust")
		bt.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
		bt.Name = "nword"
		bt.Force = Vector3.new(flingpower, 0, flingpower)
		bt.Location = bt.Parent.Position

	else
		if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart["nword"] and flingcon ~= nil then
			flingcon:Disconnect()
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart["nword"]:Destroy()
		end
	end
end)

ezlib:NewSlider(LocalSection, "Fling Power", 500, 1, 1000, function(val)
	if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart["nword"] then
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart["nword"].Force = Vector3.new(flingpower, 0, flingpower)
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

-- Teleport Section

ezlib:NewTitle(TeleportsSection, "Teleports")
ezlib:NewDiv(TeleportsSection)

local function teleport(cords)
	local coordinate = string.split(cords, ",")
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(tonumber(coordinate[1]), tonumber(coordinate[2]), tonumber(coordinate[3]))
end

ezlib:NewButton(TeleportsSection, "Prison Entrance", function()
	teleport("128.391846, 4, -165.008377")
end)

ezlib:NewButton(TeleportsSection, "Heli-Pad", function()
	teleport("261.763123, 6.91001606, 112.712425")
end)

ezlib:NewButton(TeleportsSection, "Basketball Court", function()
	teleport("243.292923, 4.32000971, -80.9519501")
end)

ezlib:NewButton(TeleportsSection, "Police Garage", function()
	teleport("12.1939754, 5, -355.293945")
end)

ezlib:NewButton(TeleportsSection, "Cafe", function()
	teleport("-0.0495917872, 4, -113.983582")
end)

ezlib:NewButton(TeleportsSection, "Fake ID Spawn", function()
	teleport("-425.097961, -23.9986668, -518.573669")
end)

ezlib:NewButton(TeleportsSection, "Gaurd Room", function()
	teleport("113.882286, 4, 8.74197102")
end)

ezlib:NewButton(TeleportsSection, "Fugitives Base", function()
	teleport("-617.956909, -24.7896214, -329.70224")
end)

ezlib:NewButton(TeleportsSection, "Prison Cells", function()
	teleport("-14, 4, 20")
end)

----------------------------------------------------------------------

-- Rage Section

ezlib:NewTitle(RageSection, "Rage")
ezlib:NewDiv(RageSection)

local function kill(player)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
	workspace.resources.RemoteEvent:FireServer("becomeHostile")
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
	workspace.resources.RemoteEvent:FireServer("dealMeleeDamage", player.Character.Humanoid, 100)
end

local function loopkill()
	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v ~= game.Players.LocalPlayer and v.Team ~= game.Players.LocalPlayer.Team then
			repeat wait()
				local start = tick()
				kill(v)
				game.Players.LocalPlayer.Character.Humanoid.Sit = false
			until v.Character.Humanoid.Health == 0 or tick() - start >= 6
		end
	end
end

local function KillAll()
	local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	workspace.resources.RemoteFunction:InvokeServer("requestTeam", "police")
	loopkill()
	workspace.resources.RemoteFunction:InvokeServer("requestTeam", "prisoners")
	loopkill()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
end

ezlib:NewButton(RageSection, "Kill All", KillAll)

ezlib:NewDiv(RageSection);
ezlib:NewTitle(RageSection, "Player Specific")

local function GetRandomPlayer()
	local Target;
	repeat wait() Target = game:GetService("Players"):GetPlayers()[math.random(#game:GetService("Players"):GetPlayers())] until RageTarget ~= game.Players.LocalPlayer
	return Target;
end

local function FindPlayer(s)
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if string.find(v.Name:lower(), s:lower()) then return v end
	end
	return GetRandomPlayer()
end

local RageTarget = GetRandomPlayer()

local playerinput = ezlib:NewTextBox(RageSection, "Player Name", RageTarget.Name, function(txt)
	RageTarget = FindPlayer(txt)
end)

playerinput.FocusLost:Connect(function()
	playerinput.Text = FindPlayer(playerinput.Text).Name
end)

ezlib:NewButton(RageSection, "Kill Player", function()
	if RageTarget ~= nil and RageTarget ~= game.Players.LocalPlayer then
		local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		repeat wait() 
			if RageTarget.Team.Name == "Prisoners" then
				workspace.resources.RemoteFunction:InvokeServer("requestTeam", "police")
			else
				workspace.resources.RemoteFunction:InvokeServer("requestTeam", "prisoners") 
			end			
			kill(RageTarget) until RageTarget.Health == 0
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
	else
		ezlib:NewNotif(nil, "Invalid player has been inputted!", 5)
	end
end)
ezlib:NewButton(RageSection, "Teleport To Player", function()
	if RageTarget ~= nil and RageTarget ~= game.Players.LocalPlayer then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = RageTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0,3,0)
	else
		ezlib:NewNotif(nil, "Invalid player has been inputted!", 5)
	end
end)
ezlib:NewButton(RageSection, "Spectate Player", function()
	if RageTarget ~= nil and RageTarget ~= game.Players.LocalPlayer then
		workspace.CurrentCamera.CameraSubject = RageTarget.Character
	else
		ezlib:NewNotif(nil, "Invalid player has been inputted!", 5)
	end
end)
ezlib:NewButton(RageSection, "Un-spectate Player", function()
	if RageTarget ~= nil and RageTarget ~= game.Players.LocalPlayer then
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
	else
		ezlib:NewNotif(nil, "Invalid player has been inputted!", 5)
	end
end)

----------------------------------------------------------------------

-- Active

ezlib:SetActive(MainCheats);

