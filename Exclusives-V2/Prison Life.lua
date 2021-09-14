-- Prison life Script

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("Prison Life", nil, nil, nil, 155615604);
local main = mainGUI.newTab("Main");
loadstring(_G["EzHubModules"]["createuniversalmodule"])().newUniversalTab(mainGUI);
loadstring(_G["EzHubModules"]["createaimbotmodule"])().newAimbotTab(mainGUI);
local gun = mainGUI.newTab("Guns");
loadstring(_G["EzHubModules"]["createespmodule"])().newESPTab(mainGUI);
loadstring(_G["EzHubModules"]["createuniversalmodule"])().newTeleportTab(mainGUI);
local teleport = mainGUI.getTab("Teleport");

----------------------------------------------------------------------
-- Main Section

main.newTitle("Team Changer");
main.newDiv();

main.newButton("Netural", function()
	workspace.Remote.TeamEvent:FireServer("Medium stone grey");
end)

main.newButton("Prisoner", function()
	workspace.Remote.TeamEvent:FireServer("Bright orange");
end)

main.newButton("Police", function()
	workspace.Remote.TeamEvent:FireServer("Bright blue");
end)

main.newButton("Criminal", function()
	local LP = game.Players.LocalPlayer;
	local RE = LP.Character.HumanoidRootPart.Position;
	LP.Character.HumanoidRootPart.CFrame = CFrame.new(-919.958, 95.327, 2138.189);
	wait(0.075);
	LP.Character.HumanoidRootPart.CFrame = CFrame.new(RE);
end)

main.newDiv();
main.newTitle("Rage");

main.newButton("Kill All", function()
	local e = game.ReplicatedStorage.meleeEvent;
	local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
	workspace.Remote.TeamEvent:FireServer("Medium stone grey");

	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v ~= game.Players.LocalPlayer then
			repeat wait()
				local start = tick();
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame;
				e:FireServer(v);
				game.Players.LocalPlayer.Character.Humanoid.Sit = false;
			until v.Character.Humanoid.Health == 0 or tick() - start >= 6
		end
	end
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos;
end)

----------------------------------------------------------------------

-- Gun Section

gun.newTitle("Guns");
gun.newDiv();

gun.newButton("Give M4A1", function()
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M4A1"].ITEMPICKUP);
end)

gun.newButton("Give AK-47", function()
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP);
end)

gun.newButton("Give Remington 870", function()
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP);
end)

gun.newButton("Give M9", function()
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP);
end)

gun.newButton("Give Riot Shield", function()
	workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Riot Shield"].ITEMPICKUP);
end)

----------------------------------------------------------------------

-- Teleport Section

teleport.newDiv();
teleport.newTitle("Pre-made Teleports");

local function teleportPlayer(cords)
	local coordinate = string.split(cords, ",");
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
	CFrame.new(tonumber(coordinate[1]), tonumber(coordinate[2]), tonumber(coordinate[3]));
end

teleport.newDropdown("Pre-made Teleports", "Prison Entrance", {
	"Prison Entrance",
	"Gaurd Room",
	"Criminal Base",
	"Yard",
	"Prison Cells",
	"Cafe",
	"Main Tower",
	"Kitchen",
	"Prison Garage"
}, function(state)
	if state == "Prison Entrance" then
		teleportPlayer("474.655701, 98.1900101, 2250.36841");
	elseif state == "Gaurd Room" then
		teleportPlayer("798.664368, 99.9900055, 2264.11157");
	elseif state == "Criminal Base" then
		teleportPlayer("-942.058838, 94.1287842, 2056.36914");
	elseif state == "Yard" then
		teleportPlayer("767.570129, 97.9999466, 2461.25659");
	elseif state == "Prison Cells" then
		teleportPlayer("916.622131, 99.9899902, 2465.79858");
	elseif state == "Cafe" then
		teleportPlayer("960.83783, 99.9899597, 2340.33911");
	elseif state == "Main Tower" then
		teleportPlayer("823.287292, 130.039948, 2587.73975");
	elseif state == "Kitchen" then
		teleportPlayer("941.972778, 99.9899597, 2222.83716");
	elseif state == "Prison Garage" then
		teleportPlayer("614.918396, 98.2000275, 2512.02368");
	end
end);

----------------------------------------------------------------------

-- Active

mainGUI.openTab(main);
