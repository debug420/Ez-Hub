-- Phantom Forces Script

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();
local mainGUI = ezlib.create("Phantom Forces", nil, nil, nil, 292439477);

----------------------------------------------------------------------
-- Functions have been declared in _G so that aimbot and ESP and can utilize them

for i,v in pairs(getgc(true)) do
	if type(v) == "table" and rawget(v, "getbodyparts") then
		_G.getBodyparts = v.getbodyparts;
	end
end

_G.getCharacterFromPlayerInstance = function(player, bodyParts)
	if bodyParts then
		return bodyParts["larm"].Parent;
	else
		return _G.getBodyparts(player)["larm"].Parent;
	end
end

_G.getPlayerInstanceFromCharacter = function(character)
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        local bp = _G.getBodyparts(v);
        if bp and bp["larm"] == character:FindFirstChild("Left Arm") then
            return v;
        end
    end
end

local oldIndex;
oldIndex = hookmetamethod(game, "__index", function(self, index)
	if game:GetService("Players"):FindFirstChild(tostring(self))
	and tostring(index) == "Character" and checkcaller() then
		local bodyParts = _G.getBodyparts(self);
		if bodyParts then
			return _G.getCharacterFromPlayerInstance(self, bodyParts);
		end
	end
	return oldIndex(self, index);
end)

----------------------------------------------------------------------
-- Aimbot module

loadstring(_G["EzHubModules"]["createaimbotmodule"])().newAimbotTab(mainGUI);

----------------------------------------------------------------------
-- ESP module

loadstring(_G["EzHubModules"]["createespmodule"])().newESPTab(mainGUI);

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
