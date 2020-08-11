# Ez-Hub
Best Roblox Script Hub.

Thank you for using Ez Hub. And thanks for checking out it's main obfuscated code hoping that it would be source. Jokes on you. Just kidding. I won't let you leave without anything.

Ez Hub 0.2 or 0.2 (I'm not too sure) Source Code:

-- Loading GUI
 
local function CreateInstance(cls,props)
local inst = Instance.new(cls)
for i,v in pairs(props) do
	inst[i] = v
end
return inst
end
	
local LoadingEzHubGUI = CreateInstance('ScreenGui',{DisplayOrder=0,Enabled=true,ResetOnSpawn=true,Name='LoadingEzHubGUI', Parent=game.CoreGui})
local MainFrame = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.282353, 0.282353, 0.282353),BackgroundTransparency=0.20000000298023,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(-0.23385416, 0, 0.329238325, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 496, 0, 277),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'MainFrame',Parent = LoadingEzHubGUI})
local EzModsLogo = CreateInstance('ImageLabel',{Image='rbxassetid://4884056983',ImageColor3=Color3.new(1, 1, 1),ImageRectOffset=Vector2.new(0, 0),ImageRectSize=Vector2.new(0, 0),ImageTransparency=0,ScaleType=Enum.ScaleType.Stretch,SliceCenter=Rect.new(0, 0, 0, 0),Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.215725809, 0, 0.205776185, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 282, 0, 163),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='EzModsLogo',Parent = MainFrame})
local TitleGUI = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size24,Text='Ez Hub',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=20,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.211765, 0.211765, 0.211765),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.0216606855, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 496, 0, 34),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='TitleGUI',Parent = MainFrame})
local StatusGUI = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Loading Assets...',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.211765, 0.211765, 0.211765),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.84837544, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 496, 0, 28),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='StatusGUI',Parent = MainFrame})

-- Fake Loading ( lol )

MainFrame:TweenPosition(UDim2.new(0.5, -248, 0.5, -135.5), Enum.EasingDirection.Out)

function spinlogo()
	EzModsLogo.Rotation = EzModsLogo.Rotation + 0.3
end

function SpinTheLogo()
	for count = 1, 40 do
		spinlogo()
		wait()
	end
end


SpinTheLogo()
StatusGUI.Text = "Downloading Scripts..."
SpinTheLogo()
StatusGUI.Text = "Verifying Version..."
SpinTheLogo()
StatusGUI.Text = "Successfully Loaded Ez Hub" 

repeat
EzModsLogo.ImageTransparency = EzModsLogo.ImageTransparency + 0.01
MainFrame.BackgroundTransparency = MainFrame.BackgroundTransparency + 0.01
EzModsLogo.BackgroundTransparency = EzModsLogo.BackgroundTransparency + 0.01
StatusGUI.BackgroundTransparency = StatusGUI.BackgroundTransparency + 0.01
TitleGUI.BackgroundTransparency = TitleGUI.BackgroundTransparency + 0.01
TitleGUI.TextTransparency = TitleGUI.TextTransparency + 0.01
StatusGUI.TextTransparency = StatusGUI.TextTransparency + 0.01
wait()
until StatusGUI.BackgroundTransparency >= 1

-- Ez Hub GUI

local function CreateInstance(cls,props)
local inst = Instance.new(cls)
for i,v in pairs(props) do
	inst[i] = v
end
return inst
end
	
