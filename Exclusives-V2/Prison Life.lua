----------------------------------------------------------------------

-- Prison life Script

local ezlib;
if _G.CachedEzLib then
	ezlib = loadstring(_G.CachedEzLib)()
else
	ezlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Modules/EzLib.lua"))()
end

local DontLoad = false
if game.PlaceId ~= 155615604 then
    ezlib:CreateNotice("Failed GameID Check", "The following exclusive that has been executed is not designed for the following game. This could cause the script to misfunction and break. Proceed anyway?", function(response)
        if response ~= "Yes" then
            DontLoad = true
        end
    end)
end
if DontLoad then return end

local MainPrisonLife = ezlib:NewLib("Prison Life")

----------------------------------------------------------------------

-- Initialize Sections

local LocalSection = ezlib:NewSection(MainPrisonLife, "Local")
local AimbotSection = ezlib:NewSection(MainPrisonLife, "Aimbot")
local GunSection = ezlib:NewSection(MainPrisonLife, "Gun Mods")
local TeleportSection = ezlib:NewSection(MainPrisonLife, "Teleports")
local MiscSection = ezlib:NewSection(MainPrisonLife, "Misc")

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

-- Gun Section

-- Gun Mod Func

local GunModConfigs = {
	MaxAmmo = math.huge,
	CurrentAmmo = math.huge,
	StoredAmmo = math.huge,
	FireRate = 0.01,
	AutoFire = true,
	ReloadTime = 0,
	Bullets = 10
}

local defaultconfigs = {
	["M4A1"] = {
		Damage = 11, 
		Description = "Remember to put a description here BEFORE the game is published -Me", 
		MaxAmmo = 30, 
		CurrentAmmo = 30, 
		StoredAmmo = 600, 
		FireRate = 0.0875, 
		AutoFire = true, 
		Range = 800, 
		Spread = 18, 
		ReloadTime = 2, 
		Bullets = 1, 
		ReloadAnim = "ReloadMagazine", 
		ShootAnim = "ShootBullet", 
		HoldAnim = "Hold", 
		FireSoundId = "http://www.roblox.com/asset/?id=2934888536", 
		SecondarySoundId = nil, 
		ReloadSoundId = "http://www.roblox.com/asset/?id=2934887229"
	},
	["Remington 870"] = {
		Damage = 15, 
		Description = "Remember to put a description here BEFORE the game is published -Me", 
		MaxAmmo = 6, 
		CurrentAmmo = 6, 
		StoredAmmo = 600, 
		FireRate = 0.8, 
		AutoFire = false, 
		Range = 400, 
		Spread = 3, 
		ReloadTime = 4, 
		Bullets = 5, 
		ReloadAnim = "ReloadShells", 
		ShootAnim = "ShootShell", 
		HoldAnim = "Hold", 
		FireSoundId = "http://www.roblox.com/asset/?id=2934889760", 
		SecondarySoundId = "http://www.roblox.com/asset/?id=255061173", 
		ReloadSoundId = "http://www.roblox.com/asset/?id=2934888952"
	},
	["AK-47"] = {
		Damage = 11, 
		Description = "Remember to put a description here BEFORE the game is published -Me", 
		MaxAmmo = 30, 
		CurrentAmmo = 30, 
		StoredAmmo = 600, 
		FireRate = 0.1, 
		AutoFire = true, 
		Range = 800, 
		Spread = 14, 
		ReloadTime = 2, 
		Bullets = 1, 
		ReloadAnim = "ReloadMagazine", 
		ShootAnim = "ShootBullet", 
		HoldAnim = "Hold", 
		FireSoundId = "http://www.roblox.com/asset/?id=2934888736", 
		SecondarySoundId = nil, 
		ReloadSoundId = "http://www.roblox.com/asset/?id=2934887229"
	},
	["M9"] = {
		Damage = 10, 
		Description = "Remember to put a description here BEFORE the game is published -Me", 
		MaxAmmo = 15, 
		CurrentAmmo = 15, 
		StoredAmmo = 100, 
		FireRate = 0.08, 
		AutoFire = false, 
		Range = 600, 
		Spread = 11, 
		ReloadTime = 2, 
		Bullets = 1, 
		ReloadAnim = "ReloadMagazine", 
		ShootAnim = "ShootBullet", 
		HoldAnim = "Hold", 
		FireSoundId = "http://www.roblox.com/asset/?id=2934888024", 
		SecondarySoundId = nil, 
		ReloadSoundId = "http://www.roblox.com/asset/?id=2934887229"
	}
}

