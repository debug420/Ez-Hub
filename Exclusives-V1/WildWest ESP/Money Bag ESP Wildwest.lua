
Camera = game:GetService("Workspace").CurrentCamera
RunService = game:GetService("RunService")
camera = workspace.CurrentCamera
Bottom = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)

function GetPoint(vector3)
    local vector, onScreen = camera:WorldToScreenPoint(vector3)
    return {Vector2.new(vector.X,vector.Y),onScreen,vector.Z}
end

function MakeESP(model, moneycolor)
    local CurrentParent = model.Parent

    local Box = Drawing.new("Square")
    local Tracer = Drawing.new("Line")
    local Display = Drawing.new("Text")
    spawn(function()
        while model.Parent == CurrentParent do

            local Distance = (Camera.CFrame.Position - model.PrimaryPart.Position).Magnitude
            local GetP = GetPoint(model.PrimaryPart.Position)
            if _G.moneybadespsettings.ESPEnabled and GetP[2] then
                Box.Color = moneycolor
                Box.Thickness = 2
                Box.Size = Vector2.new(25,50)
                Box.Filled = false
                Box.Position = GetP[1] - Vector2.new(15,-30)
                Box.Visible = true
            else
                Box.Visible = false
            end
            if _G.moneybadespsettings.ESPEnabled and _G.moneybadespsettings.TracersEnabled and GetP[2] then
                Tracer.Color = moneycolor
                Tracer.From = Bottom
                Tracer.To = GetP[1] + Vector2.new(0,50)
                Tracer.Thickness = 1.5
                Tracer.Visible = true
            else
                Tracer.Visible = false
            end
            if _G.moneybadespsettings.ESPEnabled and _G.moneybadespsettings.DistanceEnabled and GetP[2] then
                Display.OutlineColor = moneycolor
                Display.Visible = true
                Display.Position = GetP[1] + Vector2.new(0,-15)
                Display.Center = true
                Display.Text = tostring(math.floor(Distance)).." studs \n Money Bag\n"..model.CashLeft.Value.." Cash"
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

for i,v in pairs(workspace.Ignore:GetChildren()) do
    if v.Name == "MoneyBag" and v.CashLeft then
        MakeESP(v, Color3.fromRGB(48, 216, 56))
    end
end

workspace.Ignore.ChildAdded:Connect(function(item)
    if item.Name == "MoneyBag" and item.CashLeft then
        MakeESP(item, Color3.fromRGB(48, 216, 56))
    end
end)
