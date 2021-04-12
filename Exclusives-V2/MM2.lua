----------------------------------------------------------------------

-- MM2 Script

local ezlib;
if _G.CachedEzLib then
	ezlib = loadstring(_G.CachedEzLib)()
else
	ezlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/master/Modules/EzLib.lua"))()
end

local DontLoad = false
if game.PlaceId ~= 142823291 then
    ezlib:CreateNotice("Failed GameID Check", "The following exclusive that has been executed is not designed for the following game. This could cause the script to misfunction and break. Proceed anyway?", function(response)
        if response ~= "Yes" then
            DontLoad = true
        end
    end)
end
if DontLoad then return end

local Main = ezlib:NewLib("MM2")

----------------------------------------------------------------------

-- Initialize Sections

local MainSection = ezlib:NewSection(Main, "Main")
local ESPSection = ezlib:NewSection(Main, "ESP")
local EmoteSection = ezlib:NewSection(Main, "Emotes")

----------------------------------------------------------------------

-- Main Section

ezlib:NewTitle(MainSection, "Main Cheats")
ezlib:NewDiv(MainSection)

local function FindMurder()
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Character:FindFirstChild("Knife") or v.Backpack:FindFirstChild("Knife") then
            return v;
        end
    end
    return nil;
end

local function FindSheriff()
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Character:FindFirstChild("Revolver") or v.Backpack:FindFirstChild("Revolver") then
            return v;
        end
        if v.Character:FindFirstChild("Gun") or v.Backpack:FindFirstChild("Gun") then
            return v;
        end
    end
    return nil;
end

ezlib:NewButton(MainSection, "Find Murderer", function()
    if FindMurder() then ezlib:NewNotif("Murderer:", FindMurder().Name.." is the murderer.") else
        ezlib:NewNotif("Murderer not found", "Unable to find murderer")
    end
end)

ezlib:NewButton(MainSection, "TP to Murderer", function()
    if FindMurder() then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = FindMurder().Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)
    else
        ezlib:NewNotif("Murderer not found", "Unable to find murderer")
    end
end)

ezlib:NewButton(MainSection, "Find Sheriff", function()
    if FindSheriff() then ezlib:NewNotif("Sheriff:", FindSheriff().Name.." is the Sheriff.") else
        ezlib:NewNotif("Sheriff not found", "Unable to find Sheriff")
    end
end)

ezlib:NewButton(MainSection, "TP to Sheriff", function()
    if FindSheriff() then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = FindSheriff().Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)
    else
        ezlib:NewNotif("Sheriff not found", "Unable to find Sheriff")
    end
end)

ezlib:NewDiv(MainSection)

ezlib:NewButton(MainSection, "Give Autofarm Info", function()
    ezlib:CreateNotice("MM2 Autofarm Info", "By enabling MM2 autofarm, you will walk to each coin as if you are playing. This method is completely undetectable and wont get you banned as you are \"playing\" the game. Click one of the buttons below to dismiss.", function() end)
end)

local autofarme = false

local function findmap()
    for i,v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("CoinContainer") then
            return v;
        end
    end
end

local function isInRound()
    return game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Waiting.Visible == false
end

local function closestcoin()
    if not isInRound() then return false end
    -- find map, and prepare vars
    local closest, map = nil, findmap()
    if not map then return false end

    -- make table of closest of coins in terms of distance
    local t = {}
    for i,v in pairs(findmap().CoinContainer:GetChildren()) do
        if v.Name ~= "CollectedCoin" then
            table.insert(t, 1, {v, game:GetService("Players").LocalPlayer:DistanceFromCharacter(v.Position)}) 
        end
    end

    -- Sort table for computation
    table.sort(t, function(a,b)
        return a[2] < b[2]
    end)

    -- compute closest coin that is accessible
    for _, v in pairs(t) do
        local pathfinding = game:GetService("PathfindingService")
        local path = pathfinding:CreatePath()
        path:ComputeAsync(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, v[1].Position)
        print(path.Status)
        if path.Status == Enum.PathStatus.Success then
            closest = path
            break;
        end
    end

    -- return
    return closest;
end

local Controls = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule")):GetControls()
local MoveOnEvent = Instance.new("BindableEvent")