local EzHub = CreateInstance('ScreenGui',{DisplayOrder=0,Enabled=true,ResetOnSpawn=true,Name='EzHub', Parent=game.CoreGui})
local MinimizeOpenerGUI = CreateInstance('ImageButton',{Image='http://www.roblox.com/asset/?id=4884056983',ImageColor3=Color3.new(1, 1, 1),ImageRectOffset=Vector2.new(0, 0),ImageRectSize=Vector2.new(0, 0),ImageTransparency=0,ScaleType=Enum.ScaleType.Crop,SliceCenter=Rect.new(0, 0, 0, 0),AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(-0.0109374998, 0, -0.00856485963, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 126, 0, 106),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='MinimizeOpenerGUI',Parent = EzHub})
local MainFrame = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.564706, 0.564706, 0.564706),BackgroundTransparency=0.20000000298023,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=5,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.306166142, 0, 0.227719694, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 744, 0, 442),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'MainFrame',Parent = EzHub})
local HomeTab = CreateInstance('ScrollingFrame',{BottomImage='rbxasset://textures/ui/Scroll/scroll-bottom.png',CanvasPosition=Vector2.new(0, 0),CanvasSize=UDim2.new(0, 0, 2, 0),MidImage='rbxasset://textures/ui/Scroll/scroll-middle.png',ScrollBarThickness=12,ScrollingEnabled=true,TopImage='rbxasset://textures/ui/Scroll/scroll-top.png',Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.737255, 0.737255, 0.737255),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=2,ClipsDescendants=true,Draggable=false,Position=UDim2.new(0.276881635, 0, 0.196832582, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 516, 0, 336),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='HomeTab',Parent = MainFrame})
local TitleHome = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size28,Text='Ez Mods',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=25,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.152941, 0.152941, 0.152941),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.0234970301, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 50),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='TitleHome',Parent = HomeTab})
local InfoLine1Home = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Welcome to Ez Hub. Ez Hub is currently in Alpha and still has major glitches. Many more scripts',TextColor3=Color3.new(0, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.541176, 0.541176, 0.541176),BackgroundTransparency=0,BorderColor3=Color3.new(0.729412, 0.729412, 0.729412),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.102561519, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 25),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='InfoLine1Home',Parent = HomeTab})
local InforLine2Home = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='are yet to come. Newly added Scripts will be shown in the changeolog below.',TextColor3=Color3.new(0, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.541176, 0.541176, 0.541176),BackgroundTransparency=0,BorderColor3=Color3.new(0.729412, 0.729412, 0.729412),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.129010469, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 27),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='InforLine2Home',Parent = HomeTab})
local LinkTitleHome = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Links',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.203922, 0.203922, 0.203922),BackgroundTransparency=0,BorderColor3=Color3.new(0.729412, 0.729412, 0.729412),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.181046665, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 27),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='LinkTitleHome',Parent = HomeTab})
local DiscordHome = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Discord Link: https://discord.gg/mEcRWvr',TextColor3=Color3.new(0, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.541176, 0.541176, 0.541176),BackgroundTransparency=0,BorderColor3=Color3.new(0.729412, 0.729412, 0.729412),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.225164324, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 27),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='DiscordHome',Parent = HomeTab})
local WebsiteHome = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Roblox Script Website: Tiny.cc/RobloxEzMods',TextColor3=Color3.new(0, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.541176, 0.541176, 0.541176),BackgroundTransparency=0,BorderColor3=Color3.new(0.729412, 0.729412, 0.729412),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.262494653, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 27),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='WebsiteHome',Parent = HomeTab})
local ChangeologTitleHome = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Changeolog',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.203922, 0.203922, 0.203922),BackgroundTransparency=0,BorderColor3=Color3.new(0.729412, 0.729412, 0.729412),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.31113717, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 27),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ChangeologTitleHome',Parent = HomeTab})
local Changeolog1Home = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='The changeolog has been moved to the Discord Server.',TextColor3=Color3.new(0, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.541176, 0.541176, 0.541176),BackgroundTransparency=0,BorderColor3=Color3.new(0.729412, 0.729412, 0.729412),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(-0.0116279069, 0, 0.350729942, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 27),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='Changeolog1Home',Parent = HomeTab})
local OtherLinksHome = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Other Links',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.203922, 0.203922, 0.203922),BackgroundTransparency=0,BorderColor3=Color3.new(0.729412, 0.729412, 0.729412),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.395978808, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 27),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='OtherLinksHome',Parent = HomeTab})
local GTAWebHome = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='We also provide GTA V modding services.',TextColor3=Color3.new(0, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.541176, 0.541176, 0.541176),BackgroundTransparency=0,BorderColor3=Color3.new(0.729412, 0.729412, 0.729412),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.440096468, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 27),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='GTAWebHome',Parent = HomeTab})
local GtaLinkHome = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='GTA Website: Tiny.cc/GTAEzMods',TextColor3=Color3.new(0, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.541176, 0.541176, 0.541176),BackgroundTransparency=0,BorderColor3=Color3.new(0.729412, 0.729412, 0.729412),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.470639467, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 27),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='GtaLinkHome',Parent = HomeTab})
local RepostedScripts = CreateInstance('ScrollingFrame',{BottomImage='rbxasset://textures/ui/Scroll/scroll-bottom.png',CanvasPosition=Vector2.new(0, 0),CanvasSize=UDim2.new(0, 0, 2, 0),MidImage='rbxasset://textures/ui/Scroll/scroll-middle.png',ScrollBarThickness=12,ScrollingEnabled=true,TopImage='rbxasset://textures/ui/Scroll/scroll-top.png',Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.737255, 0.737255, 0.737255),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=true,Draggable=false,Position=UDim2.new(0.276881695, 0, 0.192307651, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 516, 0, 336),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='RepostedScripts',Parent = MainFrame})
local JailbreakGUIButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Jailbreak GUI',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0620155036, 0, 0.0135746608, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='JailbreakGUIButton',Parent = RepostedScripts})
local JailbreakAutoRobButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Jailbreak Auto-Rob',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0620155036, 0, 0.0701357499, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='JailbreakAutoRobButton',Parent = RepostedScripts})
local AntiAFKButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Anti-AFK Script',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0620155036, 0, 0.128959283, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='AntiAFKButton',Parent = RepostedScripts})
local LumberTycoonHackButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Lumber Tycoon 2 Script',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0620155036, 0, 0.185520366, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='LumberTycoonHackButton',Parent = RepostedScripts})
local BluxHuntHackButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='BloxHunt Script',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.061999999, 0, 0.239999995, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='BluxHuntHackButton',Parent = RepostedScripts})
local PrisonLifeButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Prison Life Script',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0620155036, 0, 0.297511309, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='PrisonLifeButton',Parent = RepostedScripts})
local RedwoodPrisonScriptGUI = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Redwood Prison Script',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0620155036, 0, 0.355203629, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='RedwoodPrisonScriptGUI',Parent = RepostedScripts})
local MadcityButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='MadCity GUI',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0599999987, 0, 0.412499994, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='MadcityButton',Parent = RepostedScripts})
local FleetheFacilityButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Flee the Facility GUI',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.061999999, 0, 0.469999999, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='FleetheFacilityButton',Parent = RepostedScripts})
local GUITitle = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size36,Text='Ez Hub',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=35,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0.10000000149012,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.0407239832, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 744, 0, 50),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='GUITitle',Parent = MainFrame})
local OtherHubs = CreateInstance('ScrollingFrame',{BottomImage='rbxasset://textures/ui/Scroll/scroll-bottom.png',CanvasPosition=Vector2.new(0, 0),CanvasSize=UDim2.new(0, 0, 2, 0),MidImage='rbxasset://textures/ui/Scroll/scroll-middle.png',ScrollBarThickness=12,ScrollingEnabled=true,TopImage='rbxasset://textures/ui/Scroll/scroll-top.png',Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.737255, 0.737255, 0.737255),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=true,Draggable=false,Position=UDim2.new(0.276881754, 0, 0.19230774, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 516, 0, 336),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='OtherHubs',Parent = MainFrame})
local PotatoHubButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Potato Hub',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0620155036, 0, 0.0169683285, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='PotatoHubButton',Parent = OtherHubs})
local AuratusHUbButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Auratus Hub',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0600775182, 0, 0.0746606365, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='AuratusHUbButton',Parent = OtherHubs})
local CloseGUI = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='X',TextColor3=Color3.new(0.976471, 1, 0.972549),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.254902, 0.254902, 0.254902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='CloseGUI',Parent = MainFrame})
local EzModScripts = CreateInstance('ScrollingFrame',{BottomImage='rbxasset://textures/ui/Scroll/scroll-bottom.png',CanvasPosition=Vector2.new(0, 0),CanvasSize=UDim2.new(0, 0, 2, 0),MidImage='rbxasset://textures/ui/Scroll/scroll-middle.png',ScrollBarThickness=12,ScrollingEnabled=true,TopImage='rbxasset://textures/ui/Scroll/scroll-top.png',Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.737255, 0.737255, 0.737255),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=true,Draggable=false,Position=UDim2.new(0.276881516, 0, 0.194570154, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 516, 0, 336),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='EzModScripts',Parent = MainFrame})
local InvisibleButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Invisible Script',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0620155036, 0, 0.0169430953, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='InvisibleButton',Parent = EzModScripts})
local AntiRacismButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Anti-Racism Script',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0620155036, 0, 0.130065262, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='AntiRacismButton',Parent = EzModScripts})
local RocitizensHackButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Rocitizens Unlimited Money',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0620155036, 0, 0.0746354014, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='RocitizensHackButton',Parent = EzModScripts})
local VisibleButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Invisible/Visible Script',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0620155036, 0, 0.186626345, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='VisibleButton',Parent = EzModScripts})
local NoClipButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Simple NoClip Script',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0620155036, 0, 0.243187428, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='NoClipButton',Parent = EzModScripts})
local TpToolButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Teleport Tool Script',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0639534891, 0, 0.300879717, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='TpToolButton',Parent = EzModScripts})
local WalkspeedJumpPowerButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Walkspeed and JumpPower Script',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.061999999, 0, 0.35800001, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='WalkspeedJumpPowerButton',Parent = EzModScripts})
local GravityHackButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Gravity Script',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0600620136, 0, 0.414561093, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='GravityHackButton',Parent = EzModScripts})
local FlyScriptButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Fly Mode Script',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.34902, 0.34902, 0.34902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=3,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0599999987, 0, 0.470999986, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 452, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='FlyScriptButton',Parent = EzModScripts})
local MinimizeGUI = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size32,Text='-',TextColor3=Color3.new(0.976471, 1, 0.972549),TextScaled=false,TextSize=30,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.254902, 0.254902, 0.254902),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0241935477, 0, 0, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 18, 0, 18),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='MinimizeGUI',Parent = MainFrame})
local InfoFrame = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.564706, 0.564706, 0.564706),BackgroundTransparency=0.20000000298023,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=5,ClipsDescendants=false,Draggable=false,Position=UDim2.new(-0.000285476446, 0, 1.01687658, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 744, 0, 36),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'InfoFrame',Parent = MainFrame})
local InfoDisplay = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Label',TextColor3=Color3.new(0.764706, 0.458824, 0.0862745),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.207843, 0.207843, 0.207843),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 744, 0, 36),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='InfoDisplay',Parent = InfoFrame})
local Tabs = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.313726, 0.313726, 0.313726),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=2,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0241935477, 0, 0.194709122, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 163, 0, 336),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'Tabs',Parent = MainFrame})
local EzModButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Ez Mod Scripts',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.168627, 0.168627, 0.168627),BackgroundTransparency=0,BorderColor3=Color3.new(0, 0, 0),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0869565234, 0, 0.1875, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 132, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='EzModButton',Parent = Tabs})
local Home = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Home',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.168627, 0.168627, 0.168627),BackgroundTransparency=0,BorderColor3=Color3.new(0, 0, 0),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0869565234, 0, 0.0416666567, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 132, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='Home',Parent = Tabs})
local OtherHubButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Other Hubs',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.168627, 0.168627, 0.168627),BackgroundTransparency=0,BorderColor3=Color3.new(0, 0, 0),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0869565234, 0, 0.491071463, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 132, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='OtherHubButton',Parent = Tabs})
local RepostedScriptsButton = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size18,Text='Other Scripts',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=16,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.168627, 0.168627, 0.168627),BackgroundTransparency=0,BorderColor3=Color3.new(0, 0, 0),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.0869565234, 0, 0.339285672, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 132, 0, 38),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='RepostedScriptsButton',Parent = Tabs})
local SettingsImageButton = CreateInstance('ImageButton',{Image='http://www.roblox.com/asset/?id=1946198403',ImageColor3=Color3.new(1, 1, 1),ImageRectOffset=Vector2.new(0, 0),ImageRectSize=Vector2.new(0, 0),ImageTransparency=0,ScaleType=Enum.ScaleType.Stretch,SliceCenter=Rect.new(0, 0, 0, 0),AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.981182814, 0, -5.05404241e-05, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 14, 0, 16),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='SettingsImageButton',Parent = MainFrame})
local SettingsFrame = CreateInstance('ScrollingFrame',{BottomImage='rbxasset://textures/ui/Scroll/scroll-bottom.png',CanvasPosition=Vector2.new(0, 0),CanvasSize=UDim2.new(0, 0, 2, 0),MidImage='rbxasset://textures/ui/Scroll/scroll-middle.png',ScrollBarThickness=12,ScrollingEnabled=true,TopImage='rbxasset://textures/ui/Scroll/scroll-top.png',Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.737255, 0.737255, 0.737255),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=true,Draggable=false,Position=UDim2.new(0.276881725, 0, 0.196832597, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 516, 0, 336),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='SettingsFrame',Parent = MainFrame})
local TitleSettings = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size28,Text='Ez Hub Settings',TextColor3=Color3.new(0, 0, 0),TextScaled=false,TextSize=25,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.588235, 0.588235, 0.588235),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=2,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 515, 0, 50),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='TitleSettings',Parent = SettingsFrame})
local ThemesTitleSettings = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Themes',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.156863, 0.156863, 0.156863),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.0721051469, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 30),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ThemesTitleSettings',Parent = SettingsFrame})
local CustomThemeTitleSettings = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Custom Theme',TextColor3=Color3.new(0, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.588235, 0.588235, 0.588235),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.106041804, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 30),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='CustomThemeTitleSettings',Parent = SettingsFrame})
local DefaultThemeTitleSettings = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Default Theme',TextColor3=Color3.new(0, 0, 0),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.588235, 0.588235, 0.588235),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.276856303, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 30),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='DefaultThemeTitleSettings',Parent = SettingsFrame})
local ApplyCustomThemeButtonSettings = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Apply Custom theme',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.196078, 0.196078, 0.196078),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=2,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.222271323, 0, 0.224945694, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 288, 0, 33),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ApplyCustomThemeButtonSettings',Parent = SettingsFrame})
local OriginalThemeButtonSettings = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Back to Original Theme',TextColor3=Color3.new(0.980392, 0.980392, 0.980392),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.196078, 0.196078, 0.196078),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=2,ClipsDescendants=false,Draggable=false,Position=UDim2.new(-2.36570372e-07, 0, 0.328668356, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 516, 0, 35),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='OriginalThemeButtonSettings',Parent = SettingsFrame})
local ScriptsTitleSettings = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Setting Scripts',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.156863, 0.156863, 0.156863),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.391109675, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 516, 0, 30),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ScriptsTitleSettings',Parent = SettingsFrame})
local FPSButtonSettings = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Show FPS and Ping',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.196078, 0.196078, 0.196078),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=2,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.222271323, 0, 0.443271488, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 288, 0, 33),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='FPSButtonSettings',Parent = SettingsFrame})
local FreecamButtonSettings = CreateInstance('TextButton',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Freecam Mode',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.196078, 0.196078, 0.196078),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=2,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.222271323, 0, 0.499832571, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 288, 0, 33),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='FreecamButtonSettings',Parent = SettingsFrame})
local ThemeCustomInputFieldSettings = CreateInstance('TextBox',{ClearTextOnFocus=true,Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,MultiLine=false,Text='Click to Type...     Example: 80, 80, 80',TextColor3=Color3.new(1, 1, 1), PlaceholderText='', PlaceholderColor3=Color3.new(0.7, 0.7, 0.7),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(0.219608, 0.219608, 0.219608),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.154941559, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 516, 0, 50),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='ThemeCustomInputFieldSettings',Parent = SettingsFrame})

