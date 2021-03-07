
Camera = game:GetService("Workspace").CurrentCamera
RunService = game:GetService("RunService")
camera = workspace.CurrentCamera
Bottom = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)

function GetPoint(vector3)
    vector, onScreen = camera:WorldToScreenPoint(vector3)
    return {Vector2.new(vector.X,vector.Y),onScreen,vector.Z}
end

function MakeESP(model)
    local CurrentParent = model.Parent

    local Box = Drawing.new("Square")
    local Tracer = Drawing.new("Line")
    local Display = Drawing.new("Text")
    spawn(function()
        while model.Parent == CurrentParent do
            
            local Distance = (Camera.CFrame.Position - model.HumanoidRootPart.Position).Magnitude
            local GetP = GetPoint(model.Head.Position)
            if _G.playerespsettings.ESPEnabled and GetP[2] then
                Box.Color = game:GetService("Players")[model.Name].TeamColor.Color or Color3.fromRGB(0,0,0)
                Box.Thickness = 2
                Box.Size = Vector2.new(25,50)
                Box.Filled = false
                Box.Position = GetP[1] - Vector2.new(15,-30)
                Box.Visible = true
            else
                Box.Visible = false
            end
            if _G.playerespsettings.ESPEnabled and _G.playerespsettings.TracersEnabled and GetP[2] then
                Tracer.Color = game:GetService("Players")[model.Name].TeamColor.Color or Color3.fromRGB(0,0,0)
                Tracer.From = Bottom
                Tracer.To = GetP[1] + Vector2.new(0,50)
                Tracer.Thickness = 1.5
                Tracer.Visible = true
            else
                Tracer.Visible = false
            end
            if _G.playerespsettings.ESPEnabled and _G.playerespsettings.DistanceEnabled and GetP[2] then
                Display.Visible = true
                Display.Position = GetP[1] + Vector2.new(0,-15)
                Display.Center = true
                Display.Text = tostring(math.floor(Distance)).." studs"
            else
                Display.Visible = false
            end
            RunService.RenderStepped:Wait()
        end

        Box:Remove()
        Tracer:Remove()
        Display:Remove()

    end)
end

for _, Player in next, game:GetService("Players"):GetPlayers() do
    if Player.Name ~= game.Players.LocalPlayer.Name then
        MakeESP(Player.Character)
        Player.CharacterAdded:Connect(function()
            delay(0.5, function()
                MakeESP(Player.Character)
            end)
        end)
    end	
end

game:GetService("Players").PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        delay(0.5, function()
            MakeESP(player.Character)
        end)
    end)
end)