coroutine.wrap(function()
    while wait() do
        pcall(function()
            if not isInRound() then
                MoveOnEvent:Fire()
            end
            if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                MoveOnEvent:Fire()
            end
        end)
    end
end)()

local function ConnectEvent()
    spawn(function()
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").MoveToFinished:Connect(function(reached)
            MoveOnEvent:Fire()
            warn("Fired movetoend")
        end)
    end)
end

ConnectEvent()

game.Players.LocalPlayer.CharacterAdded:Connect(ConnectEvent)

coroutine.resume(coroutine.create(function()
    while wait() do
        if autofarme then
            local s, e = pcall(function()
                -- Initialize and call nesseccary functions
                local returnval = closestcoin()
                if type(returnval) == "boolean" or returnval == nil then return end;

                -- Disable controls so moveto is not yielded
                Controls:Disable()

                -- Loop through computed path
                for i,v in pairs(returnval:GetWaypoints()) do
                    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.Humanoid.Health > 0 and isInRound() then
                        game.Players.LocalPlayer.Character.Humanoid:MoveTo(v.Position)
                        if v.Action == Enum.PathWaypointAction.Jump then
                            game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                        MoveOnEvent.Event:Wait()
                    else
                        return;
                    end
                end
            end)
            if not s then print(e) end
            -- Enable controlers
            Controls:Enable()
        end
    end
end))

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

ezlib:NewCheckBox(MainSection, "Autofarm", false, function(state)
    autofarme = state
    if state then ezlib:NewNotif(nil, "Initializing Autofarm...") else Controls:Enable() ezlib:NewNotif(nil, "Disabled Autofarm.") end
end)

----------------------------------------------------------------------

-- ESP Section

local espConfig = {
    -- Toggle
    Enabled = false,
    -- ESP Elements
    tracer = true,
    headdot = true,
    tag = true,
    -- ESP Behaviour
    locktocursor = false,
    renderrange = 2000,
    teamcheck = false,
    -- ESP Color
    rainbowcolor = false,
    rainbowspeed = 2,
    setcolor = {255, 255, 255},
    teamcolor = true,
    -- ESP offsets
    XOffset = 2.8,
    YOffsetAboveHead = 1.5,
    YOffsetBelowHead = 5.5,
    TagOffset = 8,
    -- Headdot Settings
    HeaddotFilled = false,
    HeaddotScale = 2.5
}

