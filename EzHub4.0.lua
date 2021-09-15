-- When enabled, it will use the dev branch of Ez Hub.
-- This may cause an error if set to true as a dev branch may not always exist
-- Just don't mess with the variable below
_G.EzHubDevMode = true;

-- Instances:

local EzHub = {
	EzHub = Instance.new("ScreenGui"),
	MainFrame = Instance.new("Frame"),
	TopFrame = Instance.new("Frame"),
	CloseNavButton = Instance.new("ImageButton"),
	TextLabel = Instance.new("TextLabel"),
	NavButton = Instance.new("ImageButton"),
	UICorner = Instance.new("UICorner"),
	Frame = Instance.new("Frame"),
	NavFrame = Instance.new("ScrollingFrame"),
	UIGridLayout = Instance.new("UIGridLayout"),
	HomeBtn = Instance.new("TextButton"),
	UICorner_2 = Instance.new("UICorner"),
	Frame_2 = Instance.new("Frame"),
	UICorner_3 = Instance.new("UICorner"),
	UIPadding = Instance.new("UIPadding"),
	ExclusivesV2Btn = Instance.new("TextButton"),
	UICorner_4 = Instance.new("UICorner"),
	Frame_3 = Instance.new("Frame"),
	UICorner_5 = Instance.new("UICorner"),
	RepostedBtn = Instance.new("TextButton"),
	UICorner_6 = Instance.new("UICorner"),
	Frame_4 = Instance.new("Frame"),
	UICorner_7 = Instance.new("UICorner"),
	LocalLibBtn = Instance.new("TextButton"),
	UICorner_8 = Instance.new("UICorner"),
	Frame_5 = Instance.new("Frame"),
	UICorner_9 = Instance.new("UICorner"),
	ExclusivesBtn = Instance.new("TextButton"),
	UICorner_10 = Instance.new("UICorner"),
	Frame_6 = Instance.new("Frame"),
	UICorner_11 = Instance.new("UICorner"),
	CreditsBtn = Instance.new("TextButton"),
	UICorner_12 = Instance.new("UICorner"),
	Frame_7 = Instance.new("Frame"),
	UICorner_13 = Instance.new("UICorner"),
	ExclusivesFrame = Instance.new("Frame"),
	AnimFrame1 = Instance.new("ScrollingFrame"),
	UIGridLayout_2 = Instance.new("UIGridLayout"),
	UIPadding_2 = Instance.new("UIPadding"),
	SearchFrame = Instance.new("Frame"),
	ImageButton = Instance.new("ImageButton"),
	SearchBar = Instance.new("TextBox"),
	UICorner_14 = Instance.new("UICorner"),
	LoadingFrame = Instance.new("Frame"),
	TextLabel_2 = Instance.new("TextLabel"),
	TextLabel_3 = Instance.new("TextLabel"),
	LoadingFrameBar = Instance.new("Frame"),
	LoadingBar = Instance.new("TextLabel"),
	LoadingBar_Roundify_12px = Instance.new("ImageLabel"),
	LoadingInfo = Instance.new("TextLabel"),
	CreditsFrame = Instance.new("Frame"),
	AnimFrame1_2 = Instance.new("Frame"),
	TextLabel_4 = Instance.new("TextLabel"),
	TextLabel_5 = Instance.new("TextLabel"),
	TextLabel_6 = Instance.new("TextLabel"),
	ImageLabel = Instance.new("ImageLabel"),
	ImageLabel_2 = Instance.new("ImageLabel"),
	TextLabel_7 = Instance.new("TextLabel"),
	RepostedFrame = Instance.new("Frame"),
	AnimFrame1_3 = Instance.new("ScrollingFrame"),
	UIGridLayout_3 = Instance.new("UIGridLayout"),
	UIPadding_3 = Instance.new("UIPadding"),
	SearchFrame_2 = Instance.new("Frame"),
	ImageButton_2 = Instance.new("ImageButton"),
	SearchBar_2 = Instance.new("TextBox"),
	UICorner_15 = Instance.new("UICorner"),
	HomeFrame = Instance.new("Frame"),
	AnimFrame1_4 = Instance.new("Frame"),
	ProfileFrame = Instance.new("ImageLabel"),
	ImageLabel_3 = Instance.new("ImageLabel"),
	ImageLabel_4 = Instance.new("ImageLabel"),
	TextLabel_8 = Instance.new("TextLabel"),
	SponsorFrame = Instance.new("ImageLabel"),
	SponsorText = Instance.new("TextLabel"),
	SectionEs = Instance.new("Folder"),
	Frame_8 = Instance.new("Frame"),
	UICorner_16 = Instance.new("UICorner"),
	Frame_9 = Instance.new("Frame"),
	TextLabel_9 = Instance.new("TextLabel"),
	OtherFrame = Instance.new("ImageLabel"),
	Donate = Instance.new("TextButton"),
	UICorner_17 = Instance.new("UICorner"),
	Discord = Instance.new("TextButton"),
	UICorner_18 = Instance.new("UICorner"),
	SectionEs_2 = Instance.new("Folder"),
	Frame_10 = Instance.new("Frame"),
	UICorner_19 = Instance.new("UICorner"),
	Frame_11 = Instance.new("Frame"),
	TextLabel_10 = Instance.new("TextLabel"),
	LocalLibFrame = Instance.new("Frame"),
	AnimFrame1_5 = Instance.new("ScrollingFrame"),
	UIGridLayout_4 = Instance.new("UIGridLayout"),
	UIPadding_4 = Instance.new("UIPadding"),
	ADD = Instance.new("Frame"),
	Frame_12 = Instance.new("ImageLabel"),
	GameName = Instance.new("TextLabel"),
	ImageLabel_5 = Instance.new("ImageLabel"),
	Trigger = Instance.new("TextButton"),
	REMOVE = Instance.new("Frame"),
	Frame_13 = Instance.new("ImageLabel"),
	GameName_2 = Instance.new("TextLabel"),
	ImageLabel_6 = Instance.new("ImageLabel"),
	Trigger_2 = Instance.new("TextButton"),
	SearchFrame_3 = Instance.new("Frame"),
	ImageButton_3 = Instance.new("ImageButton"),
	SearchBar_3 = Instance.new("TextBox"),
	UICorner_20 = Instance.new("UICorner"),
	ExclusivesV2Frame = Instance.new("Frame"),
	SearchFrame_4 = Instance.new("Frame"),
	ImageButton_4 = Instance.new("ImageButton"),
	SearchBar_4 = Instance.new("TextBox"),
	UICorner_21 = Instance.new("UICorner"),
	AnimFrame1_6 = Instance.new("ScrollingFrame"),
	UIGridLayout_5 = Instance.new("UIGridLayout"),
	UIPadding_5 = Instance.new("UIPadding"),
	ADDFrame = Instance.new("Frame"),
	AnimFrame1_7 = Instance.new("Frame"),
	Namer = Instance.new("Frame"),
	ScriptNamer = Instance.new("TextBox"),
	Frame_14 = Instance.new("Frame"),
	UICorner_22 = Instance.new("UICorner"),
	BackButton = Instance.new("TextButton"),
	UICorner_23 = Instance.new("UICorner"),
	Frame_15 = Instance.new("Frame"),
	UICorner_24 = Instance.new("UICorner"),
	CreateButton = Instance.new("TextButton"),
	UICorner_25 = Instance.new("UICorner"),
	Frame_16 = Instance.new("Frame"),
	UICorner_26 = Instance.new("UICorner"),
	TestExecButton = Instance.new("TextButton"),
	UICorner_27 = Instance.new("UICorner"),
	Frame_17 = Instance.new("Frame"),
	UICorner_28 = Instance.new("UICorner"),
	Editor = Instance.new("ScrollingFrame"),
	EditorFrame = Instance.new("ScrollingFrame"),
	Source = Instance.new("TextBox"),
	Comments_ = Instance.new("TextLabel"),
	Globals_ = Instance.new("TextLabel"),
	Keywords_ = Instance.new("TextLabel"),
	RemoteHighlight_ = Instance.new("TextLabel"),
	Strings_ = Instance.new("TextLabel"),
	Tokens_ = Instance.new("TextLabel"),
	Numbers_ = Instance.new("TextLabel"),
	Lines = Instance.new("TextLabel"),
	Frame_18 = Instance.new("Frame"),
	UICorner_29 = Instance.new("UICorner"),
	REMOVEFrame = Instance.new("Frame"),
	AnimFrame1_8 = Instance.new("Frame"),
	Frame_19 = Instance.new("Frame"),
	RemoveButton = Instance.new("TextButton"),
	UICorner_30 = Instance.new("UICorner"),
	Frame_20 = Instance.new("Frame"),
	UICorner_31 = Instance.new("UICorner"),
	BackButton_2 = Instance.new("TextButton"),
	UICorner_32 = Instance.new("UICorner"),
	Frame_21 = Instance.new("Frame"),
	UICorner_33 = Instance.new("UICorner"),
	ScrollingFrame = Instance.new("ScrollingFrame"),
	UIGridLayout_6 = Instance.new("UIGridLayout"),
	UIPadding_6 = Instance.new("UIPadding"),
	UICorner_34 = Instance.new("UICorner"),
	SavedContainers = Instance.new("Folder"),
	GameContainer = Instance.new("Frame"),
	Frame_22 = Instance.new("ImageLabel"),
	GameName_3 = Instance.new("TextLabel"),
	ImageLabel_7 = Instance.new("ImageLabel"),
	Trigger_3 = Instance.new("TextButton"),
	ExecutedLabel = Instance.new("TextLabel"),
	MessageContainer = Instance.new("TextLabel"),
	RemoveContainer = Instance.new("TextButton"),
}

-----------------------------------------------
-- Protects the main Ez Hub instance from findfirstchild type attacks
-- Not sure how it is too effective but for some reason it was detected in certain games

if syn and syn.protect_gui then syn.protect_gui(EzHub.EzHub);
elseif gethui then EzHub.EzHub.Parent = gethui();
elseif get_hidden_gui then EzHub.EzHub.Parent = get_hidden_gui(); end

-----------------------------------------------
-- Properties

