local ScreenGui = Instance.new("ScreenGui")
local IntroPanel = Instance.new("Frame")
local IntroTextLabel = Instance.new("TextLabel")
local Icon = Instance.new("ImageLabel")
local Window = Instance.new("Frame")
local Panel = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local LeftSidePanel = Instance.new("Frame")
local TabButton = Instance.new("TextButton")
local TabIcon = Instance.new("ImageLabel")
local MainPanel = Instance.new("Frame")
local Button = Instance.new("TextButton")
local ButtonIcon = Instance.new("ImageLabel")
local Frame = Instance.new("Frame")
local RobloxProfile = Instance.new("ImageLabel")
local RobloxName = Instance.new("TextLabel")

-- Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

IntroPanel.Name = "IntroPanel"
IntroPanel.Parent = ScreenGui
IntroPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
IntroPanel.BackgroundTransparency = 1.000
IntroPanel.BorderColor3 = Color3.fromRGB(0, 0, 0)
IntroPanel.BorderSizePixel = 0
IntroPanel.Position = UDim2.new(0, 510, 0, 290)
IntroPanel.Size = UDim2.new(0, 311, 0, 232)
IntroPanel.Visible = false

IntroTextLabel.Name = "IntroTextLabel"
IntroTextLabel.Parent = IntroPanel
IntroTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IntroTextLabel.BackgroundTransparency = 1.000
IntroTextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
IntroTextLabel.BorderSizePixel = 0
IntroTextLabel.Position = UDim2.new(0.176848873, 0, 0.396551728, 0)
IntroTextLabel.Size = UDim2.new(0, 200, 0, 50)
IntroTextLabel.Font = Enum.Font.SourceSansBold
IntroTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
IntroTextLabel.TextScaled = true
IntroTextLabel.TextSize = 14.000
IntroTextLabel.TextWrapped = true

Icon.Name = "Icon"
Icon.Parent = IntroPanel
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1.000
Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon.BorderSizePixel = 0
Icon.Position = UDim2.new(0.176848873, 0, 0.400862068, 0)
Icon.Size = UDim2.new(0, 47, 0, 46)
Icon.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

Window.Name = "Window"
Window.Parent = ScreenGui
Window.BackgroundColor3 = Color3.fromRGB(29, 40, 255)
Window.BackgroundTransparency = 0.700
Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
Window.BorderSizePixel = 0
Window.Position = UDim2.new(0.313343316, 0, 0.270270258, 0)
Window.Size = UDim2.new(0, 498, 0, 373)

Panel.Name = "Panel"
Panel.Parent = Window
Panel.BackgroundColor3 = Color3.fromRGB(29, 40, 255)
Panel.BackgroundTransparency = 0.800
Panel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Panel.BorderSizePixel = 0
Panel.Size = UDim2.new(0, 498, 0, 46)

Title.Name = "Title"
Title.Parent = Panel
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 143, 0, 46)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Title"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

CloseButton.Name = "CloseButton"
CloseButton.Parent = Panel
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundTransparency = 1.000
CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0.889558256, 0, 0, 0)
CloseButton.Size = UDim2.new(0, 55, 0, 46)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(248, 248, 248)
CloseButton.TextScaled = true
CloseButton.TextSize = 14.000
CloseButton.TextWrapped = true

LeftSidePanel.Name = "LeftSidePanel"
LeftSidePanel.Parent = Window
LeftSidePanel.BackgroundColor3 = Color3.fromRGB(29, 40, 255)
LeftSidePanel.BackgroundTransparency = 0.700
LeftSidePanel.BorderColor3 = Color3.fromRGB(0, 0, 0)
LeftSidePanel.BorderSizePixel = 0
LeftSidePanel.Position = UDim2.new(0.0160642564, 0, 0.147453085, 0)
LeftSidePanel.Size = UDim2.new(0, 135, 0, 311)

TabButton.Name = "TabButton"
TabButton.Parent = LeftSidePanel
TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabButton.BackgroundTransparency = 0.700
TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabButton.BorderSizePixel = 0
TabButton.Position = UDim2.new(0.266666681, 0, 0.0353697762, 0)
TabButton.Size = UDim2.new(0, 99, 0, 39)
TabButton.Font = Enum.Font.SourceSansBold
TabButton.Text = "Tab"
TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TabButton.TextScaled = true
TabButton.TextSize = 14.000
TabButton.TextWrapped = true
TabButton.TextXAlignment = Enum.TextXAlignment.Left

TabIcon.Name = "TabIcon"
TabIcon.Parent = TabButton
TabIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabIcon.BackgroundTransparency = 1.000
TabIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabIcon.BorderSizePixel = 0
TabIcon.Position = UDim2.new(-0.363636374, 0, 0, 0)
TabIcon.Size = UDim2.new(0, 36, 0, 39)
TabIcon.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

MainPanel.Name = "MainPanel"
MainPanel.Parent = Window
MainPanel.BackgroundColor3 = Color3.fromRGB(29, 40, 255)
MainPanel.BackgroundTransparency = 0.700
MainPanel.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainPanel.BorderSizePixel = 0
MainPanel.Position = UDim2.new(0.303212851, 0, 0.147453085, 0)
MainPanel.Size = UDim2.new(0, 338, 0, 311)

Button.Name = "Button"
Button.Parent = MainPanel
Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button.BackgroundTransparency = 0.700
Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0.0209791195, 0, 0.0353697762, 0)
Button.Size = UDim2.new(0, 324, 0, 39)
Button.Font = Enum.Font.SourceSansBold
Button.Text = "Tab"
Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Button.TextScaled = true
Button.TextSize = 14.000
Button.TextWrapped = true
Button.TextXAlignment = Enum.TextXAlignment.Left

ButtonIcon.Name = "ButtonIcon"
ButtonIcon.Parent = Button
ButtonIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonIcon.BackgroundTransparency = 1.000
ButtonIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
ButtonIcon.BorderSizePixel = 0
ButtonIcon.Position = UDim2.new(0.877899528, 0, 0, 0)
ButtonIcon.Size = UDim2.new(0, 39, 0, 39)
ButtonIcon.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

Frame.Parent = Window
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0160642564, 0, 0.823056281, 0)
Frame.Size = UDim2.new(0, 135, 0, 3)

RobloxProfile.Name = "RobloxProfile"
RobloxProfile.Parent = Window
RobloxProfile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RobloxProfile.BackgroundTransparency = 1.000
RobloxProfile.BorderColor3 = Color3.fromRGB(0, 0, 0)
RobloxProfile.BorderSizePixel = 0
RobloxProfile.Position = UDim2.new(0.0158817023, 0, 0.844503999, 0)
RobloxProfile.Size = UDim2.new(0, 36, 0, 39)
RobloxProfile.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

RobloxName.Name = "RobloxName"
RobloxName.Parent = Window
RobloxName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RobloxName.BackgroundTransparency = 1.000
RobloxName.BorderColor3 = Color3.fromRGB(0, 0, 0)
RobloxName.BorderSizePixel = 0
RobloxName.Position = UDim2.new(0.0883534104, 0, 0.844503999, 0)
RobloxName.Size = UDim2.new(0, 99, 0, 39)
RobloxName.Font = Enum.Font.SourceSansBold
RobloxName.Text = "Name"
RobloxName.TextColor3 = Color3.fromRGB(0, 0, 0)
RobloxName.TextScaled = true
RobloxName.TextSize = 14.000
RobloxName.TextWrapped = true

-- Close Button functionality
CloseButton.MouseButton1Click:Connect(function()
    Window:Destroy()
end)
