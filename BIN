-- EclipseLib.lua
local EclipseLib = {}

-- Initialize the Elements table if it doesn't exist
EclipseLib.Elements = EclipseLib.Elements or {}

-- Helper function to create UI elements
function EclipseLib:CreateElement(className, properties)
    local element = Instance.new(className)
    for property, value in pairs(properties) do
        element[property] = value
    end
    return element
end

-- MakeWindow function to create the main window
function EclipseLib:MakeWindow(config)
    -- Ensure there's a ScreenGui to parent the window to
    local screenGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui")
    if not screenGui then
        screenGui = Instance.new("ScreenGui")
        screenGui.Name = "ScreenGui"
        screenGui.Parent = game.Players.LocalPlayer.PlayerGui
    end

    -- Intro Panel (Loading screen with text and icon)
    local IntroPanel = self:CreateElement("Frame", {
        Name = "IntroPanel",
        Size = UDim2.new(0, 600, 0, 100),
        Position = UDim2.new(0.5, -300, 0.5, -50),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Parent = screenGui,
    })

    -- Icon for the Intro Panel
    local Icon = self:CreateElement("ImageLabel", {
        Size = UDim2.new(0, 50, 0, 50),
        Position = UDim2.new(0, 10, 0, 25),
        Image = config.IntroIcon or "rbxassetid://4483345998", -- Default Icon if not provided
        BackgroundTransparency = 1,
        Parent = IntroPanel,
    })

    -- Intro Text Label
    local IntroTextLabel = self:CreateElement("TextLabel", {
        Text = config.IntroText,
        Size = UDim2.new(0, 500, 0, 50),
        Position = UDim2.new(0, 70, 0, 25),
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 24,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        Font = Enum.Font.Gotham,
        Parent = IntroPanel,
    })

    -- Animate intro text letter by letter
    local function AnimateText()
        local letters = config.IntroText:split("")
        local index = 1
        IntroTextLabel.Text = ""
        while index <= #letters do
            IntroTextLabel.Text = IntroTextLabel.Text .. letters[index]
            index = index + 1
            wait(0.1)  -- Adjust speed of animation
        end
    end

    -- Start the animation and remove the intro screen after 5 seconds
    AnimateText()
    wait(5)
    IntroPanel:Destroy()

    -- Create the main window frame
    local Window = self:CreateElement("Frame", {
        Name = "Window",
        Size = UDim2.new(0, 498, 0, 373),
        Position = UDim2.new(0.313, 0, 0.270, 0),
        BackgroundColor3 = Color3.fromRGB(29, 40, 255),
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        Parent = screenGui,
    })

    -- Create the panel that holds the title and close button
    local Panel = self:CreateElement("Frame", {
        Size = UDim2.new(1, 0, 0, 46),
        BackgroundColor3 = Color3.fromRGB(29, 40, 255),
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        Parent = Window,
    })

    -- Title label on the left side
    local Title = self:CreateElement("TextLabel", {
        Text = config.Name,
        Size = UDim2.new(0, 143, 0, 46),
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSansBold,
        Parent = Panel,
    })

    -- Close button (X) on the right side
    local CloseButton = self:CreateElement("TextButton", {
        Size = UDim2.new(0, 55, 0, 46),
        Position = UDim2.new(1, -60, 0, 0),
        Text = "X",
        BackgroundColor3 = Color3.fromRGB(255, 0, 0),
        TextColor3 = Color3.fromRGB(248, 248, 248),
        TextSize = 14,
        BorderSizePixel = 0,
        Parent = Panel,
    })

    -- Callback for closing the window
    CloseButton.MouseButton1Click:Connect(function()
        if config.CloseCallback then
            config.CloseCallback()
        end
        Window:Destroy()  -- Close the window when clicked
    end)

    -- Left Side Panel
    local LeftSidePanel = self:CreateElement("Frame", {
        Size = UDim2.new(0, 135, 0, 311),
        Position = UDim2.new(0.016, 0, 0.147, 0),
        BackgroundColor3 = Color3.fromRGB(29, 40, 255),
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        Parent = Window,
    })

    -- Tab Button
    local TabButton = self:CreateElement("TextButton", {
        Size = UDim2.new(0, 99, 0, 39),
        Position = UDim2.new(0.2667, 0, 0.035, 0),
        Text = "Tab",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.7,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSansBold,
        Parent = LeftSidePanel,
    })

    -- Tab Icon
    local TabIcon = self:CreateElement("ImageLabel", {
        Size = UDim2.new(0, 36, 0, 39),
        Position = UDim2.new(-0.3636, 0, 0, 0),
        Image = "rbxasset://textures/ui/GuiImagePlaceholder.png",
        BackgroundTransparency = 1,
        Parent = TabButton,
    })

    -- Main Panel for Buttons
    local MainPanel = self:CreateElement("Frame", {
        Size = UDim2.new(0, 338, 0, 311),
        Position = UDim2.new(0.303, 0, 0.147, 0),
        BackgroundColor3 = Color3.fromRGB(29, 40, 255),
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        Parent = Window,
    })

    -- Button in Main Panel
    local Button = self:CreateElement("TextButton", {
        Size = UDim2.new(0, 324, 0, 39),
        Position = UDim2.new(0.020, 0, 0.035, 0),
        Text = "Tab",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.7,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSansBold,
        Parent = MainPanel,
    })

    -- Button Icon
    local ButtonIcon = self:CreateElement("ImageLabel", {
        Size = UDim2.new(0, 39, 0, 39),
        Position = UDim2.new(0.8779, 0, 0, 0),
        Image = "rbxasset://textures/ui/GuiImagePlaceholder.png",
        BackgroundTransparency = 1,
        Parent = Button,
    })

    -- Profile Image
    local RobloxProfile = self:CreateElement("ImageLabel", {
        Size = UDim2.new(0, 36, 0, 39),
        Position = UDim2.new(0.0159, 0, 0.8445, 0),
        Image = "rbxasset://textures/ui/GuiImagePlaceholder.png",
        BackgroundTransparency = 1,
        Parent = Window,
    })

    -- Roblox Name
    local RobloxName = self:CreateElement("TextLabel", {
        Size = UDim2.new(0, 99, 0, 39),
        Position = UDim2.new(0.1025, 0, 0.777, 0),
        Text = "Username",
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.SourceSansBold,
        Parent = Window,
    })

    return EclipseLib
end

return EclipseLib