local DrawESP;
local espmem = {};
local conmem = {};
--pcall(function()

    local function GetVector3D(vector3)
        local vector, onScreen = workspace.CurrentCamera:WorldToViewportPoint(vector3)
        return {Vector2.new(vector.X, vector.Y), onScreen, vector.Z};
    end

    local rainbowcs;
    coroutine.wrap(function()
        while wait() do
            local i = 0
            repeat
                i = i + (0.001 * espConfig.rainbowspeed)
                rainbowcs = Color3.fromHSV(i,1,1) --creates a color using i
                wait()
            until i >= 1
        end
    end)()

    local function GetTeamColor(model)
        if game:GetService("Players")[model.Name].Backpack:FindFirstChild("Knife") or game:GetService("Players")[model.Name].Character:FindFirstChild("Knife") then
            return Color3.fromRGB(255,0,0) 
        end
        if game:GetService("Players")[model.Name].Backpack:FindFirstChild("Gun") or game:GetService("Players")[model.Name].Backpack:FindFirstChild("Revolver") or game:GetService("Players")[model.Name].Character:FindFirstChild("Revolver") or game:GetService("Players")[model.Name].Character:FindFirstChild("Gun") then
            return Color3.fromRGB(0,0,255)
        end
        return Color3.fromRGB(255, 255, 255)
    end
    
    local function GetESPColor(playerinstance)
        if not playerinstance then return Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255) end 
        if espConfig.rainbowcolor then
            return rainbowcs or Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255);
        elseif espConfig.teamcolor then
            return GetTeamColor(workspace[playerinstance.Name]) or Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255);
        elseif espConfig.setcolor then
            return Color3.fromRGB(espConfig.setcolor[1], espConfig.setcolor[2], espConfig.setcolor[3]) or Color3.fromRGB(255,255,255);
        end
    end

    local function GetTracerPoint()
        if espConfig.locktocursor then
            return Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y) + Vector2.new(0, 36);
        else
            return Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y);
        end
    end

    local function CheckTeam(player)
        if espConfig.teamcheck then
            return game:GetService("Players"):FindFirstChild(player.Name).Team ~= game:GetService("Players").LocalPlayer.Team
        else
            return true;
        end
    end

    DrawESP = function(player)
        if not player or not player:FindFirstChild("Humanoid") then return end
        if player:FindFirstChild("Humanoid") then

            local cachedparent = player.Parent

            -- Make ESP Drawings Mem container
            espmem[player] = {}

            -- Tracer
            espmem[player].Tracer = Drawing.new("Line")

            -- Box around Player Drawing
            espmem[player].Up = Drawing.new("Line")
            espmem[player].Down = Drawing.new("Line")
            espmem[player].Left = Drawing.new("Line")
            espmem[player].Right = Drawing.new("Line")

            -- Headdot
            espmem[player].Headdot = Drawing.new("Circle")

            -- Texttag
            espmem[player].Tag = Drawing.new("Text")   -- Name

            -- Start Updating ESP
            spawn(function()

                conmem[player] = game:GetService("RunService").RenderStepped:Connect(function()
                    
                    -- Initiate Variables
                    local point = GetVector3D(player.Head.Position)[1]
                        
                    -- Tracer
                    if GetVector3D(player.Head.Position)[2] and espConfig.Enabled and espConfig.tracer and espConfig.renderrange > GetVector3D(player.Head.Position)[3] and CheckTeam(player) and espmem[player].Tracer then
                        local tracer = espmem[player].Tracer
                        tracer.Thickness = 1
                        tracer.From = GetTracerPoint()
                        tracer.To = point
                        tracer.Color = GetESPColor(game:GetService("Players"):FindFirstChild(player.Name))
                        tracer.Visible = true
                    elseif espmem[player].Tracer then
                        espmem[player].Tracer.Visible = false
                    else
                        conmem[player]:Disconnect()
                    end

                    -- ESP Box
                    local headcframe = player.Head.CFrame

                    -- Calculate CFrame
                    local tl = headcframe * CFrame.new(-(espConfig.XOffset), espConfig.YOffsetAboveHead, 0)
                    local tr = headcframe * CFrame.new(espConfig.XOffset, espConfig.YOffsetAboveHead, 0)
                    local bl = headcframe * CFrame.new(-(espConfig.XOffset),-(espConfig.YOffsetBelowHead),0)
                    local br = headcframe * CFrame.new(espConfig.XOffset,-(espConfig.YOffsetBelowHead),0)
                
                    if GetVector3D(player.Head.Position)[2] and espConfig.Enabled and espConfig.renderrange > GetVector3D(player.Head.Position)[3] and CheckTeam(player) and espmem[player].Up and espmem[player].Down and espmem[player].Right and espmem[player].Left then

                        -- Top Line
                        espmem[player].Up.From = GetVector3D(tl.p)[1]
                        espmem[player].Up.To = GetVector3D(tr.p)[1]
                        espmem[player].Up.Thickness = 1
                        espmem[player].Up.Color = GetESPColor(game:GetService("Players"):FindFirstChild(player.Name))

                        -- Left Line
                        espmem[player].Left.From = GetVector3D(tl.p)[1]
                        espmem[player].Left.To = GetVector3D(bl.p)[1]
                        espmem[player].Left.Thickness = 1
                        espmem[player].Left.Color = GetESPColor(game:GetService("Players"):FindFirstChild(player.Name))

                        -- Right Line
                        espmem[player].Right.From = GetVector3D(tr.p)[1]
                        espmem[player].Right.To = GetVector3D(br.p)[1]
                        espmem[player].Right.Thickness = 1
                        espmem[player].Right.Color = GetESPColor(game:GetService("Players"):FindFirstChild(player.Name))

                        -- Bottom Line
                        espmem[player].Down.From = GetVector3D(bl.p)[1]
                        espmem[player].Down.To = GetVector3D(br.p)[1]
                        espmem[player].Down.Thickness = 1
                        espmem[player].Down.Color = GetESPColor(game:GetService("Players"):FindFirstChild(player.Name))

                        espmem[player].Down.Visible = true
                        espmem[player].Right.Visible = true
                        espmem[player].Left.Visible = true
                        espmem[player].Up.Visible = true
                        
                    elseif espmem[player].Up and espmem[player].Down and espmem[player].Right and espmem[player].Left then
                        espmem[player].Down.Visible = false
                        espmem[player].Right.Visible = false
                        espmem[player].Left.Visible = false
                        espmem[player].Up.Visible = false
                    else
                        conmem[player]:Disconnect()
                    end

                    -- Head Dot
                    if GetVector3D(player.Head.Position)[2] and espConfig.Enabled and espConfig.headdot and espConfig.renderrange > GetVector3D(player.Head.Position)[3] and CheckTeam(player) and espmem[player].Headdot then
                        espmem[player].Headdot.Position = point
                        espmem[player].Headdot.Filled = espConfig.HeaddotFilled
                        espmem[player].Headdot.Color = GetESPColor(game:GetService("Players"):FindFirstChild(player.Name))
                        espmem[player].Headdot.NumSides = 50
                        espmem[player].Headdot.Thickness = 1

                        -- Head dot radius
                        local Scale = player.Head.Size.Y / espConfig.HeaddotScale;
                        local Top = workspace.CurrentCamera:WorldToViewportPoint((headcframe * CFrame.new(0, Scale, 0)).Position);
                        local Bottom = workspace.CurrentCamera:WorldToViewportPoint((headcframe * CFrame.new(0, -Scale, 0)).Position);
                        espmem[player].Headdot.Radius = (Top - Bottom).y;

                        espmem[player].Headdot.Visible = true
                    elseif espmem[player].Headdot then
                        espmem[player].Headdot.Visible = false
                    else
                        conmem[player]:Disconnect()
                    end
                    
                    -- Tag
                
                    if GetVector3D(player.Head.Position)[2] and espConfig.Enabled and espConfig.tag and espConfig.renderrange > GetVector3D(player.Head.Position)[3] and CheckTeam(player) and espmem[player].Tag then

                        local ScreenPositionUpper = workspace.CurrentCamera:WorldToViewportPoint((player.HumanoidRootPart:GetRenderCFrame() * CFrame.new(0, player.Head.Size.Y + player.HumanoidRootPart.Size.Y + (espConfig.TagOffset - 200 / 25), 0)).Position);
                        if espmem[player].Tag.Font and Drawing and Drawing.Fonts then
                            espmem[player].Tag.Font = Drawing.Fonts.Monospace
                        end

                        espmem[player].Tag.Visible = true
                        espmem[player].Tag.Center = true
                        espmem[player].Tag.Color = GetESPColor(game:GetService("Players"):FindFirstChild(player.Name))
                        espmem[player].Tag.Outline = true
                        espmem[player].Tag.Position = Vector2.new(ScreenPositionUpper.X, ScreenPositionUpper.Y) - Vector2.new(0, espmem[player].Tag.TextBounds.Y);
                        espmem[player].Tag.Text = (player.Name or "Unknown").." | ["..math.floor(GetVector3D(player.Head.Position)[3]).."]";
                    elseif espmem[player].Tag then
                        espmem[player].Tag.Visible = false
                    else
                        conmem[player]:Disconnect()
                    end

                end)

                -- Wait until player character is dead/leaves ect
                repeat wait() until not game:GetService("Players"):FindFirstChild(player.Name) or not player or not player:FindFirstChild("Humanoid") or player.Parent ~= cachedparent or player.Humanoid.Health == 0 or not player:FindFirstChild("Head") or not espmem[player]
                pcall(function() conmem[player]:Disconnect() end)
                for _,v in pairs(espmem[player]) do
                    if v then pcall(function() v:Remove() end) end
                end
            end)
        end
    end