do

	EzHub.EzHub.Name = "EzHub"
	EzHub.EzHub.Parent = game.CoreGui

	EzHub.MainFrame.Name = "MainFrame"
	EzHub.MainFrame.Parent = EzHub.EzHub
	EzHub.MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.MainFrame.BackgroundColor3 = Color3.fromRGB(41, 53, 68)
	EzHub.MainFrame.BorderSizePixel = 0
	EzHub.MainFrame.ClipsDescendants = true
	EzHub.MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	EzHub.MainFrame.Size = UDim2.new(0, 469, 0, 315)

	EzHub.TopFrame.Name = "TopFrame"
	EzHub.TopFrame.Parent = EzHub.MainFrame
	EzHub.TopFrame.BackgroundColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.TopFrame.BorderSizePixel = 0
	EzHub.TopFrame.Size = UDim2.new(0, 469, 0, 34)
	EzHub.TopFrame.ZIndex = 3

	EzHub.CloseNavButton.Name = "CloseNavButton"
	EzHub.CloseNavButton.Parent = EzHub.TopFrame
	EzHub.CloseNavButton.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.CloseNavButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.CloseNavButton.BackgroundTransparency = 1.000
	EzHub.CloseNavButton.BorderSizePixel = 0
	EzHub.CloseNavButton.Position = UDim2.new(0.0399999991, 0, 0.5, 0)
	EzHub.CloseNavButton.Size = UDim2.new(0, 20, 0, 20)
	EzHub.CloseNavButton.Visible = false
	EzHub.CloseNavButton.ZIndex = 4
	EzHub.CloseNavButton.Image = "http://www.roblox.com/asset/?id=5969992570"

	EzHub.TextLabel.Parent = EzHub.TopFrame
	EzHub.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel.BackgroundTransparency = 1.000
	EzHub.TextLabel.Position = UDim2.new(0.857142866, 0, 0.0294117667, 0)
	EzHub.TextLabel.Size = UDim2.new(0, 58, 0, 31)
	EzHub.TextLabel.ZIndex = 4
	EzHub.TextLabel.Font = Enum.Font.SourceSans
	EzHub.TextLabel.Text = "Ez Hub"
	EzHub.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel.TextSize = 20.000

	EzHub.NavButton.Name = "NavButton"
	EzHub.NavButton.Parent = EzHub.TopFrame
	EzHub.NavButton.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.NavButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.NavButton.BackgroundTransparency = 1.000
	EzHub.NavButton.BorderSizePixel = 0
	EzHub.NavButton.Position = UDim2.new(0.0399999991, 0, 0.5, 0)
	EzHub.NavButton.Size = UDim2.new(0, 28, 0, 28)
	EzHub.NavButton.ZIndex = 4
	EzHub.NavButton.Image = "http://www.roblox.com/asset/?id=5942241281"

	EzHub.UICorner.CornerRadius = UDim.new(0, 4)
	EzHub.UICorner.Parent = EzHub.TopFrame

	EzHub.Frame.Parent = EzHub.TopFrame
	EzHub.Frame.AnchorPoint = Vector2.new(0, 1)
	EzHub.Frame.BackgroundColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.Frame.BorderSizePixel = 0
	EzHub.Frame.Position = UDim2.new(0, 0, 1, 0)
	EzHub.Frame.Size = UDim2.new(1, 0, 0, 4)

	EzHub.NavFrame.Name = "NavFrame"
	EzHub.NavFrame.Parent = EzHub.MainFrame
	EzHub.NavFrame.Active = true
	EzHub.NavFrame.BackgroundColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.NavFrame.BorderSizePixel = 0
	EzHub.NavFrame.Position = UDim2.new(-0.5, 0, 0.108000003, 0)
	EzHub.NavFrame.Size = UDim2.new(0, 125, 0, 281)
	EzHub.NavFrame.ZIndex = 2
	EzHub.NavFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

	EzHub.UIGridLayout.Parent = EzHub.NavFrame
	EzHub.UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	EzHub.UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	EzHub.UIGridLayout.CellPadding = UDim2.new(0, 5, 0, 7)
	EzHub.UIGridLayout.CellSize = UDim2.new(0, 100, 0, 28)

	EzHub.HomeBtn.Name = "HomeBtn"
	EzHub.HomeBtn.Parent = EzHub.NavFrame
	EzHub.HomeBtn.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.HomeBtn.BorderSizePixel = 0
	EzHub.HomeBtn.LayoutOrder = 1
	EzHub.HomeBtn.Size = UDim2.new(0, 200, 0, 50)
	EzHub.HomeBtn.ZIndex = 3
	EzHub.HomeBtn.Font = Enum.Font.SourceSans
	EzHub.HomeBtn.Text = "Home"
	EzHub.HomeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.HomeBtn.TextSize = 14.000

	EzHub.UICorner_2.CornerRadius = UDim.new(0, 3)
	EzHub.UICorner_2.Parent = EzHub.HomeBtn

	EzHub.Frame_2.Parent = EzHub.HomeBtn
	EzHub.Frame_2.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_2.Size = UDim2.new(0, 2, 1, 0)
	EzHub.Frame_2.ZIndex = 4

	EzHub.UICorner_3.Parent = EzHub.Frame_2

	EzHub.UIPadding.Parent = EzHub.NavFrame
	EzHub.UIPadding.PaddingBottom = UDim.new(0, 15)
	EzHub.UIPadding.PaddingTop = UDim.new(0, 15)

	EzHub.ExclusivesV2Btn.Name = "ExclusivesV2Btn"
	EzHub.ExclusivesV2Btn.Parent = EzHub.NavFrame
	EzHub.ExclusivesV2Btn.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.ExclusivesV2Btn.BorderSizePixel = 0
	EzHub.ExclusivesV2Btn.LayoutOrder = 2
	EzHub.ExclusivesV2Btn.Size = UDim2.new(0, 200, 0, 50)
	EzHub.ExclusivesV2Btn.ZIndex = 3
	EzHub.ExclusivesV2Btn.Font = Enum.Font.SourceSans
	EzHub.ExclusivesV2Btn.Text = "Exclusives V2"
	EzHub.ExclusivesV2Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ExclusivesV2Btn.TextSize = 14.000

	EzHub.UICorner_4.CornerRadius = UDim.new(0, 3)
	EzHub.UICorner_4.Parent = EzHub.ExclusivesV2Btn

	EzHub.Frame_3.Parent = EzHub.ExclusivesV2Btn
	EzHub.Frame_3.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_3.Size = UDim2.new(0, 2, 1, 0)
	EzHub.Frame_3.ZIndex = 4

	EzHub.UICorner_5.Parent = EzHub.Frame_3

	EzHub.RepostedBtn.Name = "RepostedBtn"
	EzHub.RepostedBtn.Parent = EzHub.NavFrame
	EzHub.RepostedBtn.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.RepostedBtn.BorderSizePixel = 0
	EzHub.RepostedBtn.LayoutOrder = 4
	EzHub.RepostedBtn.Size = UDim2.new(0, 200, 0, 50)
	EzHub.RepostedBtn.ZIndex = 3
	EzHub.RepostedBtn.Font = Enum.Font.SourceSans
	EzHub.RepostedBtn.Text = "Reposted"
	EzHub.RepostedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.RepostedBtn.TextSize = 14.000

	EzHub.UICorner_6.CornerRadius = UDim.new(0, 3)
	EzHub.UICorner_6.Parent = EzHub.RepostedBtn

	EzHub.Frame_4.Parent = EzHub.RepostedBtn
	EzHub.Frame_4.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_4.Size = UDim2.new(0, 2, 1, 0)
	EzHub.Frame_4.ZIndex = 4

	EzHub.UICorner_7.Parent = EzHub.Frame_4

	EzHub.LocalLibBtn.Name = "LocalLibBtn"
	EzHub.LocalLibBtn.Parent = EzHub.NavFrame
	EzHub.LocalLibBtn.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.LocalLibBtn.BorderSizePixel = 0
	EzHub.LocalLibBtn.LayoutOrder = 5
	EzHub.LocalLibBtn.Size = UDim2.new(0, 200, 0, 50)
	EzHub.LocalLibBtn.ZIndex = 3
	EzHub.LocalLibBtn.Font = Enum.Font.SourceSans
	EzHub.LocalLibBtn.Text = "Local Lib"
	EzHub.LocalLibBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.LocalLibBtn.TextSize = 14.000

	EzHub.UICorner_8.CornerRadius = UDim.new(0, 3)
	EzHub.UICorner_8.Parent = EzHub.LocalLibBtn

	EzHub.Frame_5.Parent = EzHub.LocalLibBtn
	EzHub.Frame_5.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_5.Size = UDim2.new(0, 2, 1, 0)
	EzHub.Frame_5.ZIndex = 4

	EzHub.UICorner_9.Parent = EzHub.Frame_5

	EzHub.ExclusivesBtn.Name = "ExclusivesBtn"
	EzHub.ExclusivesBtn.Parent = EzHub.NavFrame
	EzHub.ExclusivesBtn.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.ExclusivesBtn.BorderSizePixel = 0
	EzHub.ExclusivesBtn.LayoutOrder = 3
	EzHub.ExclusivesBtn.Size = UDim2.new(0, 200, 0, 50)
	EzHub.ExclusivesBtn.ZIndex = 3
	EzHub.ExclusivesBtn.Font = Enum.Font.SourceSans
	EzHub.ExclusivesBtn.Text = "Exclusives V1"
	EzHub.ExclusivesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ExclusivesBtn.TextSize = 14.000

	EzHub.UICorner_10.CornerRadius = UDim.new(0, 3)
	EzHub.UICorner_10.Parent = EzHub.ExclusivesBtn

	EzHub.Frame_6.Parent = EzHub.ExclusivesBtn
	EzHub.Frame_6.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_6.Size = UDim2.new(0, 2, 1, 0)
	EzHub.Frame_6.ZIndex = 4

	EzHub.UICorner_11.Parent = EzHub.Frame_6

	EzHub.CreditsBtn.Name = "CreditsBtn"
	EzHub.CreditsBtn.Parent = EzHub.NavFrame
	EzHub.CreditsBtn.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.CreditsBtn.BorderSizePixel = 0
	EzHub.CreditsBtn.LayoutOrder = 6
	EzHub.CreditsBtn.Size = UDim2.new(0, 200, 0, 50)
	EzHub.CreditsBtn.ZIndex = 3
	EzHub.CreditsBtn.Font = Enum.Font.SourceSans
	EzHub.CreditsBtn.Text = "Credits"
	EzHub.CreditsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.CreditsBtn.TextSize = 14.000

	EzHub.UICorner_12.CornerRadius = UDim.new(0, 3)
	EzHub.UICorner_12.Parent = EzHub.CreditsBtn

	EzHub.Frame_7.Parent = EzHub.CreditsBtn
	EzHub.Frame_7.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_7.Size = UDim2.new(0, 2, 1, 0)
	EzHub.Frame_7.ZIndex = 4

	EzHub.UICorner_13.Parent = EzHub.Frame_7

	EzHub.ExclusivesFrame.Name = "ExclusivesFrame"
	EzHub.ExclusivesFrame.Parent = EzHub.MainFrame
	EzHub.ExclusivesFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ExclusivesFrame.BackgroundTransparency = 1.000
	EzHub.ExclusivesFrame.Position = UDim2.new(0, 0, 0.107936509, 0)
	EzHub.ExclusivesFrame.Size = UDim2.new(0, 469, 0, 281)
	EzHub.ExclusivesFrame.Visible = false

	EzHub.AnimFrame1.Name = "AnimFrame1"
	EzHub.AnimFrame1.Parent = EzHub.ExclusivesFrame
	EzHub.AnimFrame1.Active = true
	EzHub.AnimFrame1.AnchorPoint = Vector2.new(0, 1)
	EzHub.AnimFrame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.AnimFrame1.BackgroundTransparency = 1.000
	EzHub.AnimFrame1.BorderSizePixel = 0
	EzHub.AnimFrame1.Position = UDim2.new(0, 0, 1, 0)
	EzHub.AnimFrame1.Size = UDim2.new(0, 469, 0, 228)

	EzHub.UIGridLayout_2.Parent = EzHub.AnimFrame1
	EzHub.UIGridLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	EzHub.UIGridLayout_2.CellPadding = UDim2.new(0, 10, 0, 10)

	EzHub.UIPadding_2.Parent = EzHub.AnimFrame1
	EzHub.UIPadding_2.PaddingBottom = UDim.new(0, 20)
	EzHub.UIPadding_2.PaddingLeft = UDim.new(0, 15)
	EzHub.UIPadding_2.PaddingRight = UDim.new(0, 15)

	EzHub.SearchFrame.Name = "SearchFrame"
	EzHub.SearchFrame.Parent = EzHub.ExclusivesFrame
	EzHub.SearchFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.SearchFrame.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.SearchFrame.Position = UDim2.new(0.489339024, 0, 0, 26)
	EzHub.SearchFrame.Size = UDim2.new(0, 430, 0, 34)

	EzHub.ImageButton.Parent = EzHub.SearchFrame
	EzHub.ImageButton.AnchorPoint = Vector2.new(0, 0.5)
	EzHub.ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ImageButton.BackgroundTransparency = 1.000
	EzHub.ImageButton.BorderSizePixel = 0
	EzHub.ImageButton.ClipsDescendants = true
	EzHub.ImageButton.Position = UDim2.new(0.0240000002, 0, 0.5, 0)
	EzHub.ImageButton.Size = UDim2.new(0, 22, 0, 22)
	EzHub.ImageButton.Image = "http://www.roblox.com/asset/?id=3192528333"
	EzHub.ImageButton.ImageColor3 = Color3.fromRGB(35, 47, 62)

	EzHub.SearchBar.Name = "SearchBar"
	EzHub.SearchBar.Parent = EzHub.SearchFrame
	EzHub.SearchBar.AnchorPoint = Vector2.new(0, 0.5)
	EzHub.SearchBar.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.SearchBar.BorderColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.SearchBar.BorderSizePixel = 0
	EzHub.SearchBar.Position = UDim2.new(0.116999999, 0, 0.5, 0)
	EzHub.SearchBar.Size = UDim2.new(0, 364, 0, 22)
	EzHub.SearchBar.Font = Enum.Font.SourceSans
	EzHub.SearchBar.PlaceholderText = "Click to search..."
	EzHub.SearchBar.Text = ""
	EzHub.SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.SearchBar.TextSize = 14.000
	EzHub.SearchBar.TextWrapped = true
	EzHub.SearchBar.TextXAlignment = Enum.TextXAlignment.Left

	EzHub.UICorner_14.CornerRadius = UDim.new(0, 4)
	EzHub.UICorner_14.Parent = EzHub.SearchFrame

	EzHub.LoadingFrame.Name = "LoadingFrame"
	EzHub.LoadingFrame.Parent = EzHub.MainFrame
	EzHub.LoadingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.LoadingFrame.BackgroundTransparency = 1.000
	EzHub.LoadingFrame.Position = UDim2.new(0, 0, 0.107936509, 0)
	EzHub.LoadingFrame.Size = UDim2.new(0, 469, 0, 281)
	EzHub.LoadingFrame.Visible = false

	EzHub.TextLabel_2.Parent = EzHub.LoadingFrame
	EzHub.TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel_2.BackgroundTransparency = 1.000
	EzHub.TextLabel_2.Position = UDim2.new(0.409254879, 0, 0.181494668, 0)
	EzHub.TextLabel_2.Size = UDim2.new(0, 41, 0, 54)
	EzHub.TextLabel_2.Font = Enum.Font.Cartoon
	EzHub.TextLabel_2.Text = "Ez"
	EzHub.TextLabel_2.TextColor3 = Color3.fromRGB(190, 190, 190)
	EzHub.TextLabel_2.TextSize = 35.000
	EzHub.TextLabel_2.TextWrapped = true
	EzHub.TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

	EzHub.TextLabel_3.Parent = EzHub.LoadingFrame
	EzHub.TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel_3.BackgroundTransparency = 1.000
	EzHub.TextLabel_3.Position = UDim2.new(0.498399824, 0, 0.181494653, 0)
	EzHub.TextLabel_3.Size = UDim2.new(0, 62, 0, 54)
	EzHub.TextLabel_3.Font = Enum.Font.Cartoon
	EzHub.TextLabel_3.Text = "Hub"
	EzHub.TextLabel_3.TextColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.TextLabel_3.TextSize = 35.000
	EzHub.TextLabel_3.TextWrapped = true
	EzHub.TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

	EzHub.LoadingFrameBar.Name = "LoadingFrameBar"
	EzHub.LoadingFrameBar.Parent = EzHub.LoadingFrame
	EzHub.LoadingFrameBar.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.LoadingFrameBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.LoadingFrameBar.BackgroundTransparency = 1.000
	EzHub.LoadingFrameBar.Position = UDim2.new(0.5, 0, 0, 140)
	EzHub.LoadingFrameBar.Size = UDim2.new(0, 220, 0, 9)

	EzHub.LoadingBar.Name = "LoadingBar"
	EzHub.LoadingBar.Parent = EzHub.LoadingFrameBar
	EzHub.LoadingBar.AnchorPoint = Vector2.new(0, 0.5)
	EzHub.LoadingBar.BackgroundColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.LoadingBar.BackgroundTransparency = 1.000
	EzHub.LoadingBar.BorderSizePixel = 0
	EzHub.LoadingBar.Position = UDim2.new(0, 0, 0, 4)
	EzHub.LoadingBar.Size = UDim2.new(0, 0, 0, 9)
	EzHub.LoadingBar.Font = Enum.Font.SourceSans
	EzHub.LoadingBar.Text = ""
	EzHub.LoadingBar.TextColor3 = Color3.fromRGB(0, 0, 0)
	EzHub.LoadingBar.TextSize = 14.000

	EzHub.LoadingBar_Roundify_12px.Name = "LoadingBar_Roundify_12px"
	EzHub.LoadingBar_Roundify_12px.Parent = EzHub.LoadingBar
	EzHub.LoadingBar_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.LoadingBar_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.LoadingBar_Roundify_12px.BackgroundTransparency = 1.000
	EzHub.LoadingBar_Roundify_12px.Position = UDim2.new(0.5, 0, 0.5, 0)
	EzHub.LoadingBar_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
	EzHub.LoadingBar_Roundify_12px.Image = "rbxassetid://3570695787"
	EzHub.LoadingBar_Roundify_12px.ImageColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.LoadingBar_Roundify_12px.ScaleType = Enum.ScaleType.Slice
	EzHub.LoadingBar_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
	EzHub.LoadingBar_Roundify_12px.SliceScale = 0.120

	EzHub.LoadingInfo.Name = "LoadingInfo"
	EzHub.LoadingInfo.Parent = EzHub.LoadingFrame
	EzHub.LoadingInfo.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.LoadingInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.LoadingInfo.BackgroundTransparency = 1.000
	EzHub.LoadingInfo.Position = UDim2.new(0.5, 0, 0, 196)
	EzHub.LoadingInfo.Size = UDim2.new(0, 200, 0, 50)
	EzHub.LoadingInfo.Font = Enum.Font.SourceSans
	EzHub.LoadingInfo.Text = ""
	EzHub.LoadingInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.LoadingInfo.TextSize = 14.000

	EzHub.CreditsFrame.Name = "CreditsFrame"
	EzHub.CreditsFrame.Parent = EzHub.MainFrame
	EzHub.CreditsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.CreditsFrame.BackgroundTransparency = 1.000
	EzHub.CreditsFrame.Position = UDim2.new(0, 0, 0.107936509, 0)
	EzHub.CreditsFrame.Size = UDim2.new(0, 469, 0, 281)
	EzHub.CreditsFrame.Visible = false

	EzHub.AnimFrame1_2.Name = "AnimFrame1"
	EzHub.AnimFrame1_2.Parent = EzHub.CreditsFrame
	EzHub.AnimFrame1_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.AnimFrame1_2.BackgroundTransparency = 1.000
	EzHub.AnimFrame1_2.Size = UDim2.new(0, 469, 0, 281)

	EzHub.TextLabel_4.Parent = EzHub.AnimFrame1_2
	EzHub.TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel_4.BackgroundTransparency = 1.000
	EzHub.TextLabel_4.Position = UDim2.new(0.281449914, 0, 0.0533807874, 0)
	EzHub.TextLabel_4.Size = UDim2.new(0, 200, 0, 43)
	EzHub.TextLabel_4.Font = Enum.Font.SourceSans
	EzHub.TextLabel_4.Text = "Developer:"
	EzHub.TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel_4.TextSize = 21.000

	EzHub.TextLabel_5.Parent = EzHub.AnimFrame1_2
	EzHub.TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel_5.BackgroundTransparency = 1.000
	EzHub.TextLabel_5.Position = UDim2.new(0.285714298, 0, 0.640569389, 0)
	EzHub.TextLabel_5.Size = UDim2.new(0, 200, 0, 43)
	EzHub.TextLabel_5.Font = Enum.Font.SourceSans
	EzHub.TextLabel_5.Text = " V3rm: CDXX"
	EzHub.TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel_5.TextSize = 18.000
	EzHub.TextLabel_5.TextWrapped = true

	EzHub.TextLabel_6.Parent = EzHub.AnimFrame1_2
	EzHub.TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel_6.BackgroundTransparency = 1.000
	EzHub.TextLabel_6.Position = UDim2.new(0.268656731, 0, 0.555160224, 0)
	EzHub.TextLabel_6.Size = UDim2.new(0, 213, 0, 43)
	EzHub.TextLabel_6.Font = Enum.Font.SourceSans
	EzHub.TextLabel_6.Text = "Discord: CEO of Africa#0591"
	EzHub.TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel_6.TextSize = 18.000
	EzHub.TextLabel_6.TextWrapped = true

	EzHub.ImageLabel.Parent = EzHub.AnimFrame1_2
	EzHub.ImageLabel.AnchorPoint = Vector2.new(0, 0.5)
	EzHub.ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ImageLabel.BackgroundTransparency = 1.000
	EzHub.ImageLabel.BorderSizePixel = 0
	EzHub.ImageLabel.Position = UDim2.new(0.411000013, 0, 0.400000006, 0)
	EzHub.ImageLabel.Size = UDim2.new(0, 81, 0, 82)
	EzHub.ImageLabel.Image = "http://www.roblox.com/asset/?id=5980933241"

	EzHub.ImageLabel_2.Parent = EzHub.ImageLabel
	EzHub.ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ImageLabel_2.BackgroundTransparency = 1.000
	EzHub.ImageLabel_2.BorderSizePixel = 0
	EzHub.ImageLabel_2.Position = UDim2.new(0.506172836, 0, 0.5, 0)
	EzHub.ImageLabel_2.Size = UDim2.new(0, 82, 0, 83)
	EzHub.ImageLabel_2.Image = "rbxassetid://4031889928"
	EzHub.ImageLabel_2.ImageColor3 = Color3.fromRGB(41, 53, 68)

	EzHub.TextLabel_7.Parent = EzHub.AnimFrame1_2
	EzHub.TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel_7.BackgroundTransparency = 1.000
	EzHub.TextLabel_7.Position = UDim2.new(0.281449914, 0, 0.822064042, 0)
	EzHub.TextLabel_7.Size = UDim2.new(0, 200, 0, 50)
	EzHub.TextLabel_7.Font = Enum.Font.SourceSans
	EzHub.TextLabel_7.Text = "Special thanks to 0_King_0#6336 for testing"
	EzHub.TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel_7.TextSize = 14.000

	EzHub.RepostedFrame.Name = "RepostedFrame"
	EzHub.RepostedFrame.Parent = EzHub.MainFrame
	EzHub.RepostedFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.RepostedFrame.BackgroundTransparency = 1.000
	EzHub.RepostedFrame.Position = UDim2.new(0, 0, 0.107936509, 0)
	EzHub.RepostedFrame.Size = UDim2.new(0, 469, 0, 281)
	EzHub.RepostedFrame.Visible = false

	EzHub.AnimFrame1_3.Name = "AnimFrame1"
	EzHub.AnimFrame1_3.Parent = EzHub.RepostedFrame
	EzHub.AnimFrame1_3.Active = true
	EzHub.AnimFrame1_3.AnchorPoint = Vector2.new(0, 1)
	EzHub.AnimFrame1_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.AnimFrame1_3.BackgroundTransparency = 1.000
	EzHub.AnimFrame1_3.BorderSizePixel = 0
	EzHub.AnimFrame1_3.Position = UDim2.new(0, 0, 1, 0)
	EzHub.AnimFrame1_3.Size = UDim2.new(0, 469, 0, 228)

	EzHub.UIGridLayout_3.Parent = EzHub.AnimFrame1_3
	EzHub.UIGridLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
	EzHub.UIGridLayout_3.CellPadding = UDim2.new(0, 10, 0, 10)

	EzHub.UIPadding_3.Parent = EzHub.AnimFrame1_3
	EzHub.UIPadding_3.PaddingBottom = UDim.new(0, 20)
	EzHub.UIPadding_3.PaddingLeft = UDim.new(0, 15)
	EzHub.UIPadding_3.PaddingRight = UDim.new(0, 15)

	EzHub.SearchFrame_2.Name = "SearchFrame"
	EzHub.SearchFrame_2.Parent = EzHub.RepostedFrame
	EzHub.SearchFrame_2.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.SearchFrame_2.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.SearchFrame_2.Position = UDim2.new(0.489339024, 0, 0, 26)
	EzHub.SearchFrame_2.Size = UDim2.new(0, 430, 0, 34)

	EzHub.ImageButton_2.Parent = EzHub.SearchFrame_2
	EzHub.ImageButton_2.AnchorPoint = Vector2.new(0, 0.5)
	EzHub.ImageButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ImageButton_2.BackgroundTransparency = 1.000
	EzHub.ImageButton_2.BorderSizePixel = 0
	EzHub.ImageButton_2.ClipsDescendants = true
	EzHub.ImageButton_2.Position = UDim2.new(0.0240000002, 0, 0.5, 0)
	EzHub.ImageButton_2.Size = UDim2.new(0, 22, 0, 22)
	EzHub.ImageButton_2.Image = "http://www.roblox.com/asset/?id=3192528333"
	EzHub.ImageButton_2.ImageColor3 = Color3.fromRGB(35, 47, 62)

	EzHub.SearchBar_2.Name = "SearchBar"
	EzHub.SearchBar_2.Parent = EzHub.SearchFrame_2
	EzHub.SearchBar_2.AnchorPoint = Vector2.new(0, 0.5)
	EzHub.SearchBar_2.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.SearchBar_2.BorderColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.SearchBar_2.BorderSizePixel = 0
	EzHub.SearchBar_2.Position = UDim2.new(0.116999999, 0, 0.5, 0)
	EzHub.SearchBar_2.Size = UDim2.new(0, 364, 0, 22)
	EzHub.SearchBar_2.Font = Enum.Font.SourceSans
	EzHub.SearchBar_2.PlaceholderText = "Click to search..."
	EzHub.SearchBar_2.Text = ""
	EzHub.SearchBar_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.SearchBar_2.TextSize = 14.000
	EzHub.SearchBar_2.TextWrapped = true
	EzHub.SearchBar_2.TextXAlignment = Enum.TextXAlignment.Left

	EzHub.UICorner_15.CornerRadius = UDim.new(0, 4)
	EzHub.UICorner_15.Parent = EzHub.SearchFrame_2

	EzHub.HomeFrame.Name = "HomeFrame"
	EzHub.HomeFrame.Parent = EzHub.MainFrame
	EzHub.HomeFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.HomeFrame.BackgroundTransparency = 1.000
	EzHub.HomeFrame.Position = UDim2.new(0, 0, 0.107936509, 0)
	EzHub.HomeFrame.Size = UDim2.new(0, 469, 0, 281)
	EzHub.HomeFrame.Visible = false

	EzHub.AnimFrame1_4.Name = "AnimFrame1"
	EzHub.AnimFrame1_4.Parent = EzHub.HomeFrame
	EzHub.AnimFrame1_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.AnimFrame1_4.BackgroundTransparency = 1.000
	EzHub.AnimFrame1_4.Size = UDim2.new(0, 469, 0, 281)

	EzHub.ProfileFrame.Name = "ProfileFrame"
	EzHub.ProfileFrame.Parent = EzHub.AnimFrame1_4
	EzHub.ProfileFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ProfileFrame.BackgroundTransparency = 1.000
	EzHub.ProfileFrame.Position = UDim2.new(0.0383795314, 0, 0.0498220623, 0)
	EzHub.ProfileFrame.Size = UDim2.new(0, 430, 0, 117)
	EzHub.ProfileFrame.Image = "rbxassetid://3570695787"
	EzHub.ProfileFrame.ImageColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.ProfileFrame.ScaleType = Enum.ScaleType.Slice
	EzHub.ProfileFrame.SliceCenter = Rect.new(100, 100, 100, 100)
	EzHub.ProfileFrame.SliceScale = 0.040

	EzHub.ImageLabel_3.Parent = EzHub.ProfileFrame
	EzHub.ImageLabel_3.AnchorPoint = Vector2.new(0, 0.5)
	EzHub.ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ImageLabel_3.BackgroundTransparency = 1.000
	EzHub.ImageLabel_3.BorderSizePixel = 0
	EzHub.ImageLabel_3.Position = UDim2.new(0.0700000003, 0, 0.5, 0)
	EzHub.ImageLabel_3.Size = UDim2.new(0, 81, 0, 82)
	EzHub.ImageLabel_3.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

	EzHub.ImageLabel_4.Parent = EzHub.ImageLabel_3
	EzHub.ImageLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ImageLabel_4.BackgroundTransparency = 1.000
	EzHub.ImageLabel_4.BorderSizePixel = 0
	EzHub.ImageLabel_4.Position = UDim2.new(0.5, 0, 0.5, 0)
	EzHub.ImageLabel_4.Size = UDim2.new(0, 81, 0, 83)
	EzHub.ImageLabel_4.Image = "rbxassetid://4031889928"
	EzHub.ImageLabel_4.ImageColor3 = Color3.fromRGB(35, 47, 62)

	EzHub.TextLabel_8.Parent = EzHub.ProfileFrame
	EzHub.TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel_8.BackgroundTransparency = 1.000
	EzHub.TextLabel_8.Position = UDim2.new(0.367984951, 0, 0.145299152, 0)
	EzHub.TextLabel_8.Size = UDim2.new(0, 239, 0, 83)
	EzHub.TextLabel_8.Font = Enum.Font.SourceSans
	EzHub.TextLabel_8.Text = "Hello playerName, Thank you for using Ez Hub"
	EzHub.TextLabel_8.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel_8.TextSize = 16.000
	EzHub.TextLabel_8.TextWrapped = true

	EzHub.SponsorFrame.Name = "SponsorFrame"
	EzHub.SponsorFrame.Parent = EzHub.AnimFrame1_4
	EzHub.SponsorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.SponsorFrame.BackgroundTransparency = 1.000
	EzHub.SponsorFrame.Position = UDim2.new(0.0380000472, 0, 0.5, 0)
	EzHub.SponsorFrame.Size = UDim2.new(0, 256, 0, 125)
	EzHub.SponsorFrame.Image = "rbxassetid://3570695787"
	EzHub.SponsorFrame.ImageColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.SponsorFrame.ScaleType = Enum.ScaleType.Slice
	EzHub.SponsorFrame.SliceCenter = Rect.new(100, 100, 100, 100)
	EzHub.SponsorFrame.SliceScale = 0.040

	EzHub.SponsorText.Name = "SponsorText"
	EzHub.SponsorText.Parent = EzHub.SponsorFrame
	EzHub.SponsorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.SponsorText.BackgroundTransparency = 1.000
	EzHub.SponsorText.Position = UDim2.new(0.0454685688, 0, 0.391094238, 0)
	EzHub.SponsorText.Size = UDim2.new(0, 231, 0, 68)
	EzHub.SponsorText.Font = Enum.Font.SourceSans
	EzHub.SponsorText.Text = "There is currently no news to display."
	EzHub.SponsorText.TextColor3 = Color3.fromRGB(195, 195, 195)
	EzHub.SponsorText.TextSize = 15.000
	EzHub.SponsorText.TextWrapped = true
	EzHub.SponsorText.TextXAlignment = Enum.TextXAlignment.Left
	EzHub.SponsorText.TextYAlignment = Enum.TextYAlignment.Top

	EzHub.SectionEs.Name = "SectionEs"
	EzHub.SectionEs.Parent = EzHub.SponsorFrame

	EzHub.Frame_8.Parent = EzHub.SectionEs
	EzHub.Frame_8.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_8.Size = UDim2.new(0, 2, 0, 36)

	EzHub.UICorner_16.Parent = EzHub.Frame_8

	EzHub.Frame_9.Parent = EzHub.SectionEs
	EzHub.Frame_9.BackgroundColor3 = Color3.fromRGB(112, 112, 112)
	EzHub.Frame_9.BackgroundTransparency = 0.750
	EzHub.Frame_9.BorderSizePixel = 0
	EzHub.Frame_9.Position = UDim2.new(0, 0, 0.294290125, 0)
	EzHub.Frame_9.Size = UDim2.new(1, 0, 0, 1)

	EzHub.TextLabel_9.Parent = EzHub.SectionEs
	EzHub.TextLabel_9.AnchorPoint = Vector2.new(1, 0)
	EzHub.TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel_9.BackgroundTransparency = 1.000
	EzHub.TextLabel_9.Position = UDim2.new(0.951718807, 0, 0.0439999998, 0)
	EzHub.TextLabel_9.Size = UDim2.new(0.902343631, 0, 0, 24)
	EzHub.TextLabel_9.Font = Enum.Font.SourceSans
	EzHub.TextLabel_9.Text = "News"
	EzHub.TextLabel_9.TextColor3 = Color3.fromRGB(211, 216, 226)
	EzHub.TextLabel_9.TextSize = 14.000
	EzHub.TextLabel_9.TextXAlignment = Enum.TextXAlignment.Left

	EzHub.OtherFrame.Name = "OtherFrame"
	EzHub.OtherFrame.Parent = EzHub.AnimFrame1_4
	EzHub.OtherFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.OtherFrame.BackgroundTransparency = 1.000
	EzHub.OtherFrame.Position = UDim2.new(0.610257983, 0, 0.5, 0)
	EzHub.OtherFrame.Size = UDim2.new(0, 161, 0, 125)
	EzHub.OtherFrame.Image = "rbxassetid://3570695787"
	EzHub.OtherFrame.ImageColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.OtherFrame.ScaleType = Enum.ScaleType.Slice
	EzHub.OtherFrame.SliceCenter = Rect.new(100, 100, 100, 100)
	EzHub.OtherFrame.SliceScale = 0.040

	EzHub.Donate.Name = "Donate"
	EzHub.Donate.Parent = EzHub.OtherFrame
	EzHub.Donate.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Donate.BorderSizePixel = 0
	EzHub.Donate.Position = UDim2.new(0.0800993517, 0, 0.447094232, 0)
	EzHub.Donate.Size = UDim2.new(0, 102, 0, 23)
	EzHub.Donate.Font = Enum.Font.SourceSans
	EzHub.Donate.Text = "Donate"
	EzHub.Donate.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Donate.TextSize = 14.000

	EzHub.UICorner_17.CornerRadius = UDim.new(0, 4)
	EzHub.UICorner_17.Parent = EzHub.Donate

	EzHub.Discord.Name = "Discord"
	EzHub.Discord.Parent = EzHub.OtherFrame
	EzHub.Discord.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Discord.BorderSizePixel = 0
	EzHub.Discord.Position = UDim2.new(0.0800993517, 0, 0.703094244, 0)
	EzHub.Discord.Size = UDim2.new(0, 102, 0, 23)
	EzHub.Discord.Font = Enum.Font.SourceSans
	EzHub.Discord.Text = "Discord"
	EzHub.Discord.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Discord.TextSize = 14.000

	EzHub.UICorner_18.CornerRadius = UDim.new(0, 4)
	EzHub.UICorner_18.Parent = EzHub.Discord

	EzHub.SectionEs_2.Name = "SectionEs"
	EzHub.SectionEs_2.Parent = EzHub.OtherFrame

	EzHub.Frame_10.Parent = EzHub.SectionEs_2
	EzHub.Frame_10.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_10.Size = UDim2.new(0, 2, 0, 36)

	EzHub.UICorner_19.Parent = EzHub.Frame_10

	EzHub.Frame_11.Parent = EzHub.SectionEs_2
	EzHub.Frame_11.BackgroundColor3 = Color3.fromRGB(112, 112, 112)
	EzHub.Frame_11.BackgroundTransparency = 0.750
	EzHub.Frame_11.BorderSizePixel = 0
	EzHub.Frame_11.Position = UDim2.new(0, 0, 0.294290125, 0)
	EzHub.Frame_11.Size = UDim2.new(1, 0, 0, 1)

	EzHub.TextLabel_10.Parent = EzHub.SectionEs_2
	EzHub.TextLabel_10.AnchorPoint = Vector2.new(1, 0)
	EzHub.TextLabel_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TextLabel_10.BackgroundTransparency = 1.000
	EzHub.TextLabel_10.Position = UDim2.new(1, 0, 0.0439999998, 0)
	EzHub.TextLabel_10.Size = UDim2.new(0.899999976, 0, 0, 24)
	EzHub.TextLabel_10.Font = Enum.Font.SourceSans
	EzHub.TextLabel_10.Text = "Other"
	EzHub.TextLabel_10.TextColor3 = Color3.fromRGB(211, 216, 226)
	EzHub.TextLabel_10.TextSize = 14.000
	EzHub.TextLabel_10.TextXAlignment = Enum.TextXAlignment.Left

	EzHub.LocalLibFrame.Name = "LocalLibFrame"
	EzHub.LocalLibFrame.Parent = EzHub.MainFrame
	EzHub.LocalLibFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.LocalLibFrame.BackgroundTransparency = 1.000
	EzHub.LocalLibFrame.Position = UDim2.new(0, 0, 0.107936509, 0)
	EzHub.LocalLibFrame.Size = UDim2.new(0, 469, 0, 281)
	EzHub.LocalLibFrame.Visible = false

	EzHub.AnimFrame1_5.Name = "AnimFrame1"
	EzHub.AnimFrame1_5.Parent = EzHub.LocalLibFrame
	EzHub.AnimFrame1_5.Active = true
	EzHub.AnimFrame1_5.AnchorPoint = Vector2.new(0, 1)
	EzHub.AnimFrame1_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.AnimFrame1_5.BackgroundTransparency = 1.000
	EzHub.AnimFrame1_5.BorderSizePixel = 0
	EzHub.AnimFrame1_5.Position = UDim2.new(0, 0, 1, 0)
	EzHub.AnimFrame1_5.Size = UDim2.new(0, 469, 0, 228)

	EzHub.UIGridLayout_4.Parent = EzHub.AnimFrame1_5
	EzHub.UIGridLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
	EzHub.UIGridLayout_4.CellPadding = UDim2.new(0, 10, 0, 10)

	EzHub.UIPadding_4.Parent = EzHub.AnimFrame1_5
	EzHub.UIPadding_4.PaddingBottom = UDim.new(0, 20)
	EzHub.UIPadding_4.PaddingLeft = UDim.new(0, 15)
	EzHub.UIPadding_4.PaddingRight = UDim.new(0, 15)

	EzHub.ADD.Name = "ADD"
	EzHub.ADD.Parent = EzHub.AnimFrame1_5
	EzHub.ADD.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.ADD.BackgroundTransparency = 1.000
	EzHub.ADD.BorderSizePixel = 0
	EzHub.ADD.LayoutOrder = 1
	EzHub.ADD.Position = UDim2.new(-0.765458405, 0, 0.0249110311, 0)
	EzHub.ADD.Size = UDim2.new(0, 100, 0, 100)

	EzHub.Frame_12.Name = "Frame"
	EzHub.Frame_12.Parent = EzHub.ADD
	EzHub.Frame_12.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.Frame_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Frame_12.BackgroundTransparency = 1.000
	EzHub.Frame_12.ClipsDescendants = true
	EzHub.Frame_12.Position = UDim2.new(0.5, 0, 0.5, 0)
	EzHub.Frame_12.Size = UDim2.new(1, 0, 1, 0)
	EzHub.Frame_12.Image = "rbxassetid://3570695787"
	EzHub.Frame_12.ImageColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.Frame_12.ScaleType = Enum.ScaleType.Slice
	EzHub.Frame_12.SliceCenter = Rect.new(100, 100, 100, 100)
	EzHub.Frame_12.SliceScale = 0.040

	EzHub.GameName.Name = "GameName"
	EzHub.GameName.Parent = EzHub.Frame_12
	EzHub.GameName.AnchorPoint = Vector2.new(0.5, 0)
	EzHub.GameName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.GameName.BackgroundTransparency = 1.000
	EzHub.GameName.Position = UDim2.new(0.483800054, 0, 0.666842163, 0)
	EzHub.GameName.Size = UDim2.new(0, 75, 0, 31)
	EzHub.GameName.Font = Enum.Font.SourceSans
	EzHub.GameName.Text = "Add"
	EzHub.GameName.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.GameName.TextSize = 13.000
	EzHub.GameName.TextWrapped = true

	EzHub.ImageLabel_5.Parent = EzHub.Frame_12
	EzHub.ImageLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ImageLabel_5.BackgroundTransparency = 1.000
	EzHub.ImageLabel_5.Position = UDim2.new(0.130769044, 0, 0.100000001, 0)
	EzHub.ImageLabel_5.Size = UDim2.new(0, 72, 0, 54)
	EzHub.ImageLabel_5.Image = "http://www.roblox.com/asset/?id=4873174937"
	EzHub.ImageLabel_5.ImageRectOffset = Vector2.new(12, 12)
	EzHub.ImageLabel_5.ImageRectSize = Vector2.new(55, 50)

	EzHub.Trigger.Name = "Trigger"
	EzHub.Trigger.Parent = EzHub.Frame_12
	EzHub.Trigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Trigger.BackgroundTransparency = 1.000
	EzHub.Trigger.Size = UDim2.new(1, 0, 1, 0)
	EzHub.Trigger.Font = Enum.Font.SourceSans
	EzHub.Trigger.Text = ""
	EzHub.Trigger.TextColor3 = Color3.fromRGB(0, 0, 0)
	EzHub.Trigger.TextSize = 14.000
	EzHub.Trigger.TextTransparency = 1.000

	EzHub.REMOVE.Name = "REMOVE"
	EzHub.REMOVE.Parent = EzHub.AnimFrame1_5
	EzHub.REMOVE.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.REMOVE.BackgroundTransparency = 1.000
	EzHub.REMOVE.BorderSizePixel = 0
	EzHub.REMOVE.LayoutOrder = 1
	EzHub.REMOVE.Position = UDim2.new(-0.765458405, 0, 0.0249110311, 0)
	EzHub.REMOVE.Size = UDim2.new(0, 100, 0, 100)

	EzHub.Frame_13.Name = "Frame"
	EzHub.Frame_13.Parent = EzHub.REMOVE
	EzHub.Frame_13.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.Frame_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Frame_13.BackgroundTransparency = 1.000
	EzHub.Frame_13.ClipsDescendants = true
	EzHub.Frame_13.Position = UDim2.new(0.5, 0, 0.5, 0)
	EzHub.Frame_13.Size = UDim2.new(1, 0, 1, 0)
	EzHub.Frame_13.Image = "rbxassetid://3570695787"
	EzHub.Frame_13.ImageColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.Frame_13.ScaleType = Enum.ScaleType.Slice
	EzHub.Frame_13.SliceCenter = Rect.new(100, 100, 100, 100)
	EzHub.Frame_13.SliceScale = 0.040

	EzHub.GameName_2.Name = "GameName"
	EzHub.GameName_2.Parent = EzHub.Frame_13
	EzHub.GameName_2.AnchorPoint = Vector2.new(0.5, 0)
	EzHub.GameName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.GameName_2.BackgroundTransparency = 1.000
	EzHub.GameName_2.Position = UDim2.new(0.483800054, 0, 0.666842163, 0)
	EzHub.GameName_2.Size = UDim2.new(0, 75, 0, 31)
	EzHub.GameName_2.Font = Enum.Font.SourceSans
	EzHub.GameName_2.Text = "Remove"
	EzHub.GameName_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.GameName_2.TextSize = 13.000
	EzHub.GameName_2.TextWrapped = true

	EzHub.ImageLabel_6.Parent = EzHub.Frame_13
	EzHub.ImageLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ImageLabel_6.BackgroundTransparency = 1.000
	EzHub.ImageLabel_6.Position = UDim2.new(0.130769044, 0, 0.100000001, 0)
	EzHub.ImageLabel_6.Size = UDim2.new(0, 72, 0, 54)
	EzHub.ImageLabel_6.Image = "http://www.roblox.com/asset/?id=4873174703"
	EzHub.ImageLabel_6.ImageRectOffset = Vector2.new(12, 12)
	EzHub.ImageLabel_6.ImageRectSize = Vector2.new(55, 50)

	EzHub.Trigger_2.Name = "Trigger"
	EzHub.Trigger_2.Parent = EzHub.Frame_13
	EzHub.Trigger_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Trigger_2.BackgroundTransparency = 1.000
	EzHub.Trigger_2.Size = UDim2.new(1, 0, 1, 0)
	EzHub.Trigger_2.Font = Enum.Font.SourceSans
	EzHub.Trigger_2.Text = ""
	EzHub.Trigger_2.TextColor3 = Color3.fromRGB(0, 0, 0)
	EzHub.Trigger_2.TextSize = 14.000
	EzHub.Trigger_2.TextTransparency = 1.000

	EzHub.SearchFrame_3.Name = "SearchFrame"
	EzHub.SearchFrame_3.Parent = EzHub.LocalLibFrame
	EzHub.SearchFrame_3.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.SearchFrame_3.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.SearchFrame_3.Position = UDim2.new(0.489339024, 0, 0, 26)
	EzHub.SearchFrame_3.Size = UDim2.new(0, 430, 0, 34)

	EzHub.ImageButton_3.Parent = EzHub.SearchFrame_3
	EzHub.ImageButton_3.AnchorPoint = Vector2.new(0, 0.5)
	EzHub.ImageButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ImageButton_3.BackgroundTransparency = 1.000
	EzHub.ImageButton_3.BorderSizePixel = 0
	EzHub.ImageButton_3.ClipsDescendants = true
	EzHub.ImageButton_3.Position = UDim2.new(0.0240000002, 0, 0.5, 0)
	EzHub.ImageButton_3.Size = UDim2.new(0, 22, 0, 22)
	EzHub.ImageButton_3.Image = "http://www.roblox.com/asset/?id=3192528333"
	EzHub.ImageButton_3.ImageColor3 = Color3.fromRGB(35, 47, 62)

	EzHub.SearchBar_3.Name = "SearchBar"
	EzHub.SearchBar_3.Parent = EzHub.SearchFrame_3
	EzHub.SearchBar_3.AnchorPoint = Vector2.new(0, 0.5)
	EzHub.SearchBar_3.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.SearchBar_3.BorderColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.SearchBar_3.BorderSizePixel = 0
	EzHub.SearchBar_3.Position = UDim2.new(0.116999999, 0, 0.5, 0)
	EzHub.SearchBar_3.Size = UDim2.new(0, 364, 0, 22)
	EzHub.SearchBar_3.Font = Enum.Font.SourceSans
	EzHub.SearchBar_3.PlaceholderText = "Click to search..."
	EzHub.SearchBar_3.Text = ""
	EzHub.SearchBar_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.SearchBar_3.TextSize = 14.000
	EzHub.SearchBar_3.TextWrapped = true
	EzHub.SearchBar_3.TextXAlignment = Enum.TextXAlignment.Left

	EzHub.UICorner_20.CornerRadius = UDim.new(0, 4)
	EzHub.UICorner_20.Parent = EzHub.SearchFrame_3

	EzHub.ExclusivesV2Frame.Name = "ExclusivesV2Frame"
	EzHub.ExclusivesV2Frame.Parent = EzHub.MainFrame
	EzHub.ExclusivesV2Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ExclusivesV2Frame.BackgroundTransparency = 1.000
	EzHub.ExclusivesV2Frame.Position = UDim2.new(0, 0, 0.107936509, 0)
	EzHub.ExclusivesV2Frame.Size = UDim2.new(0, 469, 0, 281)
	EzHub.ExclusivesV2Frame.Visible = false

	EzHub.SearchFrame_4.Name = "SearchFrame"
	EzHub.SearchFrame_4.Parent = EzHub.ExclusivesV2Frame
	EzHub.SearchFrame_4.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.SearchFrame_4.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.SearchFrame_4.Position = UDim2.new(0.489339024, 0, 0, 26)
	EzHub.SearchFrame_4.Size = UDim2.new(0, 430, 0, 34)

	EzHub.ImageButton_4.Parent = EzHub.SearchFrame_4
	EzHub.ImageButton_4.AnchorPoint = Vector2.new(0, 0.5)
	EzHub.ImageButton_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ImageButton_4.BackgroundTransparency = 1.000
	EzHub.ImageButton_4.BorderSizePixel = 0
	EzHub.ImageButton_4.ClipsDescendants = true
	EzHub.ImageButton_4.Position = UDim2.new(0.0240000002, 0, 0.5, 0)
	EzHub.ImageButton_4.Size = UDim2.new(0, 22, 0, 22)
	EzHub.ImageButton_4.Image = "http://www.roblox.com/asset/?id=3192528333"
	EzHub.ImageButton_4.ImageColor3 = Color3.fromRGB(35, 47, 62)

	EzHub.SearchBar_4.Name = "SearchBar"
	EzHub.SearchBar_4.Parent = EzHub.SearchFrame_4
	EzHub.SearchBar_4.AnchorPoint = Vector2.new(0, 0.5)
	EzHub.SearchBar_4.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.SearchBar_4.BorderColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.SearchBar_4.BorderSizePixel = 0
	EzHub.SearchBar_4.Position = UDim2.new(0.116999999, 0, 0.5, 0)
	EzHub.SearchBar_4.Size = UDim2.new(0, 364, 0, 22)
	EzHub.SearchBar_4.Font = Enum.Font.SourceSans
	EzHub.SearchBar_4.PlaceholderText = "Click to search..."
	EzHub.SearchBar_4.Text = ""
	EzHub.SearchBar_4.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.SearchBar_4.TextSize = 14.000
	EzHub.SearchBar_4.TextWrapped = true
	EzHub.SearchBar_4.TextXAlignment = Enum.TextXAlignment.Left

	EzHub.UICorner_21.CornerRadius = UDim.new(0, 4)
	EzHub.UICorner_21.Parent = EzHub.SearchFrame_4

	EzHub.AnimFrame1_6.Name = "AnimFrame1"
	EzHub.AnimFrame1_6.Parent = EzHub.ExclusivesV2Frame
	EzHub.AnimFrame1_6.Active = true
	EzHub.AnimFrame1_6.AnchorPoint = Vector2.new(0, 1)
	EzHub.AnimFrame1_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.AnimFrame1_6.BackgroundTransparency = 1.000
	EzHub.AnimFrame1_6.BorderSizePixel = 0
	EzHub.AnimFrame1_6.Position = UDim2.new(0, 0, 1, 0)
	EzHub.AnimFrame1_6.Size = UDim2.new(0, 469, 0, 228)

	EzHub.UIGridLayout_5.Parent = EzHub.AnimFrame1_6
	EzHub.UIGridLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
	EzHub.UIGridLayout_5.CellPadding = UDim2.new(0, 10, 0, 10)

	EzHub.UIPadding_5.Parent = EzHub.AnimFrame1_6
	EzHub.UIPadding_5.PaddingBottom = UDim.new(0, 20)
	EzHub.UIPadding_5.PaddingLeft = UDim.new(0, 15)
	EzHub.UIPadding_5.PaddingRight = UDim.new(0, 15)

	EzHub.ADDFrame.Name = "ADDFrame"
	EzHub.ADDFrame.Parent = EzHub.MainFrame
	EzHub.ADDFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ADDFrame.BackgroundTransparency = 1.000
	EzHub.ADDFrame.Position = UDim2.new(0, 0, 0.107936509, 0)
	EzHub.ADDFrame.Size = UDim2.new(0, 469, 0, 281)
	EzHub.ADDFrame.Visible = false

	EzHub.AnimFrame1_7.Name = "AnimFrame1"
	EzHub.AnimFrame1_7.Parent = EzHub.ADDFrame
	EzHub.AnimFrame1_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.AnimFrame1_7.BackgroundTransparency = 1.000
	EzHub.AnimFrame1_7.Size = UDim2.new(0, 469, 0, 281)

	EzHub.Namer.Name = "Namer"
	EzHub.Namer.Parent = EzHub.AnimFrame1_7
	EzHub.Namer.BackgroundColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.Namer.BorderSizePixel = 0
	EzHub.Namer.Position = UDim2.new(0.0554370992, 0, 0.0533807799, 0)
	EzHub.Namer.Size = UDim2.new(0, 417, 0, 35)

	EzHub.ScriptNamer.Name = "ScriptNamer"
	EzHub.ScriptNamer.Parent = EzHub.Namer
	EzHub.ScriptNamer.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.ScriptNamer.BackgroundColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.ScriptNamer.BackgroundTransparency = 1.000
	EzHub.ScriptNamer.BorderColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.ScriptNamer.BorderSizePixel = 0
	EzHub.ScriptNamer.Position = UDim2.new(0.513189435, 0, 0.5, 0)
	EzHub.ScriptNamer.Size = UDim2.new(0.97362113, -12, 1, -12)
	EzHub.ScriptNamer.ZIndex = 2
	EzHub.ScriptNamer.ClearTextOnFocus = false
	EzHub.ScriptNamer.Font = Enum.Font.Code
	EzHub.ScriptNamer.PlaceholderColor3 = Color3.fromRGB(204, 204, 204)
	EzHub.ScriptNamer.PlaceholderText = "Script Name"
	EzHub.ScriptNamer.Text = ""
	EzHub.ScriptNamer.TextColor3 = Color3.fromRGB(204, 204, 204)
	EzHub.ScriptNamer.TextSize = 15.000
	EzHub.ScriptNamer.TextWrapped = true
	EzHub.ScriptNamer.TextXAlignment = Enum.TextXAlignment.Left

	EzHub.Frame_14.Parent = EzHub.Namer
	EzHub.Frame_14.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_14.Size = UDim2.new(0, 2, 1, 0)
	EzHub.Frame_14.ZIndex = 4

	EzHub.UICorner_22.Parent = EzHub.Frame_14

	EzHub.BackButton.Name = "BackButton"
	EzHub.BackButton.Parent = EzHub.AnimFrame1_7
	EzHub.BackButton.BackgroundColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.BackButton.BorderSizePixel = 0
	EzHub.BackButton.LayoutOrder = 6
	EzHub.BackButton.Position = UDim2.new(0, 280, 0, 231)
	EzHub.BackButton.Size = UDim2.new(0, 120, 0, 31)
	EzHub.BackButton.ZIndex = 3
	EzHub.BackButton.Font = Enum.Font.SourceSans
	EzHub.BackButton.Text = "Back"
	EzHub.BackButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.BackButton.TextSize = 14.000

	EzHub.UICorner_23.CornerRadius = UDim.new(0, 3)
	EzHub.UICorner_23.Parent = EzHub.BackButton

	EzHub.Frame_15.Parent = EzHub.BackButton
	EzHub.Frame_15.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_15.Size = UDim2.new(0, 2, 1, 0)
	EzHub.Frame_15.ZIndex = 4

	EzHub.UICorner_24.Parent = EzHub.Frame_15

	EzHub.CreateButton.Name = "CreateButton"
	EzHub.CreateButton.Parent = EzHub.AnimFrame1_7
	EzHub.CreateButton.BackgroundColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.CreateButton.BorderSizePixel = 0
	EzHub.CreateButton.LayoutOrder = 6
	EzHub.CreateButton.Position = UDim2.new(0, 26, 0, 231)
	EzHub.CreateButton.Size = UDim2.new(0, 120, 0, 31)
	EzHub.CreateButton.ZIndex = 3
	EzHub.CreateButton.Font = Enum.Font.SourceSans
	EzHub.CreateButton.Text = "Create Script"
	EzHub.CreateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.CreateButton.TextSize = 14.000

	EzHub.UICorner_25.CornerRadius = UDim.new(0, 3)
	EzHub.UICorner_25.Parent = EzHub.CreateButton

	EzHub.Frame_16.Parent = EzHub.CreateButton
	EzHub.Frame_16.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_16.Size = UDim2.new(0, 2, 1, 0)
	EzHub.Frame_16.ZIndex = 4

	EzHub.UICorner_26.Parent = EzHub.Frame_16

	EzHub.TestExecButton.Name = "TestExecButton"
	EzHub.TestExecButton.Parent = EzHub.AnimFrame1_7
	EzHub.TestExecButton.BackgroundColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.TestExecButton.BorderSizePixel = 0
	EzHub.TestExecButton.LayoutOrder = 6
	EzHub.TestExecButton.Position = UDim2.new(0, 153, 0, 231)
	EzHub.TestExecButton.Size = UDim2.new(0, 120, 0, 31)
	EzHub.TestExecButton.ZIndex = 3
	EzHub.TestExecButton.Font = Enum.Font.SourceSans
	EzHub.TestExecButton.Text = "Test Execute"
	EzHub.TestExecButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.TestExecButton.TextSize = 14.000

	EzHub.UICorner_27.CornerRadius = UDim.new(0, 3)
	EzHub.UICorner_27.Parent = EzHub.TestExecButton

	EzHub.Frame_17.Parent = EzHub.TestExecButton
	EzHub.Frame_17.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_17.Size = UDim2.new(0, 2, 1, 0)
	EzHub.Frame_17.ZIndex = 4

	EzHub.UICorner_28.Parent = EzHub.Frame_17

	EzHub.Editor.Name = "Editor"
	EzHub.Editor.Parent = EzHub.AnimFrame1_7
	EzHub.Editor.Active = true
	EzHub.Editor.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.Editor.BackgroundColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.Editor.BorderSizePixel = 0
	EzHub.Editor.Position = UDim2.new(0.5, 0, 0.501999974, 0)
	EzHub.Editor.Size = UDim2.new(0, 417, 0, 169)
	EzHub.Editor.CanvasSize = UDim2.new(0, 0, 0, 0)
	EzHub.Editor.ScrollBarThickness = 8

	EzHub.EditorFrame.Name = "EditorFrame"
	EzHub.EditorFrame.Parent = EzHub.Editor
	EzHub.EditorFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.EditorFrame.BackgroundColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.EditorFrame.BorderColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.EditorFrame.BorderSizePixel = 0
	EzHub.EditorFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	EzHub.EditorFrame.Size = UDim2.new(1, -12, 1, -12)
	EzHub.EditorFrame.ZIndex = 3
	EzHub.EditorFrame.CanvasSize = UDim2.new(4, 0, 2, 0)
	EzHub.EditorFrame.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	EzHub.EditorFrame.ScrollBarThickness = 5

	EzHub.Source.Name = "Source"
	EzHub.Source.Parent = EzHub.EditorFrame
	EzHub.Source.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Source.BackgroundTransparency = 1.000
	EzHub.Source.ClipsDescendants = true
	EzHub.Source.Position = UDim2.new(0, 30, 0, 0)
	EzHub.Source.Size = UDim2.new(0.928057551, 0, 1, 0)
	EzHub.Source.ZIndex = 3
	EzHub.Source.ClearTextOnFocus = false
	EzHub.Source.Font = Enum.Font.Code
	EzHub.Source.MultiLine = true
	EzHub.Source.PlaceholderColor3 = Color3.fromRGB(204, 204, 204)
	EzHub.Source.Text = "-- Insert script source here"
	EzHub.Source.TextColor3 = Color3.fromRGB(204, 204, 204)
	EzHub.Source.TextSize = 15.000
	EzHub.Source.TextXAlignment = Enum.TextXAlignment.Left
	EzHub.Source.TextYAlignment = Enum.TextYAlignment.Top

	EzHub.Comments_.Name = "Comments_"
	EzHub.Comments_.Parent = EzHub.Source
	EzHub.Comments_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Comments_.BackgroundTransparency = 1.000
	EzHub.Comments_.Size = UDim2.new(1, 0, 1, 0)
	EzHub.Comments_.ZIndex = 5
	EzHub.Comments_.Font = Enum.Font.Code
	EzHub.Comments_.Text = ""
	EzHub.Comments_.TextColor3 = Color3.fromRGB(59, 200, 59)
	EzHub.Comments_.TextSize = 15.000
	EzHub.Comments_.TextXAlignment = Enum.TextXAlignment.Left
	EzHub.Comments_.TextYAlignment = Enum.TextYAlignment.Top

	EzHub.Globals_.Name = "Globals_"
	EzHub.Globals_.Parent = EzHub.Source
	EzHub.Globals_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Globals_.BackgroundTransparency = 1.000
	EzHub.Globals_.Size = UDim2.new(1, 0, 1, 0)
	EzHub.Globals_.ZIndex = 5
	EzHub.Globals_.Font = Enum.Font.Code
	EzHub.Globals_.Text = ""
	EzHub.Globals_.TextColor3 = Color3.fromRGB(132, 214, 247)
	EzHub.Globals_.TextSize = 15.000
	EzHub.Globals_.TextXAlignment = Enum.TextXAlignment.Left
	EzHub.Globals_.TextYAlignment = Enum.TextYAlignment.Top

	EzHub.Keywords_.Name = "Keywords_"
	EzHub.Keywords_.Parent = EzHub.Source
	EzHub.Keywords_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Keywords_.BackgroundTransparency = 1.000
	EzHub.Keywords_.Size = UDim2.new(1, 0, 1, 0)
	EzHub.Keywords_.ZIndex = 5
	EzHub.Keywords_.Font = Enum.Font.Code
	EzHub.Keywords_.Text = ""
	EzHub.Keywords_.TextColor3 = Color3.fromRGB(248, 109, 124)
	EzHub.Keywords_.TextSize = 15.000
	EzHub.Keywords_.TextXAlignment = Enum.TextXAlignment.Left
	EzHub.Keywords_.TextYAlignment = Enum.TextYAlignment.Top

	EzHub.RemoteHighlight_.Name = "RemoteHighlight_"
	EzHub.RemoteHighlight_.Parent = EzHub.Source
	EzHub.RemoteHighlight_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.RemoteHighlight_.BackgroundTransparency = 1.000
	EzHub.RemoteHighlight_.Size = UDim2.new(1, 0, 1, 0)
	EzHub.RemoteHighlight_.ZIndex = 5
	EzHub.RemoteHighlight_.Font = Enum.Font.Code
	EzHub.RemoteHighlight_.Text = ""
	EzHub.RemoteHighlight_.TextColor3 = Color3.fromRGB(0, 144, 255)
	EzHub.RemoteHighlight_.TextSize = 15.000
	EzHub.RemoteHighlight_.TextXAlignment = Enum.TextXAlignment.Left
	EzHub.RemoteHighlight_.TextYAlignment = Enum.TextYAlignment.Top

	EzHub.Strings_.Name = "Strings_"
	EzHub.Strings_.Parent = EzHub.Source
	EzHub.Strings_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Strings_.BackgroundTransparency = 1.000
	EzHub.Strings_.Size = UDim2.new(1, 0, 1, 0)
	EzHub.Strings_.ZIndex = 5
	EzHub.Strings_.Font = Enum.Font.Code
	EzHub.Strings_.Text = ""
	EzHub.Strings_.TextColor3 = Color3.fromRGB(173, 241, 149)
	EzHub.Strings_.TextSize = 15.000
	EzHub.Strings_.TextXAlignment = Enum.TextXAlignment.Left
	EzHub.Strings_.TextYAlignment = Enum.TextYAlignment.Top

	EzHub.Tokens_.Name = "Tokens_"
	EzHub.Tokens_.Parent = EzHub.Source
	EzHub.Tokens_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Tokens_.BackgroundTransparency = 1.000
	EzHub.Tokens_.Size = UDim2.new(1, 0, 1, 0)
	EzHub.Tokens_.ZIndex = 5
	EzHub.Tokens_.Font = Enum.Font.Code
	EzHub.Tokens_.Text = ""
	EzHub.Tokens_.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Tokens_.TextSize = 15.000
	EzHub.Tokens_.TextXAlignment = Enum.TextXAlignment.Left
	EzHub.Tokens_.TextYAlignment = Enum.TextYAlignment.Top

	EzHub.Numbers_.Name = "Numbers_"
	EzHub.Numbers_.Parent = EzHub.Source
	EzHub.Numbers_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Numbers_.BackgroundTransparency = 1.000
	EzHub.Numbers_.Size = UDim2.new(1, 0, 1, 0)
	EzHub.Numbers_.ZIndex = 4
	EzHub.Numbers_.Font = Enum.Font.Code
	EzHub.Numbers_.Text = ""
	EzHub.Numbers_.TextColor3 = Color3.fromRGB(255, 198, 0)
	EzHub.Numbers_.TextSize = 15.000
	EzHub.Numbers_.TextXAlignment = Enum.TextXAlignment.Left
	EzHub.Numbers_.TextYAlignment = Enum.TextYAlignment.Top

	EzHub.Lines.Name = "Lines"
	EzHub.Lines.Parent = EzHub.EditorFrame
	EzHub.Lines.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Lines.BackgroundTransparency = 1.000
	EzHub.Lines.Size = UDim2.new(0, 30, 1, 0)
	EzHub.Lines.ZIndex = 4
	EzHub.Lines.Font = Enum.Font.Code
	EzHub.Lines.Text = "1"
	EzHub.Lines.TextColor3 = Color3.fromRGB(204, 204, 204)
	EzHub.Lines.TextSize = 15.000
	EzHub.Lines.TextWrapped = true
	EzHub.Lines.TextYAlignment = Enum.TextYAlignment.Top

	EzHub.Frame_18.Parent = EzHub.Editor
	EzHub.Frame_18.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_18.Size = UDim2.new(0, 2, 1, 0)
	EzHub.Frame_18.ZIndex = 4

	EzHub.UICorner_29.Parent = EzHub.Frame_18

	EzHub.REMOVEFrame.Name = "REMOVEFrame"
	EzHub.REMOVEFrame.Parent = EzHub.MainFrame
	EzHub.REMOVEFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.REMOVEFrame.BackgroundTransparency = 1.000
	EzHub.REMOVEFrame.Position = UDim2.new(0, 0, 0.107936509, 0)
	EzHub.REMOVEFrame.Size = UDim2.new(0, 469, 0, 281)
	EzHub.REMOVEFrame.Visible = false

	EzHub.AnimFrame1_8.Name = "AnimFrame1"
	EzHub.AnimFrame1_8.Parent = EzHub.REMOVEFrame
	EzHub.AnimFrame1_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.AnimFrame1_8.BackgroundTransparency = 1.000
	EzHub.AnimFrame1_8.Size = UDim2.new(0, 469, 0, 281)

	EzHub.Frame_19.Parent = EzHub.AnimFrame1_8
	EzHub.Frame_19.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.Frame_19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Frame_19.BackgroundTransparency = 1.000
	EzHub.Frame_19.Position = UDim2.new(0.504808128, 0, 0.5, 0)
	EzHub.Frame_19.Size = UDim2.new(0, 463, 0, 273)

	EzHub.RemoveButton.Name = "RemoveButton"
	EzHub.RemoveButton.Parent = EzHub.Frame_19
	EzHub.RemoveButton.AnchorPoint = Vector2.new(0, 1)
	EzHub.RemoveButton.BackgroundColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.RemoveButton.BorderSizePixel = 0
	EzHub.RemoveButton.LayoutOrder = 6
	EzHub.RemoveButton.Position = UDim2.new(0, 30, 1, -25)
	EzHub.RemoveButton.Size = UDim2.new(0, 120, 0, 31)
	EzHub.RemoveButton.ZIndex = 3
	EzHub.RemoveButton.Font = Enum.Font.SourceSans
	EzHub.RemoveButton.Text = "Remove Script"
	EzHub.RemoveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.RemoveButton.TextSize = 14.000

	EzHub.UICorner_30.CornerRadius = UDim.new(0, 3)
	EzHub.UICorner_30.Parent = EzHub.RemoveButton

	EzHub.Frame_20.Parent = EzHub.RemoveButton
	EzHub.Frame_20.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_20.Size = UDim2.new(0, 2, 1, 0)
	EzHub.Frame_20.ZIndex = 4

	EzHub.UICorner_31.Parent = EzHub.Frame_20

	EzHub.BackButton_2.Name = "BackButton"
	EzHub.BackButton_2.Parent = EzHub.Frame_19
	EzHub.BackButton_2.AnchorPoint = Vector2.new(1, 1)
	EzHub.BackButton_2.BackgroundColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.BackButton_2.BorderSizePixel = 0
	EzHub.BackButton_2.LayoutOrder = 6
	EzHub.BackButton_2.Position = UDim2.new(0.68900001, -40, 1, -25)
	EzHub.BackButton_2.Size = UDim2.new(0, 120, 0, 31)
	EzHub.BackButton_2.ZIndex = 3
	EzHub.BackButton_2.Font = Enum.Font.SourceSans
	EzHub.BackButton_2.Text = "Back"
	EzHub.BackButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.BackButton_2.TextSize = 14.000

	EzHub.UICorner_32.CornerRadius = UDim.new(0, 3)
	EzHub.UICorner_32.Parent = EzHub.BackButton_2

	EzHub.Frame_21.Parent = EzHub.BackButton_2
	EzHub.Frame_21.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.Frame_21.Size = UDim2.new(0, 2, 1, 0)
	EzHub.Frame_21.ZIndex = 4

	EzHub.UICorner_33.Parent = EzHub.Frame_21

	EzHub.ScrollingFrame.Parent = EzHub.Frame_19
	EzHub.ScrollingFrame.Active = true
	EzHub.ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.ScrollingFrame.BackgroundColor3 = Color3.fromRGB(28, 41, 56)
	EzHub.ScrollingFrame.BorderSizePixel = 0
	EzHub.ScrollingFrame.Position = UDim2.new(0.5, 0, 0.412820548, 0)
	EzHub.ScrollingFrame.Size = UDim2.new(1, -60, 1.02564108, -90)
	EzHub.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

	EzHub.UIGridLayout_6.Parent = EzHub.ScrollingFrame
	EzHub.UIGridLayout_6.HorizontalAlignment = Enum.HorizontalAlignment.Center
	EzHub.UIGridLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
	EzHub.UIGridLayout_6.CellPadding = UDim2.new(0, 5, 0, 8)
	EzHub.UIGridLayout_6.CellSize = UDim2.new(1, -35, 0, 30)

	EzHub.UIPadding_6.Parent = EzHub.ScrollingFrame
	EzHub.UIPadding_6.PaddingBottom = UDim.new(0, 14)
	EzHub.UIPadding_6.PaddingTop = UDim.new(0, 14)

	EzHub.UICorner_34.CornerRadius = UDim.new(0, 4)
	EzHub.UICorner_34.Parent = EzHub.MainFrame

	EzHub.SavedContainers.Name = "SavedContainers"
	EzHub.SavedContainers.Parent = EzHub.EzHub

	EzHub.GameContainer.Name = "GameContainer"
	EzHub.GameContainer.Parent = EzHub.SavedContainers
	EzHub.GameContainer.BackgroundColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.GameContainer.BackgroundTransparency = 1.000
	EzHub.GameContainer.BorderSizePixel = 0
	EzHub.GameContainer.Position = UDim2.new(-0.765458405, 0, 0.0249110311, 0)
	EzHub.GameContainer.Size = UDim2.new(0, 100, 0, 100)

	EzHub.Frame_22.Name = "Frame"
	EzHub.Frame_22.Parent = EzHub.GameContainer
	EzHub.Frame_22.AnchorPoint = Vector2.new(0.5, 0.5)
	EzHub.Frame_22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Frame_22.BackgroundTransparency = 1.000
	EzHub.Frame_22.ClipsDescendants = true
	EzHub.Frame_22.Position = UDim2.new(0.5, 0, 0.5, 0)
	EzHub.Frame_22.Size = UDim2.new(1, 0, 1, 0)
	EzHub.Frame_22.Image = "rbxassetid://3570695787"
	EzHub.Frame_22.ImageColor3 = Color3.fromRGB(35, 47, 62)
	EzHub.Frame_22.ScaleType = Enum.ScaleType.Slice
	EzHub.Frame_22.SliceCenter = Rect.new(100, 100, 100, 100)
	EzHub.Frame_22.SliceScale = 0.040

	EzHub.GameName_3.Name = "GameName"
	EzHub.GameName_3.Parent = EzHub.Frame_22
	EzHub.GameName_3.AnchorPoint = Vector2.new(0.5, 0)
	EzHub.GameName_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.GameName_3.BackgroundTransparency = 1.000
	EzHub.GameName_3.Position = UDim2.new(0.483800054, 0, 0.666842163, 0)
	EzHub.GameName_3.Size = UDim2.new(0, 75, 0, 31)
	EzHub.GameName_3.Font = Enum.Font.SourceSans
	EzHub.GameName_3.Text = "Redwood Prison GUI"
	EzHub.GameName_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.GameName_3.TextSize = 13.000
	EzHub.GameName_3.TextWrapped = true

	EzHub.ImageLabel_7.Parent = EzHub.Frame_22
	EzHub.ImageLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ImageLabel_7.BackgroundTransparency = 1.000
	EzHub.ImageLabel_7.Position = UDim2.new(0.130769044, 0, 0.100000001, 0)
	EzHub.ImageLabel_7.Size = UDim2.new(0, 72, 0, 54)
	EzHub.ImageLabel_7.Image = "rbxassetid://4030893123"

	EzHub.Trigger_3.Name = "Trigger"
	EzHub.Trigger_3.Parent = EzHub.Frame_22
	EzHub.Trigger_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.Trigger_3.BackgroundTransparency = 1.000
	EzHub.Trigger_3.Size = UDim2.new(1, 0, 1, 0)
	EzHub.Trigger_3.Font = Enum.Font.SourceSans
	EzHub.Trigger_3.Text = ""
	EzHub.Trigger_3.TextColor3 = Color3.fromRGB(0, 0, 0)
	EzHub.Trigger_3.TextSize = 14.000
	EzHub.Trigger_3.TextTransparency = 1.000

	EzHub.ExecutedLabel.Name = "ExecutedLabel"
	EzHub.ExecutedLabel.Parent = EzHub.Frame_22
	EzHub.ExecutedLabel.AnchorPoint = Vector2.new(0.5, 1)
	EzHub.ExecutedLabel.BackgroundColor3 = Color3.fromRGB(57, 198, 55)
	EzHub.ExecutedLabel.BackgroundTransparency = 0.450
	EzHub.ExecutedLabel.BorderSizePixel = 0
	EzHub.ExecutedLabel.Position = UDim2.new(0.5, 0, 2, 0)
	EzHub.ExecutedLabel.Size = UDim2.new(1, 0, 1, 0)
	EzHub.ExecutedLabel.Font = Enum.Font.Ubuntu
	EzHub.ExecutedLabel.Text = "<b>Executed Script!</b>"
	EzHub.ExecutedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.ExecutedLabel.TextSize = 16.000
	EzHub.ExecutedLabel.TextWrapped = true

	EzHub.MessageContainer.Name = "MessageContainer"
	EzHub.MessageContainer.Parent = EzHub.SavedContainers
	EzHub.MessageContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.MessageContainer.BackgroundTransparency = 1.000
	EzHub.MessageContainer.Size = UDim2.new(0, 200, 0, 50)
	EzHub.MessageContainer.Visible = false
	EzHub.MessageContainer.Font = Enum.Font.SourceSans
	EzHub.MessageContainer.Text = "No local scripts found to delete"
	EzHub.MessageContainer.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.MessageContainer.TextSize = 14.000

	EzHub.RemoveContainer.Name = "RemoveContainer"
	EzHub.RemoveContainer.Parent = EzHub.SavedContainers
	EzHub.RemoveContainer.BackgroundColor3 = Color3.fromRGB(41, 53, 68)
	EzHub.RemoveContainer.BorderColor3 = Color3.fromRGB(18, 98, 159)
	EzHub.RemoveContainer.BorderSizePixel = 0
	EzHub.RemoveContainer.Size = UDim2.new(0, 200, 0, 50)
	EzHub.RemoveContainer.Visible = false
	EzHub.RemoveContainer.Font = Enum.Font.SourceSans
	EzHub.RemoveContainer.Text = "Script Name"
	EzHub.RemoveContainer.TextColor3 = Color3.fromRGB(255, 255, 255)
	EzHub.RemoveContainer.TextSize = 14.000