-- Notification of Startup

game.StarterGui:SetCore("SendNotification", {
    Title = "Ez Hub";
    Text = "Ez Hub loaded successfully. Enjoy!";
    Duration = 6;
})

-- Start up things
-- Tabs

InfoDisplay.Text = "Hover over a button to get a brief explanation of its uses..."
HomeTab.Visible = true
RepostedScripts.Visible = false
EzModScripts.Visible = false
OtherHubs.Visible = false
SettingsFrame.Visible = false

-- Minimize GUI Script

MinimizeOpenerGUI.Visible = false
MinimizeGUI.MouseButton1Click:Connect(function()
	MainFrame:TweenPosition(UDim2.new(-1, 0, -1, 0), Enum.EasingDirection.In)
	wait(0.5)
	MinimizeOpenerGUI.Visible = true
end)
MinimizeOpenerGUI.MouseButton1Click:Connect(function()
	MainFrame:TweenPosition(UDim2.new(0.5, -372, 0.5, -221), Enum.EasingDirection.Out)
	MinimizeOpenerGUI.Visible = false
end)
MinimizeGUI.MouseEnter:Connect(function()
	InfoDisplay.Text = "Minimize the Hub/GUI. It can be reopened by pressing the button at the top left which will appear after minimizing."
end)

-- Close Main GUI Script (Destroys GUI meaning it has to be rexecuted for further use) + Information Lable Script

