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

    -- Create the main window frame
    local Window = self:CreateElement("Frame", {
        Size = UDim2.new(0, 600, 0, 400),
        Position = UDim2.new(0.5, -300, 0.5, -200),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Name = "Window",
        Parent = screenGui,  -- Ensure we parent to the correct ScreenGui
    })

    -- Intro Text (if enabled)
    if config.IntroEnabled then
        local IntroLabel = self:CreateElement("TextLabel", {
            Text = config.IntroText,
            Size = UDim2.new(0, 600, 0, 50),
            Position = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 24,
            TextAlign = Enum.TextXAlignment.Center,
            Parent = Window,
        })
        
        -- Wait a few seconds before the window contents appear
        wait(2)
        IntroLabel:Destroy()  -- Remove the intro text after delay
    end

    -- Title Label
    local Title = self:CreateElement("TextLabel", {
        Text = config.Name,
        Size = UDim2.new(0, 300, 0, 50),
        Position = UDim2.new(0, 10, 0, 10),
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 24,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = Window,
    })

    -- Create Close Button
    local CloseButton = self:CreateElement("TextButton", {
        Size = UDim2.new(0, 100, 0, 50),
        Position = UDim2.new(1, -110, 0, 10),
        Text = "Close",
        BackgroundColor3 = Color3.fromRGB(200, 0, 0),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 18,
        BorderSizePixel = 0,
        Parent = Window,
    })

    -- Callback for closing the window
    CloseButton.MouseButton1Click:Connect(function()
        if config.CloseCallback then
            config.CloseCallback()
        end
        Window:Destroy()  -- Close the window when clicked
    end)

    -- Store the window element in the library
    EclipseLib.Elements.Window = Window

    -- Return the window object
    return Window
end

-- Return the EclipseLib object to be used by the loadstring
return EclipseLib