end

-------------------------------------------------------------------------------------------------

-- Missing Functions/Broken Conversion (GUI TO LUA)

EzHub.ExecutedLabel.RichText = true;
EzHub.ExclusivesFrame.AnimFrame1.ScrollBarImageColor3 = Color3.fromRGB(14, 21, 30);
EzHub.ExclusivesV2Frame.AnimFrame1.ScrollBarImageColor3 = Color3.fromRGB(14, 21, 30);
EzHub.RepostedFrame.AnimFrame1.ScrollBarImageColor3 = Color3.fromRGB(14, 21, 30);
EzHub.LocalLibFrame.AnimFrame1.ScrollBarImageColor3 = Color3.fromRGB(14, 21, 30);
EzHub.EditorFrame.ScrollBarImageColor3 = Color3.fromRGB(14, 21, 30);

-------------------------------------------------------------------------------------------------

-- Tab positioning, container and handling

local tabs = {EzHub.LoadingFrame, EzHub.HomeFrame, EzHub.ExclusivesFrame, EzHub.RepostedFrame, EzHub.CreditsFrame, EzHub.LocalLibFrame, EzHub.ExclusivesV2Frame, EzHub.ADDFrame, EzHub.REMOVEFrame};
for i,v in pairs(tabs) do
	if v == EzHub.LoadingFrame then
		v.Position = UDim2.new(0, 0, 0.1, 0);
	else
		v.Position = UDim2.new(0,0,1,0);
	end
	v.Visible = true;