CloseGUI.MouseButton1Click:Connect(function()
	EzHub:Destroy()
end) 
CloseGUI.MouseEnter:Connect(function()
	InfoDisplay.Text = "Close the GUI. To reopen, you must re execute because this button destroys the GUI"
end)

-- Draggabality of Main GUI
MainFrame.Active = true
MainFrame.Draggable = true

-- Tabs opening and closing + Information Lable Script

---------------------------------------------------------------------

SettingsImageButton.MouseButton1Click:Connect(function()
	SettingsFrame.Visible = true
	HomeTab.Visible = false
	RepostedScripts.Visible = false
	EzModScripts.Visible = false
	OtherHubs.Visible = false
end)
SettingsImageButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "Shows the settings tab of the hub. You will have options to change the color of the hub and use scripts such as: Freecam mode and a FPS and Ping displayer."
end)

---------------------------------------------------------------------

Home.MouseButton1Click:Connect(function()
	SettingsFrame.Visible = false
	HomeTab.Visible = true
	RepostedScripts.Visible = false
	EzModScripts.Visible = false
	OtherHubs.Visible = false
end)
Home.MouseEnter:Connect(function()
	InfoDisplay.Text = "Home - Changeolog, Credits and Links are all provided in this tab"
end)

---------------------------------------------------------------------

