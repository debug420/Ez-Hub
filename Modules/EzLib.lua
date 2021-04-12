---------------------------------------------------------------------

-- Essential Vars

local lib = {}
local navdebounce = true
local opentabdebounce = true

local colors = {
	Primary = Color3.fromRGB(41, 53, 68),
	Secondary = Color3.fromRGB(35, 47, 62),
	Tertiary = Color3.fromRGB(28, 41, 56),
	Quaternary = Color3.fromRGB(18, 98, 159)
}

local tabs = {};
local activeframe;
local draggingslider = {};
local togglekeybind = Enum.KeyCode.RightShift;

---------------------------------------------------------------------

-- Core functions

local function OpenTabLib(frame)
	-- Closing of unwanted tabs
	if activeframe == frame then return; end
	activeframe:TweenPosition(activeframe.Position + UDim2.new(2,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.3, true)
	wait(0.3)
	activeframe.Position = UDim2.new(0.5,0,2,0)

	-- Opening of desired tab
	frame.Position = UDim2.new(0.5,0,2,0)
	frame:TweenPosition(UDim2.new(0.5,0,0.5,17), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.3, true)
end

local function IsUsingSliderLib()
	for i,v in pairs(draggingslider) do
		if v then
			return v;
		end
	end
	return false;
end

local function DragifyLib(MainFrame)

	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		if IsUsingSliderLib() then return; end
		Delta = input.Position - dragStart
		Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(.25), {Position = Position}):Play()
	end

	MainFrame.InputBegan:Connect(function(input)
		if IsUsingSliderLib() then return; end
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = MainFrame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	MainFrame.InputChanged:Connect(function(input)
		if IsUsingSliderLib() then return; end
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

local function addInstance(instance, properties)
	if instance and type(properties) == "table" then
		local ins = Instance.new(tostring(instance))
		for i,v in pairs(properties or {}) do
			ins[i] = v
		end
		return ins;
	else
		error("Invalid input for addInstance function.")
	end
end

local function handlenavLib(frame, nav, close)
	if navdebounce then
		navdebounce = false

		spawn(function()
			if frame.Position ~= UDim2.new(-0.5, 0, 0.108, 0) then
				frame:TweenPosition(UDim2.new(-0.5, 0, 0.108, 0),Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)	-- Hide
				if not activeframe then return; end
				activeframe:TweenPosition(activeframe.Position - UDim2.new(0.32,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
			else
				frame:TweenPosition(UDim2.new(0, 0,0.108, 0),Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)		-- Show
				if not activeframe then return; end
				activeframe:TweenPosition(activeframe.Position + UDim2.new(0.32,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
			end
		end)

		if nav.Visible then

			for i = 1, 10 do
				game:GetService("RunService").RenderStepped:Wait()
				nav.Rotation = nav.Rotation - 20
			end
			nav.Visible = false
			close.Rotation = nav.Rotation
			close.Visible = true
			for i = 1, 8 do
				game:GetService("RunService").RenderStepped:Wait()
				close.Rotation = close.Rotation - 20
			end

		else

			for i = 1, 8 do
				game:GetService("RunService").RenderStepped:Wait()
				close.Rotation = close.Rotation + 20
			end
			nav.Visible = true
			nav.Rotation = close.Rotation
			close.Visible = false
			for i = 1,10 do
				game:GetService("RunService").RenderStepped:Wait()
				nav.Rotation = nav.Rotation + 20
			end

		end

		navdebounce = true
	end
end

local function ApplyFrameResizingLib(scrollingframe)
	local calc = scrollingframe:FindFirstChild("UIGridLayout") or scrollingframe:FindFirstChild("UIListLayout") or nil;
	local function update()
		pcall(function()
			local cS = calc.AbsoluteContentSize
			scrollingframe.CanvasSize = UDim2.new(0,scrollingframe.Size.X,0,cS.Y + 30)
		end)
	end
	calc.Changed:Connect(update)
	update()
end

local function roundify(element, radius)
	assert(element, "nigga u forgot element in roundify")
	addInstance("UICorner", {
		CornerRadius = radius or UDim.new(0,4),
		Parent = element
	})
end

---------------------------------------------------------------------

-- Starter Lib Functions

function lib:NewLib(Name, pos)
	pos = pos or UDim2.new(0.5, 0, 0.5, 0)
	Name = tostring(Name) or "Ez Hub"
	local parent = addInstance("ScreenGui", {
		["Parent"] = game.CoreGui,
		["Name"] = "EzExc"
	});

	game:GetService("UserInputService").InputBegan:Connect(function(input)
		if input.KeyCode == togglekeybind then
			parent.Enabled = not parent.Enabled
		end
	end)

	local window = addInstance("Frame", {
		["Position"] = pos,
		["Name"] = "MainFrame",
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Size"] = UDim2.new(0, 300, 0, 230),
		["ClipsDescendants"] = true,
		["BorderSizePixel"] = 0,
		["BackgroundColor3"] = colors.Primary,
		["Parent"] = parent
	});
	DragifyLib(window)
	roundify(window)
	local topframe = addInstance("Frame", {
		["Name"] = "TopFrame",
		["BackgroundColor3"] = colors.Tertiary,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(0, 300, 0, 34),
		["ZIndex"] = 3,
		["Parent"] = window
	});
	roundify(topframe)
	addInstance("Frame", {
		Size = UDim2.new(1, 0, 0, 4),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = colors.Tertiary,
		ZIndex = 4,
		BorderSizePixel = 0,
		Parent = topframe
	})
	addInstance("TextLabel", {
		["Name"] = "UIName",
		["BackgroundTransparency"] = 1,
		["TextColor3"] = Color3.fromRGB(255,255,255),
		["AnchorPoint"] = Vector2.new(1,0.5),
		["Position"] = UDim2.new(1,-10,0.5,0),
		["Text"] = Name,
		["Size"] = UDim2.new(0, 200, 0, 30),
		["TextWrapped"] = true,
		["ZIndex"] = 3,
		["TextXAlignment"] = Enum.TextXAlignment.Right,
		["Parent"] = topframe
	});
	local closenav = addInstance("ImageButton", {
		["Name"] = "CloseNavButton",
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
		["BackgroundTransparency"] = 1.000,
		["BorderSizePixel"] = 0,
		["Position"] = UDim2.new(0.05, 0, 0.51, 0),
		["Size"] = UDim2.new(0, 20, 0, 20),
		["Visible"] = false,
		["ZIndex"] = 4,
		["Image"] = "http://www.roblox.com/asset/?id=5969992570",
		["Parent"] = topframe
	});
	local opennav = addInstance("ImageButton", {
		["Name"] = "NavButton",
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
		["BackgroundTransparency"] = 1.000,
		["BorderSizePixel"] = 0,
		["Position"] = UDim2.new(0.05, 0, 0.51, 0),
		["Size"] = UDim2.new(0, 28, 0, 28),
		["ZIndex"] = 4,
		["Image"] = "http://www.roblox.com/asset/?id=5942241281",
		["Parent"] = topframe
	});    
	local navframe = addInstance("ScrollingFrame", {
		["Name"] = "NavFrame",
		["Active"] = true,
		["BackgroundColor3"] = colors.Tertiary,
		["BorderSizePixel"] = 0,
		["Position"] = UDim2.new(-0.5, 0, 0.108000003, 0),
		["Size"] = UDim2.new(0, 100, 0, 281),
		["ZIndex"] = 2,
		["CanvasSize"] = UDim2.new(0, 0, 0, 0),
		["Parent"] = window
	});
	addInstance("UIGridLayout", {
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["CellPadding"] = UDim2.new(0, 5, 0, 7),
		["CellSize"] = UDim2.new(0, 75, 0, 25),
		["Parent"] = navframe
	});
	addInstance("UIPadding", {
		["PaddingBottom"] = UDim.new(0, 15),
		["PaddingTop"] = UDim.new(0, 20),
		["Parent"] = navframe
	});

	opennav.MouseButton1Click:Connect(function() handlenavLib(navframe, opennav, closenav) end)
	closenav.MouseButton1Click:Connect(function() handlenavLib(navframe, opennav, closenav) end)

	return parent;
end

function lib:CreateNotice(Title, desc, callback)

	local Notice = addInstance("ScreenGui", {
		Name = "Notice",
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Parent = game.CoreGui
	})

	local Frame = addInstance("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = colors.Primary,
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 327, 0, 204),
		Parent = Notice
	})

	local TopFrame = addInstance("Frame", {
		Name = "TopFrame",
		BackgroundColor3 = colors.Tertiary,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 35),
		Parent = Frame
	})

	local TextLabel = addInstance("TextLabel", {
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 15, 0, 0),
		Size = UDim2.new(0.800000012, 0, 1, 0),
		Font = Enum.Font.SourceSans,
		Text = Title or "Notice",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 19.000,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = TopFrame
	})

	local TextLabel_2 = addInstance("TextLabel", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0.5, 0, 0.5, 5),
		Size = UDim2.new(1, -30, 1, -120),
		Font = Enum.Font.SourceSans,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 16.000,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextWrapped = true,
		Text = desc or "Bruh you forgot to put desc",
		Parent = Frame
	})

	local TextButton = addInstance("TextButton", {
		BackgroundColor3 = colors.Tertiary,
		Position = UDim2.new(0.516819537, 0, 0.799019575, 0),
		Size = UDim2.new(0, 143, 0, 31),
		Font = Enum.Font.SourceSans,
		Text = "Yes",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 16.000,
		Parent = Frame
	})

	local TextButton_2 = addInstance("TextButton", {
		BackgroundColor3 = colors.Tertiary,
		Position = UDim2.new(0.0458715595, 0, 0.799019575, 0),
		Size = UDim2.new(0, 143, 0, 31),
		Font = Enum.Font.SourceSans,
		Text = "No",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 16.000,
		Parent = Frame
	})

	local clicked = false
	TextButton.MouseButton1Click:Connect(function()
		clicked = true
		Notice:Destroy()
		callback(TextButton.Text)
	end)
	TextButton_2.MouseButton1Click:Connect(function()
		clicked = true
		Notice:Destroy()
		callback(TextButton_2.Text)
	end)

	repeat wait() until clicked