end

local function openTab(tabInstance)
	
	-- Closing Of All Other Tabs
	for i,v in pairs(tabs) do
		if v.Position == UDim2.new(0, 0, 0.1, 0) or v.Position == UDim2.new(0.27, 0, 0.1, 0) and v ~= tabInstance then
			v:TweenPosition(v.Position + UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.3, true);
			wait(0.3);
			v.Position = UDim2.new(0,0,1,0);
			break;
		end
	end
	
	-- Open Requested Tab
	tabInstance:TweenPosition(UDim2.new(0, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.3, true);
	
end

-------------------------------------------------------------------------------------------------

-- Script container and animation handling functions

local originalPosition, afterPosition = {}, {};
local function applyContainerSelectAnimation(con)
	originalPosition[con] = con.Frame.Position;
	afterPosition[con] = con.Frame.Position + UDim2.new(0,0,0,-7);
	con.Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			con.Frame:TweenPosition(afterPosition[con], Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.15, true);
		end
	end)
	con.Frame.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			con.Frame:TweenPosition(originalPosition[con], Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.15, true);
		end
	end)
end

local function addScript(configs)
	if not configs then
		configs = {
			["scriptName"] = "Script",
			["function"] = "function() end",
			["parent"] = game.CoreGui
		};
	end

	local mainContainer = EzHub.SavedContainers.GameContainer:Clone();
	mainContainer.Frame.GameName.Text = configs.scriptName;
	mainContainer.Visible = true;
	mainContainer.Parent = configs.parent;
	applyContainerSelectAnimation(mainContainer);

	-- The reason for a function holder is so that I can get the function value and save it easily
	-- for local lib scripts
	if type(configs["function"]) == "string" then
		local stringHolder = Instance.new("StringValue");
		stringHolder.Value = configs["function"];
		stringHolder.Name = "funcHolder";
		stringHolder.Parent = mainContainer;
	end

	mainContainer.Frame.Trigger.MouseButton1Click:Connect(function()
		
		-- Executed Label animation
		coroutine.wrap(function() 
			mainContainer.Frame.ExecutedLabel:TweenPosition(UDim2.new(0.5,0,1,0), 
			Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.4, true);
			wait(2);
			mainContainer.Frame.ExecutedLabel:TweenPosition(UDim2.new(0.5,0,2,0), 
			Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.4, true);
		end)();

		-- Run Script
		pcall(function()
			if type(configs["function"]) == "function" then
				configs["function"]();
			else
				loadstring(mainContainer.funcHolder.Value)();
			end
		end)

	end)

