return function(ezlib, section)
    ezlib:NewTitle(section, "ESP Engine V4")
    ezlib:NewDiv(section)
    
    local espConfig;
    if _G.ESPModule then
        espConfig = loadstring(_G.ESPModule)()
    else
        espConfig = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Exclusives-V2/Modules/ESPModule.lua"))()
    end

    ezlib:NewCheckBox(section, "Enabled", espConfig.Enabled, function(state)
        espConfig.Enabled = state
    end)
    
    ezlib:NewDiv(section)
    ezlib:NewTitle(section, "ESP Elements")
    
    ezlib:NewCheckBox(section, "Tracer", espConfig.tracer, function(state)
        espConfig.tracer = state
    end)
    
    ezlib:NewCheckBox(section, "Headdot", espConfig.headdot, function(state)
        espConfig.headdot = state
    end)
    
    ezlib:NewCheckBox(section, "Info Tag", espConfig.tag, function(state)
        espConfig.tag = state
    end)
    
    ezlib:NewDiv(section)
    ezlib:NewTitle(section, "ESP Behaviour")
    
    ezlib:NewCheckBox(section, "Lock to cursor", espConfig.locktocursor, function(state)
        espConfig.locktocursor = state
    end)
    
    ezlib:NewCheckBox(section, "Teamcheck", espConfig.teamcheck, function(state)
        espConfig.teamcheck = state
    end)
    
    ezlib:NewSlider(section, "Render Range", espConfig.renderrange, 100, 5000, function(val)
        espConfig.renderrange = val
    end)
    
    ezlib:NewDiv(section)
    ezlib:NewTitle(section, "ESP Colors")
    
    ezlib:NewCheckBox(section, "Rainbow", espConfig.rainbowcolor, function(state)
        espConfig.rainbowcolor = state
    end)
    
    ezlib:NewSlider(section, "Rainbow Speed", espConfig.rainbowspeed, 1, 5, function(val)
        espConfig.rainbowspeed = val
    end)
    
    ezlib:NewCheckBox(section, "Team Color", espConfig.teamcolor, function(state)
        espConfig.teamcolor = state
    end)
    
    ezlib:NewDiv(section)
    ezlib:NewTitle(section, "ESP SetColor")
    ezlib:NewSlider(section, "R", espConfig.setcolor[1], 0, 255, function(val)
        espConfig.setcolor[1] = val
    end)
    ezlib:NewSlider(section, "G", espConfig.setcolor[2], 0, 255, function(val)
        espConfig.setcolor[2] = val
    end)
    ezlib:NewSlider(section, "B", espConfig.setcolor[3], 0, 255, function(val)
        espConfig.setcolor[3] = val
    end)
    
    ezlib:NewDiv(section)
    ezlib:NewTitle(section, "Headdot Settings")
    
    ezlib:NewCheckBox(section, "Headdot Filled", espConfig.HeaddotFilled, function(state)
        espConfig.HeaddotFilled = state
    end)
    
    ezlib:NewSlider(section, "Headdot Scale", espConfig.HeaddotScale * 2, 1, 10, function(val)
        espConfig.HeaddotScale = val / 2
    end)
end