EzModButton.MouseButton1Click:connect(function()
	SettingsFrame.Visible = false
	EzModScripts.Visible = true
	HomeTab.Visible = false
	RepostedScripts.Visible = false
	OtherHubs.Visible = false
end)
EzModButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "Ez Mod Scripts - Comes with all the scripts that are originally made by Ez Mods"
end)

---------------------------------------------------------------------

RepostedScriptsButton.MouseButton1Click:connect(function()
	SettingsFrame.Visible = false
	EzModScripts.Visible = false
	HomeTab.Visible = false
	RepostedScripts.Visible = true
	OtherHubs.Visible = false
end)
RepostedScriptsButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "Other Scripts - Scripts that are not made by Ez Mods are posted here. This section includes scripts made by other people"
end)

---------------------------------------------------------------------

OtherHubButton.MouseButton1Click:Connect(function()
	SettingsFrame.Visible = false
	EzModScripts.Visible = false
	HomeTab.Visible = false
	RepostedScripts.Visible = false
	OtherHubs.Visible = true
end)
OtherHubButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "Other Hubs - This section of Ez Hub includes some other impressive hubs made by other people"
end)


-- Setting Tingz
 
ApplyCustomThemeButtonSettings.MouseButton1Click:Connect(function()
	local CustomTheme = ThemeCustomInputFieldSettings.Text
	Tabs.BackgroundColor3 = Color3.new(CustomTheme)
end)
ApplyCustomThemeButtonSettings.MouseEnter:Connect(function()
	InfoDisplay.Text = "Apply Custom Theme. Make sure to only have numbers and commas seperating them in the Input field otherwise Oof."
end)