end

local function getActiveFrame()
	for i,v in pairs(tabs) do
		if v.Position == UDim2.new(0, 0, 0.1, 0) or v.Position == UDim2.new(0.27,0,0.1,0) then
			return v;
		end
	end
end

local navDebounce = true;
local function handleNavBtn()
	if navDebounce then
		navDebounce = false;

		local navslidethread = coroutine.create(function()
			if EzHub.NavFrame.Position ~= UDim2.new(-0.5, 0, 0.108, 0) then
				EzHub.NavFrame:TweenPosition(UDim2.new(-0.5, 0, 0.108, 0),Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.4, true);	-- Hide
				getActiveFrame():TweenPosition(getActiveFrame().Position - UDim2.new(0.27,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true);
			else
				EzHub.NavFrame:TweenPosition(UDim2.new(0, 0,0.108, 0),Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.4, true);		-- Show
				getActiveFrame():TweenPosition(getActiveFrame().Position + UDim2.new(0.27,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true);
			end
		end)
		coroutine.resume(navslidethread);

		if EzHub.NavButton.Visible then

			for i = 1, 10 do
				game:GetService("RunService").RenderStepped:Wait();
				EzHub.NavButton.Rotation = EzHub.NavButton.Rotation - 20;
			end
			EzHub.NavButton.Visible = false;
			EzHub.CloseNavButton.Rotation = EzHub.NavButton.Rotation;
			EzHub.CloseNavButton.Visible = true;
			for i = 1, 8 do
				game:GetService("RunService").RenderStepped:Wait();
				EzHub.CloseNavButton.Rotation = EzHub.CloseNavButton.Rotation - 20;
			end

		else

			for i = 1, 8 do
				game:GetService("RunService").RenderStepped:Wait();
				EzHub.CloseNavButton.Rotation = EzHub.CloseNavButton.Rotation + 20;
			end
			EzHub.NavButton.Visible = true;
			EzHub.NavButton.Rotation = EzHub.CloseNavButton.Rotation;
			EzHub.CloseNavButton.Visible = false;
			for i = 1,10 do
				game:GetService("RunService").RenderStepped:Wait();
				EzHub.NavButton.Rotation = EzHub.NavButton.Rotation + 20;
			end

		end
		
		repeat wait() until coroutine.status(navslidethread) == "dead";
		wait(.2);

		navDebounce = true;
	end
end

EzHub.NavButton.MouseButton1Click:Connect(handleNavBtn);
EzHub.CloseNavButton.MouseButton1Click:Connect(handleNavBtn);

local navButtonDebounce = true;

local function bindTabButton(button, tab)
	button.MouseButton1Click:Connect(function()
		if navButtonDebounce == false then return end
		navButtonDebounce = false;
		openTab(tab);
		handleNavBtn();
		navButtonDebounce = true;
	end)
end

bindTabButton(EzHub.ExclusivesBtn, EzHub.ExclusivesFrame);
bindTabButton(EzHub.RepostedBtn, EzHub.RepostedFrame);
bindTabButton(EzHub.HomeBtn, EzHub.HomeFrame);
bindTabButton(EzHub.CreditsBtn, EzHub.CreditsFrame);
bindTabButton(EzHub.LocalLibBtn, EzHub.LocalLibFrame);
bindTabButton(EzHub.ExclusivesV2Btn, EzHub.ExclusivesV2Frame);

-------------------------------------------------------------------------------------------------
	
-- Script Module Resizing
-- Roblox has now added support for scrolling frames to automatically change size
-- without the need to change manually, however, I will continue to use a manual method because
-- I cannot be bothered changing it.

local function applyFrameResizing(scrollingframe)
	pcall(function()
		local cS = scrollingframe.UIGridLayout.AbsoluteContentSize;
		scrollingframe.CanvasSize = UDim2.new(0,scrollingframe.Size.X,0,cS.Y + 30);
		scrollingframe.UIGridLayout.Changed:Connect(function()
			scrollingframe.CanvasSize = UDim2.new(0,scrollingframe.Size.X,0,cS.Y + 30);
		end)
	end)	
end

applyFrameResizing(EzHub.ExclusivesFrame.AnimFrame1);
applyFrameResizing(EzHub.RepostedFrame.AnimFrame1);
applyFrameResizing(EzHub.ExclusivesV2Frame.AnimFrame1);
applyFrameResizing(EzHub.LocalLibFrame.AnimFrame1);

-------------------------------------------------------------------------------------------------

-- Search Bar Code

local function functionaliseSearchBar(instance, section)
	instance.PlaceholderText = "Type to search...";
	instance:GetPropertyChangedSignal("Text"):Connect(function()
		if instance.Text == "" then
			for i,v in pairs(section:GetChildren()) do
				if v:IsA("Frame") then
					v.Visible = true;
				end
			end
		else
			for i,v in pairs(section:GetChildren()) do
				if v:IsA("Frame") and string.find(v.Frame.GameName.Text:lower(), instance.Text:lower()) then
					v.Visible = true;
				elseif v:IsA("Frame") then
					v.Visible = false;
				end
			end
		end
	end)
end

functionaliseSearchBar(EzHub.ExclusivesFrame.SearchFrame.SearchBar, EzHub.ExclusivesFrame.AnimFrame1);
functionaliseSearchBar(EzHub.RepostedFrame.SearchFrame.SearchBar, EzHub.RepostedFrame.AnimFrame1);
functionaliseSearchBar(EzHub.ExclusivesV2Frame.SearchFrame.SearchBar, EzHub.ExclusivesV2Frame.AnimFrame1);
functionaliseSearchBar(EzHub.LocalLibFrame.SearchFrame.SearchBar, EzHub.LocalLibFrame.AnimFrame1);

-------------------------------------------------------------------------------------------------

-- Loading And Preloading

local function loadToStage(scaleUdim, status)
	EzHub.LoadingBar:TweenSize(UDim2.new(scaleUdim, 0,0,9), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1, true);
	EzHub.LoadingInfo.Text = status;
end

-----------------------------------------------

local loadTimerStart = tick();
loadToStage(0, "Setting up Ez Hub...");

-- Module links contains all external dependencies of ez hub in one json module
-- Load all modules inside moduleLinks and store them in a G Table

local moduleLinks = loadstring(game:HttpGet("https://raw.githubusercontent.com/debug420/Ez-Hub/"..
(_G.EzHubDevMode and "dev" or "master").."/Modules/InitModules.lua"))().init(function(moduleIndex, moduleNumber, moduleName)
	loadToStage(math.clamp(((1 / moduleNumber) * moduleIndex), 0.1, 0.9),
	"Loading module "..moduleName.." - "..moduleIndex.." / "..moduleNumber);
end);

-----------------------------------------------
-- Finalize

loadToStage(0.95, "Finalising and Cleaning Up...");

EzHub.ProfileFrame.ImageLabel.Image = game:GetService("Players"):GetUserThumbnailAsync(game:GetService("Players").LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420);
EzHub.SponsorText.Text = "There is currently no news to display.";
EzHub.TextLabel_8.Text = "Hello "..game.Players.LocalPlayer.Name..", Thank you for using Ez Hub";

local ezlib = loadstring(_G["EzHubModules"]["ezlib"])();

for i,v in pairs(game:GetService("HttpService"):JSONDecode(_G["EzHubModules"]["repostedmodule"])) do
	addScript({
		["scriptName"] = tostring(i),
		["function"] = function()
			loadstring(game:HttpGet(tostring(v)))();
		end,
		["parent"] = EzHub.RepostedFrame.AnimFrame1
	});
end

for i,v in pairs(game:GetService("HttpService"):JSONDecode(_G["EzHubModules"]["exclusivesmodule"])) do
	addScript({
		["scriptName"] = tostring(i),
		["function"] = function()

			local notif = ezlib.newNotif(ezlib.enum.notifType.buttons,
			"The following exclusive is outdated. Use Exclusive V2s. Continue anyway?",
			"Yes", "No",
			function() loadstring(tostring(v))() end,
			function() return end);

			notif.show();
			notif.buttonClicked.Event:Wait();
			notif.hide();
			notif.delete();

		end,
		["parent"] = EzHub.ExclusivesFrame.AnimFrame1
	});
end

for i,v in pairs(game:GetService("HttpService"):JSONDecode(_G["EzHubModules"]["exclusivesv2module"])) do
	addScript({
		["scriptName"] = tostring(i),
		["function"] = function()
			loadstring(game:HttpGet(tostring(v)))();
		end,
		["parent"] = EzHub.ExclusivesV2Frame.AnimFrame1
	});
end

-----------------------------------------------
-- Display how long it took to load Ez Hub
local loadTimerEnd = tick() - loadTimerStart;
loadToStage(1, "Loaded in "..math.floor(loadTimerEnd * 100) / 100);	-- Round to 2 decimal places by multiplying for floor and then undoing it.

wait(1.5);
openTab(EzHub.HomeFrame);

-------------------------------------------------------------------------------------------------

-- The following section is obfuscated as it handles the sending of the user's data to the Discord webhooks for better user experience
-- If you wish to not get logged, add the following code to the start of the launcher code you execute:
-- By using Ez Hub, you automatically agreed to having certain information logged (nothing sensitive)
-- I try to be as open as I can with how I log data - And reasonable.
-- Information of what exactly is logged is stated in the main Ez Hub thread

--[[

_G.DISABLEEXELOG = true;
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))();

]]