end

function lib:NewSection(libins, value)
	if libins:IsA("ScreenGui") and libins:FindFirstChild("MainFrame") and libins.MainFrame.TopFrame then
		local button = addInstance("TextButton", {
			["Text"] = tostring(value),
			["Name"] = tostring(value),
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = colors.Primary,
			["TextColor3"] = Color3.fromRGB(255,255,255),
			["ZIndex"] = 3,
			["Parent"] = libins.MainFrame.NavFrame
		});
		local blueline = addInstance("Frame", {
			BackgroundColor3 = colors.Quaternary,
			Size = UDim2.new(0, 2, 1, 0),
			ZIndex = 4,
			Parent = button
		});
		addInstance("UICorner", {
			CornerRadius = UDim.new(0, 8),
			Parent = blueline
		})
		local window = addInstance("ScrollingFrame", {
			["Name"] = tostring(value),
			["BorderSizePixel"] = 0,
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = Vector2.new(0.5,0.5),
			["Position"] = UDim2.new(0.5,0,2,0),
			["Size"] = UDim2.new(1, 0, 1, -34),
			["ScrollBarImageColor3"] = Color3.fromRGB(93, 93, 93),
			["Parent"] = libins.MainFrame
		});
		addInstance("UIListLayout", {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, 7),
			["Parent"] = window
		});
		addInstance("UIPadding", {
			["PaddingBottom"] = UDim.new(0, 15),
			["PaddingTop"] = UDim.new(0, 10),
			["Parent"] = window
		});
		table.insert(tabs, 1, window)
		button.MouseButton1Click:Connect(function()
			if not opentabdebounce then return end
			opentabdebounce = false
			OpenTabLib(window);
			handlenavLib(libins.MainFrame.NavFrame, libins.MainFrame.TopFrame.NavButton, libins.MainFrame.TopFrame.CloseNavButton)
			activeframe = window;
			opentabdebounce = true
		end)
		ApplyFrameResizingLib(window)
		return window;
	else error("Invalid arg supplied to NewSection.") end