OriginalThemeButtonSettings.MouseButton1Click:Connect(function()
	Tabs.BackgroundColor3 = Color3.new(80,80,80)
end)
OriginalThemeButtonSettings.MouseEnter:Connect(function()
	InfoDisplay.Text = "Return Back to Original Theme"
end)

---------------------------------------------------------------------

-- [--------------------------------SCRIPTS--------------------------------]

-- Settings Scripts
-- FPS Displayer + PING

FPSButtonSettings.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/kZVuvcEX'),true))()
end)
FPSButtonSettings.MouseEnter:Connect(function()
	InfoDisplay.Text = "Displays FPS and Ping."
end)

-- Freecam Mode

FreecamButtonSettings.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/qjjbMWFx'),true))()
end)
FreecamButtonSettings.MouseEnter:Connect(function()
	InfoDisplay.Text = "Enters Freecam mode. Useful for shooting videos or spectating friend. does not bring character with the camera."
end)

-- EZ MODS SCRIPTS

-- Fly Script

FlyScriptButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/jPzM0MqE'),true))()
end)
FlyScriptButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "Gives you the ability to fly. Press E to activate and deactive fly mode."
end)

-- Gravity Hack Script

GravityHackButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/n3LBshNG'),true))()
end)
GravityHackButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "A local script that changes the gravity (ONLY FOR YOU). Similiar to JumpPower but instead its gravity."
end)

-- WalkSpeed and JumpPower Script

WalkspeedJumpPowerButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/7mppQL06'),true))()
end)
WalkspeedJumpPowerButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "Very good Speed and JumpPower Script. Bypasses basic anti exploits."
end)

-- Anti-Racism Script

AntiRacismButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/HFTLcATg '),true))()
end)
AntiRacismButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "A simple script where it checks your character's skin color and kick if the N word is said accordingly."
end)

-- Invisibility Script

InvisibleButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/fngSGVQR '),true))() 
end)
InvisibleButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "This script will make you invisible to other people. You will not be invisible on your screen."
end)

-- Rocitizens Script

RocitizensHackButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/qkK8XkgX '),true))()
end)
RocitizensHackButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "Gives you unlimited money in the game, Rocitizens."
end)

-- Visible/invisible Objects in Workspace Script

VisibleButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/X3J5s87S '),true))()
end)
VisibleButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "Makes all items in the workspace invisible/visible. Does not work on Decals."
end)

-- NoClip Script

NoClipButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/KZFAFDTu '),true))() 
end)
NoClipButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "A very basic NoClip Script which allows your character to go through walls. Does not work on games with advanced anti-exploit."
end)

-- Teleport tool Script

TpToolButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/q0k8ZqF2'),true))()	
end)
TpToolButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "Gives you a tool which can be used to teleport to places with one click of a button"
end)


--REPOSTED SCRIPTS

-- Flee the Facility Script

FleetheFacilityButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastebin.com/raw/mFnVACZ1",true))()
end)
FleetheFacilityButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "Simple Flee the Facility GUI. Provides teleports to computers, ESP, speed, player teleports and much more."
end)

-- Madcity GUI Script

MadcityButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://system-exodus.com/scripts/madlads/MadLads.lua",true))()
end)
MadcityButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "GUI made for Madcity. Very OP. Please dont bully children with this GUI."
end)

-- Anti-Afk Script

AntiAFKButton.MouseButton1Click:Connect(function()
	local vu = game:GetService("VirtualUser")

game:GetService("Players").LocalPlayer.Idled:connect(function()

   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

   wait(1)

   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

end)
end)
AntiAFKButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "Upon execution, the script will automatically kick into action and disable AFK kick from the game"
end)

-- Jailbreak GUI script

JailbreakGUIButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(("https://fluxteam.xyz/scripts/fluxbreak/fluxbreak.lua"), true))()
end)
JailbreakGUIButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "OP updated Jailbreak GUI. All options work including teleport options. Super OP!"
end)

-- Jailbreak Auto-Rob Script