if not _G.DISABLEEXELOG then
	coroutine.wrap(function() 
		loadstring(_G["EzHubModules"]["logger"])().exeLog();
	end)();
else
	spawn(function() ezlib.newNotif(ezlib.enum.notifType.text, "Ez Hub blocked EXE Logger.").play().delete(); end)
end

-------------------------------------------------------------------------------------------------

-- Other Section Buttons (HOME)

local otherSectionButtonDebounce = true;

local oldTextDonate = EzHub.Donate.Text;
EzHub.Donate.MouseButton1Click:Connect(function()
	if not otherSectionButtonDebounce then return end
	otherSectionButtonDebounce = false;

	EzHub.Donate.Text = "Teleporting...";
	ezlib.newNotif(ezlib.enum.notifType.text, "Teleporting to donation place...").play().delete();
	game:GetService("TeleportService"):Teleport(5896209906, game:GetService("Players").LocalPlayer);
	wait(2);
	EzHub.Donate.Text = oldTextDonate;

	otherSectionButtonDebounce = true;
end)

local oldTextDiscord = EzHub.Discord.Text;
EzHub.Discord.MouseButton1Click:Connect(function()
	if not otherSectionButtonDebounce then return end
	otherSectionButtonDebounce = false;

	EzHub.Discord.Text = "Copied";
	pcall(function() setclipboard("https://discord.gg/tuWcU7Q") end);
	wait(2);
	EzHub.Discord.Text = oldTextDiscord;

	otherSectionButtonDebounce = true;
end)