local function returnguns()
	local t = {}
	local function loopthrough(a)
		for i,v in pairs(a) do
			if v.Name == "M9" or v.Name == "AK-47" or v.Name == "Remington 870" or v.Name == "M4A1" then
				table.insert(t, 1, v)
			end
		end
	end
	loopthrough(game.Players.LocalPlayer.Character:GetChildren())
	loopthrough(game.Players.LocalPlayer.Backpack:GetChildren())
	return t;
end

local function UpdateGunMod(c)
	local tool = returnguns()
	if #tool < 0 then return end;
	for _,v in pairs(tool) do
		local m = require(v.GunStates)
		if c then
			for i,v in pairs(c[v.Name]) do
				if m[i] then rawset(m, i, v) end
			end		
		else
			for i,v in pairs(GunModConfigs) do
				if m[i] then rawset(m, i, v) end
			end	
		end
	end
end

ezlib:NewTitle(GunSection, "Gun Mods")
ezlib:NewDiv(GunSection)

ezlib:NewButton(GunSection, "Give M4A1", function()
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M4A1"].ITEMPICKUP)
end)

ezlib:NewButton(GunSection, "Give AK-47", function()
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
end)

ezlib:NewButton(GunSection, "Give Remington 870", function()
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
end)

ezlib:NewButton(GunSection, "Give M9", function()
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
end)

ezlib:NewButton(GunSection, "Give Riot Shield", function()
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Riot Shield"].ITEMPICKUP)
end)

-- ezlib:NewDiv(GunSection)
-- ezlib:NewTitle(GunSection, "Mods")

-- ezlib:NewButton(GunSection, "Mod Gun", function()
-- 	UpdateGunMod()
-- end)

-- ezlib:NewButton(GunSection, "Unmod Gun", function()
-- 	UpdateGunMod(defaultconfigs)
-- end)

-- ezlib:NewDiv(GunSection)
-- ezlib:NewTitle(GunSection, "Advanced Customization")

-- ezlib:NewCheckBox(GunSection, "No Reload", true, function(state)
-- 	if state then
-- 		GunModConfigs.ReloadTime = 0;
-- 	else
-- 		GunModConfigs.ReloadTime = 3;
-- 	end
-- end)

-- ezlib:NewCheckBox(GunSection, "Auto-Fire", true, function(state)
-- 	GunModConfigs.AutoFire = state;
-- end)

-- ezlib:NewCheckBox(GunSection, "Max Damage", true, function(state)
-- 	if state then
-- 		GunModConfigs.Bullets = 100
-- 	else
-- 		GunModConfigs.Bullets = 1
-- 	end
-- end)

-- ezlib:NewCheckBox(GunSection, "Max Ammo", true, function(state)
-- 	if state then
-- 		GunModConfigs.MaxAmmo = math.huge
-- 	else
-- 		GunModConfigs.MaxAmmo = 1000
-- 	end	
-- end)

-- ezlib:NewCheckBox(GunSection, "Max Current Ammo", true, function(state)
-- 	if state then
-- 		GunModConfigs.CurrentAmmo = math.huge
-- 	else
-- 		GunModConfigs.CurrentAmmo = 1000
-- 	end
-- end)

-- ezlib:NewCheckBox(GunSection, "Max Stored Ammo", true, function(state)
-- 	if state then
-- 		GunModConfigs.StoredAmmo = math.huge
-- 	else
-- 		GunModConfigs.StoredAmmo = 1000
-- 	end
-- end)

----------------------------------------------------------------------

-- Teleport Section

ezlib:NewTitle(TeleportSection, "Teleports")
ezlib:NewDiv(TeleportSection)

function teleport(cords)
	local coordinate = string.split(cords, ",")
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(tonumber(coordinate[1]), tonumber(coordinate[2]), tonumber(coordinate[3]))
end

ezlib:NewButton(TeleportSection, "Prison Entrance", function()
	teleport("474.655701, 98.1900101, 2250.36841")
end)

