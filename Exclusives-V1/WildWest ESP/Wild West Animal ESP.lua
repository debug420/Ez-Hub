Camera = game:GetService("Workspace").CurrentCamera
RunService = game:GetService("RunService")
camera = workspace.CurrentCamera
Bottom = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)

function GetPoint(vector3)
    local vector, onScreen = camera:WorldToScreenPoint(vector3)
    return {Vector2.new(vector.X,vector.Y),onScreen,vector.Z}
end

function MakeESP(model, animalcolor)
    local CurrentParent = model.Parent

    local Box = Drawing.new("Square")
    local Tracer = Drawing.new("Line")
    local Display = Drawing.new("Text")
    spawn(function()
        while model.Parent == CurrentParent do

            local Distance = (Camera.CFrame.Position - model.PrimaryPart.Position).Magnitude
            local GetP = GetPoint(model.PrimaryPart.Position)
            if _G.animalespsettings.ESPEnabled and GetP[2] then
                Box.Color = animalcolor
                Box.Thickness = 2
                Box.Size = Vector2.new(25,50)
                Box.Filled = false
                Box.Position = GetP[1] - Vector2.new(15,-30)
                Box.Visible = true
            else
                Box.Visible = false
            end
            if _G.animalespsettings.ESPEnabled and _G.animalespsettings.TracersEnabled and GetP[2] then
                Tracer.Color = animalcolor
                Tracer.From = Bottom
                Tracer.To = GetP[1] + Vector2.new(0,50)
                Tracer.Thickness = 1.5
                Tracer.Visible = true
            else
                Tracer.Visible = false
            end
            if _G.animalespsettings.ESPEnabled and _G.animalespsettings.DistanceEnabled and GetP[2] then
                Display.OutlineColor = Color3.fromRGB(255,255,255)
                Display.Visible = true
                Display.Position = GetP[1] + Vector2.new(0,-15)
                Display.Center = true
                Display.Text = tostring(math.floor(Distance)).." studs \n"..model.Name
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

for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Animals:GetChildren()) do
    MakeESP(v, Color3.fromRGB(195, 132, 48))
end

game:GetService("Workspace")["WORKSPACE_Entities"].Animals.ChildAdded:Connect(function(item)
    MakeESP(item, Color3.fromRGB(195, 132, 48))
end)