-------------------------------------------------------------------------------------------------

-- Local Lib (Adding your own scripts)
-- This section will contain all functions required for local lib to function

-- Lexer Logic

loadstring(_G["EzHubModules"]["lexermodule"])().highlight_source("Text", EzHub.EditorFrame.Source, EzHub.EditorFrame.Lines);

EzHub.EditorFrame.Source:GetPropertyChangedSignal("Text"):Connect(function()
	loadstring(_G["EzHubModules"]["lexermodule"])().highlight_source("Text", EzHub.EditorFrame.Source, EzHub.EditorFrame.Lines);
end)

-- Update Saved Files
local function updateLocalLibSaves()
	local t = {};
	for i,v in pairs(EzHub.LocalLibFrame.AnimFrame1:GetChildren()) do
		if v.Name == "GameContainer" then
			t[v.Frame.GameName.Text] = v.funcHolder.Value;
		end
	end
	pcall(function() writefile(localLibPathFile, game:GetService("HttpService"):JSONEncode(t)); end);
end

-- Simple function to show errors when creating a local lib script.
local function showScriptCreationError(err, del)
	del = del or 3;
	EzHub.ADDFrame.AnimFrame1.CreateButton.Text = err;
	wait(del);
	EzHub.ADDFrame.AnimFrame1.CreateButton.Text = "Create Script";