end

function lib:SetActive(section)
	section.Position = UDim2.new(0.5,0,0.5,17)
	activeframe = section;
end

function lib:SetToggleKeybind(keybind)
	togglekeybind = keybind
end

---------------------------------------------------------------------

-- Asset Functions

function lib:NewButton(section, value, func)

	local button = addInstance("TextButton", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = colors.Secondary,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 250, 0, 35),
		Font = Enum.Font.SourceSans,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14.000,
		Text = value,
		Parent = section
	});

	roundify(button)

	button.MouseButton1Click:Connect(function()
		spawn(function()
			pcall(function() func() end)
		end)
	end)

	return button;

end

function lib:NewCheckBox(section, value, status, func)

	local frame = addInstance("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = colors.Secondary,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 250, 0, 35),
		Parent = section
	});

	roundify(frame)

	addInstance("TextLabel", {
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 15, 0, 0),
		Size = UDim2.new(0, 153, 0, 35),
		Font = Enum.Font.SourceSans,
		Text = value,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14.000,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = frame
	});

	local toggle = addInstance("TextButton", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(149, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.930000007, 0, 0.5, 0),
		Size = UDim2.new(0, 20, 0, 20),
		AutoButtonColor = false,
		Font = Enum.Font.SourceSans,
		Text = "",
		TextColor3 = Color3.fromRGB(255, 0, 0),
		TextSize = 14.000,
		Parent = frame
	});
	roundify(toggle)

	local state = status
	if state then
		toggle.BackgroundColor3 = Color3.fromRGB(0, 149, 74)
	end
	toggle.MouseButton1Click:Connect(function()
		state = not state;
		if state then
			game:GetService("TweenService"):Create(toggle, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(0, 149, 74)}):Play()
		else
			game:GetService("TweenService"):Create(toggle, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(149, 0, 0)}):Play()
		end
		spawn(function()
			pcall(function()
				func(state)
			end)
		end)
	end)

	return toggle;