JailbreakAutoRobButton.MouseButton1Click:Connect(function()
	loadstring(game:GetObjects("rbxassetid://1461971147")[1].Source)()
end)
JailbreakAutoRobButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "Advanced Auto rob. Very efficient. Supports: Bank, Jewlery, Plane, Train, Museum and Airdrops"
end)

-- Lumber Tycoon 2 Script

LumberTycoonHackButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastebin.com/raw/7xuxdTL9", true))()
end)
LumberTycoonHackButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "This script is a GUI that is packed with the best GUIs in Lumber Tycoon 2. It is like a GUI package for Lumber Tycoon."
end)

-- BloxHunt Script

BluxHuntHackButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastebin.com/raw/qjKa5KNn", true))()
end)
BluxHuntHackButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "This Bloxhunt script comes packed with unlock all gamepasses, infinite money, ESP and many more options"
end)

-- Redwood Prison Script

RedwoodPrisonScriptGUI.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastebin.com/raw/p1UQV7Kr", true))()
end)
RedwoodPrisonScriptGUI.MouseEnter:Connect(function()
	InfoDisplay.Text = "Detailed GUI made for Redwood Prison. Gives guns and has teleport options."
end)


--Prison Life Script

PrisonLifeButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastebin.com/raw/6P3JAZMQ", true))()
end)
PrisonLifeButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "High quality Prison Life GUI. Comes with all the options you would expect a prison life GUI to have."
end)

-- OTHER HUB SCRIPTS

-- Potato Hub Script

PotatoHubButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet(('https://www.potato-hub.com/PotatoHub.lua'),true))()
end)
PotatoHubButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "Potato hub is a very similiar Hub to Ez Hub but with many more feautures. It is also free!"
end)

-- Auratus Hub Script

