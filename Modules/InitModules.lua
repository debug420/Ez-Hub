
return {
    init = function(callback)
        if callback == nil then callback = function() end end;
        local moduleLinks = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/"..
        (_G.EzHubDevMode and "dev" or "master").."/Modules/Modules.json"));

        local moduleIndex = 0;
        local moduleNumber = (function()
            local count = 0;
            for _,_ in pairs(moduleLinks) do
                count = count + 1;
            end
            return count;
        end)()
        
        _G["EzHubModules"] = {};
        for i, v in pairs(moduleLinks) do
            moduleIndex = moduleIndex + 1;
            callback(moduleIndex, moduleNumber, i);
            if _G.EzHubDevMode then v = v:gsub("/master/", "/dev/") end
            local moduleStringData = game:HttpGet(v);
            _G["EzHubModules"][i] = moduleStringData;
        end

        return moduleLinks;
    end
}
