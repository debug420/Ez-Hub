return function(ezlib, section)

    ezlib:NewTitle(section, "Aimbot")
    ezlib:NewDiv(section)

    local aimbotsettings;
    if _G.AimbotModule then
        aimbotsettings = loadstring(_G.AimbotModule)()
    else
        aimbotsettings = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Exclusives-V2/Modules/AimbotModule.lua"))()
    end

    ezlib:NewCheckBox(section, "Enabled", aimbotsettings.enabled, function(state)
        aimbotsettings.enabled = state;
    end)

    ezlib:NewCheckBox(section, "Free For All", aimbotsettings.freeforall, function(state)
        aimbotsettings.freeforall = state;
    end)

    ezlib:NewCheckBox(section, "Headshot Only", aimbotsettings.headshot, function(state)
        aimbotsettings.headshot = state;
    end)

    ezlib:NewCheckBox(section, "WallCheck", aimbotsettings.wallcheck, function(state)
        aimbotsettings.wallcheck = state;
    end)

    ezlib:NewSlider(section, "Radius", aimbotsettings.radius, 10, 400, function(val)
        aimbotsettings.radius = val
    end)

    ezlib:NewCheckBox(section, "Show FOV", aimbotsettings.showfov, function(state)
        aimbotsettings.showfov = state
    end)

    ezlib:NewDiv(section)

    ezlib:NewCheckBox(section, "Right-mouse", aimbotsettings.rightmouse, function(state)
        aimbotsettings.rightmouse = state;
    end)

    ezlib:NewKeyBind(section, "Keybind", aimbotsettings.keybind, function(i)
        aimbotsettings.keybind = i.KeyCode;
    end)

end