end

-- Updates the remove script frame so that only scripts that exist and can be deleted are shown.
local selectedToDelete;
local function updateRemoveScriptFrame()
	for i,v in pairs(EzHub.REMOVEFrame.AnimFrame1.Frame.ScrollingFrame:GetChildren()) do
		if v.Name == "RemoveContainer" or v.Name == "MessageContainer" then
			v:Destroy();
		end
	end
	local stat, err = pcall(function()
		for i,v in pairs(game:GetService("HttpService"):JSONDecode(readfile(localLibPathFile))) do
			local rcontainer = EzHub.SavedContainers.RemoveContainer:Clone();
			rcontainer.Parent = EzHub.REMOVEFrame.AnimFrame1.Frame.ScrollingFrame;
			rcontainer.Visible = true;
			rcontainer.Text = i;
			rcontainer.MouseButton1Click:Connect(function()
				selectedToDelete = rcontainer.Text;
				for i,v in pairs(EzHub.REMOVEFrame.AnimFrame1.Frame.ScrollingFrame:GetChildren()) do
					if v.Name == "RemoveContainer" then
						v.BorderSizePixel = 0;
					end
				end
				rcontainer.BorderSizePixel = 2;
			end)
		end
	end)
	local c = 0;
	for i,v in pairs(EzHub.REMOVEFrame.AnimFrame1.Frame.ScrollingFrame:GetChildren()) do
		if v.Name == "RemoveContainer" then c = c + 1; end
	end
	if c == 0 then
		EzHub.SavedContainers.MessageContainer:Clone().Parent = EzHub.REMOVEFrame.AnimFrame1.Frame.ScrollingFrame;
		EzHub.REMOVEFrame.AnimFrame1.Frame.ScrollingFrame:FindFirstChild("MessageContainer").Visible = true;
		if not stat then EzHub.REMOVEFrame.AnimFrame1.Frame.ScrollingFrame:FindFirstChild("MessageContainer").Text = "Incompatible Exploit"; end
	end
end

-----------------------------------------------
-- This section takes care of loading all saved local lib scripts

-- Local Lib Saves
-- If no file exists make a new one

local localLibPathFile = "EzHubLL.txt";
if not pcall(function() readfile(localLibPathFile); end) then 
	pcall(function() writefile(localLibPathFile, "{}"); end); 
end

-- Load Saved
pcall(function()
	for i,v in pairs(game:GetService("HttpService"):JSONDecode(readfile(localLibPathFile))) do
		addScript({
			["scriptName"] = i,
			["function"] = v,
			["parent"] = EzHub.LocalLibFrame.AnimFrame1
		});
	end
end)

updateRemoveScriptFrame();

-----------------------------------------------

-- This event handles the deletion of already existing scripts in the local lib
-- It handles saving and everything
EzHub.REMOVEFrame.AnimFrame1.Frame.RemoveButton.MouseButton1Click:Connect(function()
	if selectedToDelete then
		for i,v in pairs(EzHub.LocalLibFrame.AnimFrame1:GetChildren()) do
			if v.Name == "GameContainer" and v.Frame.GameName.Text == selectedToDelete then
				v:Destroy();
				break;
			end
		end

		updateLocalLibSaves();
		updateRemoveScriptFrame();

		EzHub.REMOVEFrame.AnimFrame1.Frame.RemoveButton.Text = "Script Removed"; wait(2);
		EzHub.REMOVEFrame.AnimFrame1.Frame.RemoveButton.Text = "Remove Script";

	else

		EzHub.REMOVEFrame.AnimFrame1.Frame.RemoveButton.Text = "No script selected"; wait(2);
		EzHub.REMOVEFrame.AnimFrame1.Frame.RemoveButton.Text = "Remove Script";

	end
end)

-- This event handles the actual creation of the script.
-- AKA: Checks if script is valid, adds script container, saves, updates etc...
EzHub.ADDFrame.AnimFrame1.CreateButton.MouseButton1Click:Connect(function()
	
	if not readfile and not writefile then showScriptCreationError("Incompatible Exploit"); return; end
	
	if EzHub.ADDFrame.AnimFrame1.Editor.EditorFrame.Source.Text == "" then showScriptCreationError("Invalid Source"); return; end
	if #EzHub.ADDFrame.AnimFrame1.Editor.EditorFrame.Source.Text > 400 then showScriptCreationError("Source too long"); return; end
	if EzHub.ADDFrame.AnimFrame1.Namer.ScriptNamer.Text == "" then showScriptCreationError("Invalid Name"); return; end
	if #EzHub.ADDFrame.AnimFrame1.Namer.ScriptNamer.Text > 25 then showScriptCreationError("Name too long"); return; end
	
	for i,v in pairs(EzHub.LocalLibFrame.AnimFrame1:GetChildren()) do
		if v.Name == "GameContainer" and v.Frame.GameName.Text == EzHub.ADDFrame.AnimFrame1.Namer.ScriptNamer.Text then
			showScriptCreationError("Duplicate Name"); return;
		end
	end
	
	addScript({
		["scriptName"] = EzHub.ADDFrame.AnimFrame1.Namer.ScriptNamer.Text,
		["function"] = EzHub.ADDFrame.AnimFrame1.Editor.EditorFrame.Source.Text,
		["parent"] = EzHub.LocalLibFrame.AnimFrame1
	});

	EzHub.ADDFrame.AnimFrame1.CreateButton.Text = "Created";
	wait(2);

	-- Reset everything to original state
	EzHub.ADDFrame.AnimFrame1.Editor.EditorFrame.Source.Text = "";
	EzHub.ADDFrame.AnimFrame1.Namer.ScriptNamer.Text = "";
	EzHub.ADDFrame.AnimFrame1.CreateButton.Text = "Create Script";

	updateLocalLibSaves();
	updateRemoveScriptFrame();

end)

-----------------------------------------------

-- Add Button and Remove Button Events and functionality

EzHub.ADDFrame.AnimFrame1.TestExecButton.MouseButton1Click:Connect(function()
	loadstring(EzHub.ADDFrame.AnimFrame1.Editor.EditorFrame.Source.Text)();
	EzHub.ADDFrame.AnimFrame1.TestExecButton.Text = "Executed";
	wait(2);
	EzHub.ADDFrame.AnimFrame1.TestExecButton.Text = "Test Execute";
end)

EzHub.LocalLibFrame.AnimFrame1.ADD.Frame.Trigger.MouseButton1Click:Connect(function()
	if navButtonDebounce == false then return end
	navButtonDebounce = false;

	openTab(EzHub.ADDFrame);
	if EzHub.NavFrame.Position.X.Scale ~= -.5 then HandleNavBtn(); end

	navButtonDebounce = true;
end)

EzHub.ADDFrame.AnimFrame1.BackButton.MouseButton1Click:Connect(function()
	if navButtonDebounce == false then return end
	navButtonDebounce = false;

	openTab(EzHub.LocalLibFrame);
	if EzHub.NavFrame.Position.X.Scale ~= -.5 then HandleNavBtn(); end

	navButtonDebounce = true;
end)

EzHub.LocalLibFrame.AnimFrame1.REMOVE.Frame.Trigger.MouseButton1Click:Connect(function()
	if navButtonDebounce == false then return end
	navButtonDebounce = false;

	openTab(EzHub.REMOVEFrame);
	if EzHub.NavFrame.Position.X.Scale ~= -.5 then HandleNavBtn(); end

	navButtonDebounce = true;
end)

EzHub.REMOVEFrame.AnimFrame1.Frame.BackButton.MouseButton1Click:Connect(function()
	if navButtonDebounce == false then return end
	navButtonDebounce = false;

	openTab(EzHub.LocalLibFrame);
	if EzHub.NavFrame.Position.X.Scale ~= -.5 then HandleNavBtn(); end

	navButtonDebounce = true;
end)

applyContainerSelectAnimation(EzHub.LocalLibFrame.AnimFrame1.ADD);
applyContainerSelectAnimation(EzHub.LocalLibFrame.AnimFrame1.REMOVE);

-------------------------------------------------------------------------------------------------

-- Toggle GUI
game:GetService("UserInputService").InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.RightControl then EzHub.EzHub.Enabled = not EzHub.EzHub.Enabled; end
end)

-------------------------------------------------------------------------------------------------

-- Draggability
-- This is the only function that is not made by me
-- No idea who made this as I had this code ages ago.

local function dragify(MainFrame)

	local dragging;
	local dragInput;
	local dragStart;
	local startPos;

	local function update(input)
		local Delta = input.Position - dragStart;
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y);
		game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(.25), {Position = Position}):Play();
	end

	MainFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true;
			dragStart = input.Position;
			startPos = MainFrame.Position;

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false;
				end
			end)
		end
	end)

	MainFrame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			dragInput = input;
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input);
		end
	end)
end

dragify(EzHub.MainFrame);