end

function lib:NewTextBox(section, value, status, func)

	local frame = addInstance("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = colors.Secondary,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 250, 0, 35),
		Parent = section
	});

	roundify(frame)
	
	addInstance("TextLabel", {
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 15, 0, 0),
		Size = UDim2.new(0, 116, 0, 35),
		Font = Enum.Font.SourceSans,
		Text = value or "",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14.000,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = frame
	});
	
	local textbox = addInstance("TextBox", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = colors.Primary,
		BorderSizePixel = 0,
		Position = UDim2.new(0.791999996, 0, 0.5, 0),
		Size = UDim2.new(0, 88, 0, 21),
		Font = Enum.Font.SourceSans,
		PlaceholderText = "Click to type...",
		Text = status or "",
		TextColor3 = Color3.fromRGB(255,255,255),
		TextSize = 13.000,
		Parent = frame
	});

	textbox:GetPropertyChangedSignal("Text"):Connect(function()
		spawn(function()
			pcall(function() func(textbox.Text) end)
		end)
	end)

	return textbox;

end

function lib:NewSlider(section, value, default, min, max, func)
	
	default = math.floor(math.clamp(default, min, max) or min + 0.5)

	local Frame = addInstance("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = colors.Secondary,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 250, 0, 62),
		Parent = section
	});
	roundify(Frame)
	local SliderFrame = addInstance("Frame", {
		BackgroundColor3 = colors.Primary,
		Position = UDim2.new(0.0599999987, 0, 0.677419364, 0),
		Size = UDim2.new(0, 223, 0, 4),
		Parent = Frame
	});
	local Indicator = addInstance("Frame", {
		Name = "Indicator",
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, 12, 0, 12),
		Parent = SliderFrame
	});
	local IndicatorTrail = addInstance("Frame", {
		Name = "Indicator",
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, 0, 1, 0),
		BorderSizePixel = 0,
		Parent = SliderFrame
	});
	addInstance("TextLabel", {
		Name = "Value",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 15, 0, 0),
		Size = UDim2.new(0, 153, 0, 35),
		Font = Enum.Font.SourceSans,
		Text = value,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14.000,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = Frame
	});
	local ValueDisplay = addInstance("TextLabel", {
		Name = "ValueDisplayer",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 190, 0, 0),
		Size = UDim2.new(0, 48, 0, 35),
		Font = Enum.Font.SourceSans,
		Text = 0,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14.000,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Right,
		Parent = Frame
	});
	addInstance("UICorner", {
		CornerRadius = UDim.new(0,8),
		Parent = Indicator
	});
	addInstance("UICorner", {
		CornerRadius = UDim.new(0,8),
		Parent = IndicatorTrail
	});
	addInstance("UICorner", {
		CornerRadius = UDim.new(0,8),
		Parent = SliderFrame
	});

	ValueDisplay.Text = default
	Indicator.Position = UDim2.new((default - min)/(max - min), 0, 0.5, 0)
	IndicatorTrail.Size = UDim2.new((default - min)/(max - min), 0, 0.5, 0)

	local function slide(input, ind, trail)
		local pos = UDim2.new(math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1), 0, 0.5, 0)
		ind:TweenPosition(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
		trail:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
		local s = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
		spawn(function()
			pcall(function()
				ValueDisplay.Text = tostring(s)
				func(s)
			end)
		end)
	end

	Indicator.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			slide(input, Indicator, IndicatorTrail)
			draggingslider[Indicator] = true
		end
	end)

	Indicator.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			draggingslider[Indicator] = false
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if draggingslider[Indicator] and input.UserInputType == Enum.UserInputType.MouseMovement then
			slide(input, Indicator, IndicatorTrail)		
		end
	end)

