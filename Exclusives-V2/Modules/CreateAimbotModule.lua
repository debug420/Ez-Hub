return {
    newAimbotTab = function(mainGUIInstance, moduleData)

        -- The below checks if a custom moduleData has been provided.
        -- If so, it will check if it is a function, if so it will run it and work with its return values
        -- If not, it will loadstring it (assuming it is a string)
        -- If moduleData has not been provided, it will loadstring default
        local aimbotModule = moduleData and
        (type(moduleData) == "function" and moduleData() or loadstring(moduleData)())
        or loadstring(_G["EzHubModules"]["aimbotmodule"])();    -- default

        local tab = mainGUIInstance.newTab("Aimbot");
        tab.newTitle("Aimbot");
        tab.newDiv();

        tab.newCheckbox("Enabled", aimbotModule.enabled, function(state)
            aimbotModule.enabled = state;
        end)

        tab.newDiv();

        tab.newCheckbox("Free For All", aimbotModule.freeforall, function(state)
            aimbotModule.freeforall = state;
        end)
    
        tab.newCheckbox("Headshot Only", aimbotModule.headshot, function(state)
            aimbotModule.headshot = state;
        end)
    
        tab.newCheckbox("WallCheck", aimbotModule.wallcheck, function(state)
            aimbotModule.wallcheck = state;
        end)

        tab.newDiv();
        tab.newTitle("Keybind and Smoothness")

        tab.newSlider("Smoothness", aimbotModule.smoothness * 10, 10, 30, function(state)
            aimbotModule.smoothness = state / 10;
        end)
    
        tab.newCheckbox("Right-mouse", aimbotModule.rightmouse, function(state)
            aimbotModule.rightmouse = state;
        end)
    
        tab.newKeybind("Keybind", aimbotModule.keybind, function(i)
            aimbotModule.keybind = i.Name;
        end)

        tab.newDiv();
        tab.newTitle("FOV");

        tab.newCheckbox("Show FOV", aimbotModule.showfov, function(state)
            aimbotModule.showfov = state;
        end)

        tab.newSlider("Radius", aimbotModule.radius, 10, 400, function(val)
            aimbotModule.radius = val;
        end)

        tab.newSlider("R", aimbotModule.fovcolor[1], 0, 255, function(state)
            aimbotModule.fovcolor[1] = state;
        end)

        tab.newSlider("G", aimbotModule.fovcolor[2], 0, 255, function(state)
            aimbotModule.fovcolor[2] = state;
        end)

        tab.newSlider("B", aimbotModule.fovcolor[3], 0, 255, function(state)
            aimbotModule.fovcolor[3] = state;
        end)

        return aimbotModule;
        
    end
}
