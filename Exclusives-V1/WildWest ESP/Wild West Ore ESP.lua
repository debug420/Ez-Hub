
Camera = game:GetService("Workspace").CurrentCamera
RunService = game:GetService("RunService")
camera = workspace.CurrentCamera
Bottom = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)

function GetPoint(vector3)
    local vector, onScreen = camera:WorldToScreenPoint(vector3)
    return {Vector2.new(vector.X,vector.Y),onScreen,vector.Z}
end

function MakeESP(model, orecolor)
    local CurrentParent = model.Parent

    local Box = Drawing.new("Square")
    local Tracer = Drawing.new("Line")
    local Display = Drawing.new("Text")
    spawn(function()
        while model.Parent == CurrentParent do

            local Distance = (Camera.CFrame.Position - model.PrimaryPart.Position).Magnitude
            local GetP = GetPoint(model.PrimaryPart.Position)
            if _G.oreespsettings.ESPEnabled and GetP[2] then
                Box.Color = orecolor
                Box.Thickness = 2
                Box.Size = Vector2.new(25,50)
                Box.Filled = false
                Box.Position = GetP[1] - Vector2.new(15,-30)
                Box.Visible = true
            else
                Box.Visible = false
            end
            if _G.oreespsettings.ESPEnabled and _G.oreespsettings.TracersEnabled and GetP[2] then
                Tracer.Color = orecolor
                Tracer.From = Bottom
                Tracer.To = GetP[1] + Vector2.new(0,50)
                Tracer.Thickness = 1.5
                Tracer.Visible = true
            else
                Tracer.Visible = false
            end
            if _G.oreespsettings.ESPEnabled and _G.oreespsettings.DistanceEnabled and GetP[2] then
                Display.OutlineColor = orecolor
                Display.Visible = true
                Display.Position = GetP[1] + Vector2.new(0,-15)
                Display.Center = true
                Display.Text = tostring(math.floor(Distance)).." studs \n"..model.Parent.Name.."\n"..model.DepositInfo.OreRemaining.Value.." Ores"
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

for i,v in pairs(workspace.WORKSPACE_Interactables.Mining.OreDeposits.Coal:GetChildren()) do
    MakeESP(v, Color3.fromRGB(0,0,0))
end
for i,v in pairs(workspace.WORKSPACE_Interactables.Mining.OreDeposits.Copper:GetChildren()) do
    MakeESP(v, Color3.fromRGB(150, 102, 60))
end
for i,v in pairs(workspace.WORKSPACE_Interactables.Mining.OreDeposits.Zinc:GetChildren()) do
    MakeESP(v, Color3.fromRGB(173, 170, 166))
end
for i,v in pairs(workspace.WORKSPACE_Interactables.Mining.OreDeposits.Iron:GetChildren()) do
    MakeESP(v, Color3.fromRGB(92, 91, 90))
end
for i,v in pairs(workspace.WORKSPACE_Interactables.Mining.OreDeposits.Silver:GetChildren()) do
    MakeESP(v, Color3.fromRGB(173, 170, 166))
end
for i,v in pairs(workspace.WORKSPACE_Interactables.Mining.OreDeposits.Gold:GetChildren()) do
    MakeESP(v, Color3.fromRGB(235, 212, 45))
end
for i,v in pairs(workspace.WORKSPACE_Interactables.Mining.OreDeposits.Limestone:GetChildren()) do
    MakeESP(v, Color3.fromRGB(204, 175, 96))
end