AuratusHUbButton.MouseButton1Click:Connect(function()
	_G.Toggle_GUI = "z" -- keybind to open/close gui

return(function(i,a,a)local k=string.char;local e=string.sub;local p=table.concat;local m=math.ldexp;local n=getfenv or function()return _ENV end;local l=select;local g=unpack or table.unpack;local j=tonumber;local function o(h)local b,c,g="","",{}local d=256;local f={}for a=0,d-1 do f[a]=k(a)end;local a=1;local function i()local b=j(e(h,a,a),36)a=a+1;local c=j(e(h,a,a+b-1),36)a=a+b;return c end;b=k(i())g[1]=b;while a<#h do local a=i()if f[a]then c=f[a]else c=b..e(b,1,1)end;f[d]=b..e(c,1,1)g[#g+1],b,d=c,c,d+1 end;return table.concat(g)end;local j=o('1Z2102752101W27621V21X22121T21021827623122F22W22321X21S21T21S27727622B21X22522821325A25927X27X24D1R21021A27622027K21S22F22822E22522221V21027427523022822822C22R21T2282101527622428I22C22F1U1B1B22C21X28821T21Y28B1A21Z2232211B22E21X22B1B22128923A2381L2301L27621021J27621I2162762112761421H29K21021227527F27529X29X1Y1X2761Y21029R2751W2152A52A72772AB27528329R29O27621329N27829R2782AC2A02AD2AA29V2AI29P2752A427521I29R2B129S2752B22A621I2752AL28F29K2AN29V2AS2BD29K29X2AU2AD2BI276');local a=(bit or bit32);local d=a and a.bxor or function(a,b)local c,d,e=1,0,10 while a>0 and b>0 do local e,f=a%2,b%2 if e~=f then d=d+c end a,b,c=(a-e)/2,(b-f)/2,c*2 end if a<b then a=b end while a>0 do local b=a%2 if b>0 then d=d+c end a,c=(a-b)/2,c*2 end return d end local function c(c,a,b)if b then local a=(c/2^(a-1))%2^((b-1)-(a-1)+1);return a-a%1;else local a=2^(a-1);return(c%(a+a)>=a)and 1 or 0;end;end;local a=1;local function b()local c,b,f,e=i(j,a,a+3);c=d(c,36)b=d(b,36)f=d(f,36)e=d(e,36)a=a+4;return(e*16777216)+(f*65536)+(b*256)+c;end;local function h()local b=d(i(j,a,a),36);a=a+1;return b;end;local function f()local b,c=i(j,a,a+2);b=d(b,36)c=d(c,36)a=a+2;return(c*256)+b;end;local function o()local a=b();local b=b();local e=1;local d=(c(b,1,20)*(2^32))+a;local a=c(b,21,31);local b=((-1)^c(b,32));if(a==0)then if(d==0)then return b*0;else a=1;e=0;end;elseif(a==2047)then return(d==0)and(b*(1/0))or(b*(0/0));end;return m(b,a-1023)*(e+(d/(2^52)));end;local m=b;local function q(b)local c;if(not b)then b=m();if(b==0)then return'';end;end;c=e(j,a,a+b-1);a=a+b;local b={}for a=1,#c do b[a]=k(d(i(e(c,a,a)),36))end return p(b);end;local a=b;local function m(...)return{...},l('#',...)end local function j()local k={};local e={};local a={};local i={[#{"1 + 1 = 111";"1 + 1 = 111";}]=e,[#{"1 + 1 = 111";{891;698;10;235};"1 + 1 = 111";}]=nil,[#{{820;906;255;644};"1 + 1 = 111";"1 + 1 = 111";"1 + 1 = 111";}]=a,[#{{183;470;887;617};}]=k,};local a=b()local d={}for c=1,a do local b=h();local a;if(b==1)then a=(h()~=0);elseif(b==3)then a=o();elseif(b==0)then a=q();end;d[c]=a;end;for a=1,b()do e[a-1]=j();end;for i=1,b()do local a=h();if(c(a,1,1)==0)then local e=c(a,2,3);local g=c(a,4,6);local a={f(),f(),nil,nil};if(e==0)then a[3]=f();a[4]=f();elseif(e==1)then a[3]=b();elseif(e==2)then a[3]=b()-(2^16)elseif(e==3)then a[3]=b()-(2^16)a[4]=f();end;if(c(g,1,1)==1)then a[2]=d[a[2]]end if(c(g,2,2)==1)then a[3]=d[a[3]]end if(c(g,3,3)==1)then a[4]=d[a[4]]end k[i]=a;end end;i[3]=h();return i;end;local function o(a,b,k)a=(a==true and j())or a;return(function(...)local f=a[1];local d=a[3];local a=a[2];local j=m local c=1;local e=-1;local m={};local h={...};local i=l('#',...)-1;local a={};local b={};for a=0,i do if(a>=d)then m[a-d]=h[a+1];else b[a]=h[a+#{"1 + 1 = 111";}];end;end;local a=i-d+1 local a;local d;while true do a=f[c];d=a[1];if d<=11 then if d<=5 then if d<=2 then if d<=0 then c=a[3];elseif d>1 then local c=a[2]local d,a=j(b[c](g(b,c+1,a[3])))e=a+c-1 local a=0;for c=c,e do a=a+1;b[c]=d[a];end;else local h;local l,m;local i;local d;b[a[2]]=k[a[3]];c=c+1;a=f[c];d=a[2];i=b[a[3]];b[d+1]=i;b[d]=i[a[4]];c=c+1;a=f[c];b[a[2]]=a[3];c=c+1;a=f[c];b[a[2]]=(a[3]~=0);c=c+1;a=f[c];d=a[2]l,m=j(b[d](g(b,d+1,a[3])))e=m+d-1 h=0;for a=d,e do h=h+1;b[a]=l[h];end;c=c+1;a=f[c];d=a[2]b[d]=b[d](g(b,d+1,e))c=c+1;a=f[c];b[a[2]]();c=c+1;a=f[c];do return end;end;elseif d<=3 then b[a[2]]();elseif d==4 then b[a[2]]=a[3];else if b[a[2]]then c=c+1;else c=a[3];end;end;elseif d<=8 then if d<=6 then local a=a[2]b[a](b[a+1])elseif d>7 then local a=a[2]b[a]=b[a](b[a+1])else local a=a[2]b[a]=b[a](g(b,a+1,e))end;elseif d<=9 then local a=a[2]b[a](b[a+1])elseif d==10 then if b[a[2]]then c=c+1;else c=a[3];end;else b[a[2]]=(a[3]~=0);end;elseif d<=17 then if d<=14 then if d<=12 then b[a[2]]=k[a[3]];elseif d>13 then b[a[2]]=k[a[3]];else c=a[3];end;elseif d<=15 then do return end;elseif d==16 then local c=a[2]local d,a=j(b[c](g(b,c+1,a[3])))e=a+c-1 local a=0;for c=c,e do a=a+1;b[c]=d[a];end;else local d=a[2];local c=b[a[3]];b[d+1]=c;b[d]=c[a[4]];end;elseif d<=20 then if d<=18 then local c=a[2];local d=b[a[3]];b[c+1]=d;b[c]=d[a[4]];elseif d>19 then do return end;else local a=a[2]b[a]=b[a](g(b,a+1,e))end;elseif d<=22 then if d>21 then b[a[2]]=(a[3]~=0);else local a=a[2]b[a]=b[a](b[a+1])end;elseif d==23 then b[a[2]]=a[3];else b[a[2]]();end;c=c+1;end;end);end;return o(true,{},n())();end)(string.byte,table.insert,setmetatable);

end)
AuratusHUbButton.MouseEnter:Connect(function()
	InfoDisplay.Text = "Auratus is a very similiar Hub to Ez Hub but with many more feautures. It is also free!"
end)