--end)

for _, Player in next, game:GetService("Players"):GetPlayers() do
    if Player.Name ~= game.Players.LocalPlayer.Name then
        DrawESP(Player.Character)
        Player.CharacterAdded:Connect(function()
            delay(0.5, function()
                DrawESP(Player.Character)
            end)
        end)
    end	
end

game:GetService("Players").PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        delay(0.5, function()
            DrawESP(player.Character)
        end)
    end)
end)

_G.change = function(p, v)
    espConfig[p] = v;
end

if _G.unload then _G.unload() end

_G.unload = function()
    DrawESP = function() return; end
    for i,v in pairs(conmem) do
        v:Disconnect()
    end
    for i,v in pairs(espmem) do
        if type(v) == "table" then
            for ii, vv in pairs(v) do
                if vv then pcall(function() vv:Remove() end) end
            end
        end
    end
end

ezlib:NewTitle(ESPSection, "ESP Engine V4")
ezlib:NewDiv(ESPSection)

ezlib:NewCheckBox(ESPSection, "Enabled", espConfig.Enabled, function(state)
    espConfig.Enabled = state
end)

ezlib:NewDiv(ESPSection)
ezlib:NewTitle(ESPSection, "ESP Elements")

ezlib:NewCheckBox(ESPSection, "Tracer", espConfig.tracer, function(state)
    espConfig.tracer = state
end)

