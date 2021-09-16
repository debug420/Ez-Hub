-- Redwood Prison Script

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("Redwood Prison", nil, nil, nil, 402122991);
local main = mainGUI.newTab("Main");
loadstring(_G["EzHubModules"]["createuniversalmodule"])().newUniversalTab(mainGUI);
loadstring(_G["EzHubModules"]["createaimbotmodule"])().newAimbotTab(mainGUI);
loadstring(_G["EzHubModules"]["createespmodule"])().newESPTab(mainGUI);
loadstring(_G["EzHubModules"]["createuniversalmodule"])().newTeleportTab(mainGUI, {
	["Prison Entrance"] = CFrame.new(128.391846, 4, -165.008377),
	["Heli-Pad"] = CFrame.new(261.763123, 6.91001606, 112.712425),
	["Basketball Court"] = CFrame.new(243.292923, 4.32000971, -80.9519501),
	["Police Garage"] = CFrame.new(12.1939754, 5, -355.293945),
	["Cafe"] = CFrame.new(-0.0495917872, 4, -113.983582),
	["Fake ID Spawn"] = CFrame.new(-425.097961, -23.9986668, -518.573669),
	["Gaurd Room"] = CFrame.new(113.882286, 4, 8.74197102),
	["Fugitives Base"] = CFrame.new(-617.956909, -24.7896214, -329.70224),
	["Prison Cells"] = CFrame.new(-14, 4, 20)
});
local rage = mainGUI.newTab("Rage");

----------------------------------------------------------------------
-- Main Section

main.newTitle("Main Cheats");
main.newDiv();

local function getGamePasses(s)
	local t = {
		"hasSwat",
		"hasSpecOps",
		"hasMerc",
		"hasPilot",
		"hasAtv"
	}
	
	for i,v in pairs(t) do
	   workspace.resources.RemoteFunction:InvokeServer("setDataValue", v, s);
	end

	ezlib.newNotif(ezlib.enum.notifType.longText, "All gamepasses are now owned. You cannot drive helicopter or ATVs.").play().delete();
end

main.newButton("Give All Guns", function()
	
	getGamePasses(true);
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
	
	local old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
	
	for i,v in pairs(t) do
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = get(v).CFrame;
		workspace.resources.RemoteFunction:InvokeServer("giveItemFromGunGiver", get(v));
	end
	
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = old;
end)

main.newDiv();

main.newButton("Own All Gamepasses", function()
	getGamePasses(true);
end)

main.newButton("Un-own All Gamepasses", function()
	getGamePasses(false);
end)

main.newDiv();

main.newButton("Inmate", function()
	workspace.resources.RemoteFunction:InvokeServer("requestTeam", "prisoners");
end)

main.newButton("Fugitive", function()
	local PrevLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-600.429688, -24.2923031, -343.648865); wait();
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PrevLocation;
end)

main.newButton("Police", function()
	workspace.resources.RemoteFunction:InvokeServer("requestTeam", "police");
end)

----------------------------------------------------------------------
-- Rage Section

rage.newTitle("Rage");
rage.newDiv();

local function kill(player)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame;
	workspace.resources.RemoteEvent:FireServer("becomeHostile");
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame;
	workspace.resources.RemoteEvent:FireServer("dealMeleeDamage", player.Character.Humanoid, 100);
end

local function loopKill()
	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v ~= game.Players.LocalPlayer and v.Team ~= game.Players.LocalPlayer.Team then
			repeat wait()
				local start = tick();
				kill(v);
				game.Players.LocalPlayer.Character.Humanoid.Sit = false;
			until v.Character.Humanoid.Health == 0 or tick() - start >= 6
		end
	end
end

local function killAll()
	local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
	workspace.resources.RemoteFunction:InvokeServer("requestTeam", "police");
	loopKill();
	workspace.resources.RemoteFunction:InvokeServer("requestTeam", "prisoners");
	loopKill();
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos;
end

rage.newButton("Kill All", killAll);

rage.newDiv();
rage.newTitle("Player Specific");

local rageTarget = game:GetService("Players"):GetPlayers()[1];

local rageTargetDropdown = rage.newDropdown("Rage Target", rageTarget.Name, game:GetService("Players"):GetPlayers(), function(state)
	rageTarget = game:GetService("Players")[state];
end)
local function updateRageTargetDropdown()
	rageTargetDropdown.changeData(game:GetService("Players"):GetPlayers());
end
game:GetService("Players").PlayerAdded:Connect(updateRageTargetDropdown);
game:GetService("Players").PlayerRemoving:Connect(updateRageTargetDropdown);

local invalidPlayerNotif = ezlib.newNotif(ezlib.enum.notifType.text, "Invalid player has been inputted!");

rage.newButton("Kill Player", function()
	if rageTarget ~= nil and rageTarget ~= game.Players.LocalPlayer then
		local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
		repeat wait()
			if rageTarget.Team.Name == "Prisoners" then
				workspace.resources.RemoteFunction:InvokeServer("requestTeam", "police");
			else
				workspace.resources.RemoteFunction:InvokeServer("requestTeam", "prisoners");
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = rageTarget.Character.HumanoidRootPart.CFrame;
			kill(rageTarget);
		until rageTarget.Character.Humanoid.Health == 0;
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos;
	else
		invalidPlayerNotif.play();
	end
end)

rage.newButton("Teleport To Player", function()
	if rageTarget ~= nil and rageTarget ~= game.Players.LocalPlayer then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
		rageTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0,3,0);
	else
		invalidPlayerNotif.play();
	end
end)

rage.newButton("Spectate Player", function()
	if rageTarget ~= nil and rageTarget ~= game.Players.LocalPlayer then
		workspace.CurrentCamera.CameraSubject = rageTarget.Character;
	else
		invalidPlayerNotif.play();
	end
end)

rage.newButton("Un-spectate Player", function()
	if rageTarget ~= nil and rageTarget ~= game.Players.LocalPlayer then
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character;
	else
		invalidPlayerNotif.play();
	end
end)

----------------------------------------------------------------------
-- Active

mainGUI.openTab(main);