end

function lib:NewKeyBind(section, value, status, func)
	local awaitinginput = false

	local frame = addInstance("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = colors.Secondary,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 250, 0, 35),
		Parent = section
	});

	addInstance("TextLabel", {
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 15, 0, 0),
		Size = UDim2.new(0, 153, 0, 35),
		Font = Enum.Font.SourceSans,
		Text = value,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14.000,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = frame
	});

	local button = addInstance("TextButton", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = colors.Primary,
		BorderSizePixel = 0,
		Position = UDim2.new(0.792500019, 0, 0.5, 0),
		Size = UDim2.new(0, 87, 0, 20),
		AutoButtonColor = false,
		Font = Enum.Font.SourceSans,
		Text = status.Name,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14.000,
		Parent = frame
	});

	button.MouseButton1Click:Connect(function()
		awaitinginput = true
		button.Text = "..."
	end)

	game:GetService("UserInputService").InputBegan:Connect(function(input)
		if awaitinginput then
			button.Text = input.KeyCode.Name
			spawn(function()
				pcall(function()
					func(input)
				end)
			end)
			awaitinginput = false
		end
	end)
end

function lib:NewDiv(section)
	local spacebox = addInstance("Frame", {
		Name = "SpaceBox",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 0, 0.10204082, 0),
		Size = UDim2.new(1, 0, 0, 25),
		Parent = section
	});
	local div = addInstance("TextLabel", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = colors.Tertiary,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 260, 0, 5),
		Font = Enum.Font.SourceSans,
		Text = "",
		TextColor3 = Color3.fromRGB(0, 0, 0),
		TextSize = 14.000,
		Parent = spacebox
	});
	addInstance("UICorner", {
		CornerRadius = UDim.new(0,15),
		Parent = div
	});
end

function lib:NewDesc(section, value)
	local spacebox = addInstance("Frame", {
		Name = "SpaceBox",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 0, 0.10204082, 0),
		Size = UDim2.new(1, 0, 0, 35),
		Parent = section
	});
	addInstance("TextLabel", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0.5, 5, 0.5, 0),
		Size = UDim2.new(0, 249, 0, 31),
		Font = Enum.Font.SourceSans,
		Text = value or "Description",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14.000,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = spacebox
	});
end

function lib:NewTitle(section, value)
	local spacebox = addInstance("Frame", {
		Name = "SpaceBox",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0, 0, 0.10204082, 0),
		Size = UDim2.new(1, 0, 0, 23),
		Parent = section
	});
	addInstance("TextLabel", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		Position = UDim2.new(0.5, 5, 0.5, 0),
		Size = UDim2.new(0, 249, 1, 0),
		Font = Enum.Font.SourceSans,
		Text = value or "Title",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 18.000,  
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = spacebox
	});
end