ezlib:NewCheckBox(ESPSection, "Headdot", espConfig.headdot, function(state)
    espConfig.headdot = state
end)

ezlib:NewCheckBox(ESPSection, "Info Tag", espConfig.tag, function(state)
    espConfig.tag = state
end)

ezlib:NewDiv(ESPSection)
ezlib:NewTitle(ESPSection, "ESP Behaviour")

ezlib:NewCheckBox(ESPSection, "Lock to cursor", espConfig.locktocursor, function(state)
    espConfig.locktocursor = state
end)

ezlib:NewCheckBox(ESPSection, "Teamcheck", espConfig.teamcheck, function(state)
    espConfig.teamcheck = state
end)

ezlib:NewSlider(ESPSection, "Render Range", espConfig.renderrange, 100, 5000, function(val)
    espConfig.renderrange = val
end)

ezlib:NewDiv(ESPSection)
ezlib:NewTitle(ESPSection, "ESP Colors")

ezlib:NewCheckBox(ESPSection, "Rainbow", espConfig.rainbowcolor, function(state)
    espConfig.rainbowcolor = state
end)

ezlib:NewSlider(ESPSection, "Rainbow Speed", espConfig.rainbowspeed, 1, 5, function(val)
    espConfig.rainbowspeed = val
end)

ezlib:NewCheckBox(ESPSection, "Team Color", espConfig.teamcolor, function(state)
    espConfig.teamcolor = state
end)

ezlib:NewDiv(ESPSection)
ezlib:NewTitle(ESPSection, "ESP SetColor")
ezlib:NewSlider(ESPSection, "R", espConfig.setcolor[1], 0, 255, function(val)
    espConfig.setcolor[1] = val
end)
ezlib:NewSlider(ESPSection, "G", espConfig.setcolor[2], 0, 255, function(val)
    espConfig.setcolor[2] = val
end)
ezlib:NewSlider(ESPSection, "B", espConfig.setcolor[3], 0, 255, function(val)
    espConfig.setcolor[3] = val
end)

ezlib:NewDiv(ESPSection)
ezlib:NewTitle(ESPSection, "Headdot Settings")

ezlib:NewCheckBox(ESPSection, "Headdot Filled", espConfig.HeaddotFilled, function(state)
    espConfig.HeaddotFilled = state
end)

ezlib:NewSlider(ESPSection, "Headdot Scale", espConfig.HeaddotScale * 2, 1, 10, function(val)
    espConfig.HeaddotScale = val / 2
end)

----------------------------------------------------------------------

-- Emote Section

ezlib:NewTitle(EmoteSection, "Emotes")
ezlib:NewDiv(EmoteSection)

local function playemote(emote)
    game:GetService("ReplicatedStorage").PlayEmote:Fire(emote)
end

ezlib:NewButton(EmoteSection, "Zen", function()
    playemote("zen")
end)

ezlib:NewButton(EmoteSection, "Sit", function()
    playemote("sit")
end)

ezlib:NewButton(EmoteSection, "Zombie", function()
    playemote("zombie")
end)

ezlib:NewButton(EmoteSection, "Spray Paint", function()
    playemote("SprayPaint")
end)

ezlib:NewButton(EmoteSection, "Floss", function()
    playemote("floss")
end)

ezlib:NewButton(EmoteSection, "Dab", function()
    playemote("dab")
end)

ezlib:NewButton(EmoteSection, "Ninja", function()
    playemote("ninja")
end)

----------------------------------------------------------------------

-- Active

ezlib:SetActive(MainSection);