ezlib:NewButton(TeleportSection, "Gaurd Room", function()
	teleport("798.664368, 99.9900055, 2264.11157")
end)

ezlib:NewButton(TeleportSection, "Criminal Base", function()
	teleport("-942.058838, 94.1287842, 2056.36914")
end)

ezlib:NewButton(TeleportSection, "Yard", function()
	teleport("767.570129, 97.9999466, 2461.25659")
end)

ezlib:NewButton(TeleportSection, "Prison Cells", function()
	teleport("916.622131, 99.9899902, 2465.79858")
end)

ezlib:NewButton(TeleportSection, "Cafe", function()
	teleport("960.83783, 99.9899597, 2340.33911")
end)

ezlib:NewButton(TeleportSection, "Main Tower", function()
	teleport("823.287292, 130.039948, 2587.73975")
end)

ezlib:NewButton(TeleportSection, "Kitchen", function()
	teleport("941.972778, 99.9899597, 2222.83716")
end)

ezlib:NewButton(TeleportSection, "Prison Garage", function()
	teleport("614.918396, 98.2000275, 2512.02368")
end)

----------------------------------------------------------------------

-- Misc Section

-- Super Punch (NOT MADE BY ME. MADE BY SOME RANDOM RETARD)

local superpunchtoggle = false

local mainRemotes = game.ReplicatedStorage 
local meleeRemote = mainRemotes['meleeEvent'] 
local mouse = game.Players.LocalPlayer:GetMouse() 
local punching = false 
local cooldown = false 
local function punch()
    cooldown = true 
    local part = Instance.new("Part", game.Players.LocalPlayer.Character) 
    part.Transparency = 1 
    part.Size = Vector3.new(5, 2, 3) 
    part.CanCollide = false 
    local w1 = Instance.new("Weld", part) 
    w1.Part0 = game.Players.LocalPlayer.Character.Torso 
    w1.Part1 = part 
    w1.C1 = CFrame.new(0,0,2) 
    part.Touched:connect(function(hit)
        if game.Players:FindFirstChild(hit.Parent.Name) then 
            local plr = game.Players:FindFirstChild(hit.Parent.Name)
            if plr.Name ~= game.Players.LocalPlayer.Name then 
                part:Destroy()
                for i = 1,100 do
                    meleeRemote:FireServer(plr)
                end 
            end 
        end 
    end) 
    wait(1) 
    cooldown = false 
    part:Destroy() 
end 
mouse.KeyDown:connect(function(key)
    if cooldown == false then 
		if key:lower() == "f" and superpunchtoggle then 
            punch() 
        end 
    end 
end)

ezlib:NewTitle(MiscSection, "Team Changer")

ezlib:NewButton(MiscSection, "Netural", function()
	workspace.Remote.TeamEvent:FireServer("Medium stone grey") 
end)

ezlib:NewButton(MiscSection, "Prisoner", function()
	workspace.Remote.TeamEvent:FireServer("Bright orange") 
end)

ezlib:NewButton(MiscSection, "Police", function()
	workspace.Remote.TeamEvent:FireServer("Bright blue")
end)

ezlib:NewButton(MiscSection, "Criminal", function()
	local LP = game.Players.LocalPlayer
	local RE = LP.Character.HumanoidRootPart.Position
	LP.Character.HumanoidRootPart.CFrame = CFrame.new(-919.958, 95.327, 2138.189)
	wait(0.075)
	LP.Character.HumanoidRootPart.CFrame = CFrame.new(RE)
end)

ezlib:NewDiv(MiscSection)
ezlib:NewTitle(MiscSection, "Rage")

ezlib:NewButton(MiscSection, "Kill All", function()
	local e = game.ReplicatedStorage.meleeEvent
	local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	workspace.Remote.TeamEvent:FireServer("Medium stone grey")

	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v ~= game.Players.LocalPlayer then
			repeat wait()
				local start = tick()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
				e:FireServer(v)
				game.Players.LocalPlayer.Character.Humanoid.Sit = false
			until v.Character.Humanoid.Health == 0 or tick() - start >= 6
		end
	end
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
end)

ezlib:NewCheckBox(MiscSection, "Super-Punch",false, function(state)
    superpunchtoggle = state
end)

----------------------------------------------------------------------

-- Active

ezlib:SetActive(LocalSection);