function lib:NewNotif(TitleC, DescC, DelayS)

	if game.CoreGui:FindFirstChild("EzNotif") then
		game.CoreGui:FindFirstChild("EzNotif").MainFrame:TweenSize(UDim2.new(0, 0, 0, 117), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
		game.CoreGui:FindFirstChild("EzNotif").MainFrame.ContentFrame.DescLabel.Text = ""
		game.CoreGui:FindFirstChild("EzNotif").MainFrame.TopFrame.TitleLabel.Text = ""
		wait(0.5)
		game.CoreGui:FindFirstChild("EzNotif"):Destroy()
	end
	
	local ScreenGui = {
		ScreenGui = Instance.new("ScreenGui"),
		MainFrame = Instance.new("Frame"),
		TopFrame = Instance.new("Frame"),
		TitleLabel = Instance.new("TextLabel"),
		ContentFrame = Instance.new("Frame"),
		DescLabel = Instance.new("TextLabel"),
	}

	ScreenGui.ScreenGui.Parent = game.CoreGui
	ScreenGui.ScreenGui.Name = "EzNotif"
	ScreenGui.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	ScreenGui.MainFrame.Name = "MainFrame"
	ScreenGui.MainFrame.Parent = ScreenGui.ScreenGui
	ScreenGui.MainFrame.AnchorPoint = Vector2.new(0, 0.5)
	ScreenGui.MainFrame.BackgroundColor3 = colors.Primary
	ScreenGui.MainFrame.BorderSizePixel = 0
	ScreenGui.MainFrame.Position = UDim2.new(0, 20, 1, -80)
	ScreenGui.MainFrame.Size = UDim2.new(0, 0, 0, 117)

	ScreenGui.TopFrame.Name = "TopFrame"
	ScreenGui.TopFrame.Parent = ScreenGui.MainFrame
	ScreenGui.TopFrame.BackgroundColor3 = Color3.fromRGB(28, 41, 56)
	ScreenGui.TopFrame.BorderSizePixel = 0
	ScreenGui.TopFrame.Size = UDim2.new(1, 0, 0, 35)

	ScreenGui.TitleLabel.Name = "TitleLabel"
	ScreenGui.TitleLabel.Parent = ScreenGui.TopFrame
	ScreenGui.TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScreenGui.TitleLabel.BackgroundTransparency = 1.000
	ScreenGui.TitleLabel.Size = UDim2.new(1, 0, 1, 0)
	ScreenGui.TitleLabel.Font = Enum.Font.SourceSans
	ScreenGui.TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	ScreenGui.TitleLabel.TextSize = 14.000
	ScreenGui.TitleLabel.TextWrapped = true

	ScreenGui.ContentFrame.Name = "ContentFrame"
	ScreenGui.ContentFrame.Parent = ScreenGui.MainFrame
	ScreenGui.ContentFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScreenGui.ContentFrame.BackgroundTransparency = 1.000
	ScreenGui.ContentFrame.Position = UDim2.new(0, 0, 0.299145311, 0)
	ScreenGui.ContentFrame.Size = UDim2.new(1, 0, 0.854700863, -18)

	ScreenGui.DescLabel.Name = "DescLabel"
	ScreenGui.DescLabel.Parent = ScreenGui.ContentFrame
	ScreenGui.DescLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScreenGui.DescLabel.BackgroundTransparency = 1.000
	ScreenGui.DescLabel.Size = UDim2.new(1, -10, 1, 0)
	ScreenGui.DescLabel.Font = Enum.Font.SourceSans
	ScreenGui.DescLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	ScreenGui.DescLabel.TextSize = 14.000
	ScreenGui.DescLabel.TextWrapped = true
	
	ScreenGui.DescLabel.Text = ""
	ScreenGui.TitleLabel.Text = ""
	
	spawn(function()
		wait(0.2)
		ScreenGui.MainFrame:TweenSize(UDim2.new(0, 193, 0, 117), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
		wait(0.3)
		ScreenGui.DescLabel.Text = DescC
		ScreenGui.TitleLabel.Text = TitleC or "Ez Hub"
		wait((DelayS or  5) + 0.2)
		ScreenGui.MainFrame:TweenSize(UDim2.new(0, 0, 0, 117), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
		ScreenGui.DescLabel.Text = ""
		ScreenGui.TitleLabel.Text = ""
		wait(0.5)
		ScreenGui.ScreenGui:Destroy()
	end)

end

---------------------------------------------------------------------

-- Return

return lib;
