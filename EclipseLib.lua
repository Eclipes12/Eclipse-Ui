local EclipseUILib = {}
EclipseUILib.Elements = {}

-- Services
local Players = game:GetService("Players")

-- Utility function to create instances
local function createInstance(className, properties)
    local instance = Instance.new(className)
    for property, value in pairs(properties) do
        instance[property] = value
    end
    return instance
end

-- Function to create the main window
function EclipseUILib:MakeWindow(settings)
    assert(settings and type(settings) == "table", "Settings must be provided for the window.")

    -- Defaults
    local name = settings.Name or "Eclipse UI"
    local hidePremium = settings.HidePremium or false
    local saveConfig = settings.SaveConfig or false
    local configFolder = settings.ConfigFolder or "EclipseConfig"
    local introEnabled = settings.IntroEnabled or false
    local introText = settings.IntroText or "Welcome to Eclipse UI"
    local introIcon = settings.IntroIcon or "rbxassetid://4483345998"
    local icon = settings.Icon or "rbxassetid://4483345998"
    local closeCallback = settings.CloseCallback or function() end

    -- ScreenGui
    local screenGui = createInstance("ScreenGui", {
        Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui"),
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    })

    -- Intro Panel (if enabled)
    if introEnabled then
        local introPanel = createInstance("Frame", {
            Parent = screenGui,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 0.5,
            Size = UDim2.new(0, 300, 0, 200),
            Position = UDim2.new(0.5, -150, 0.5, -100),
            AnchorPoint = Vector2.new(0.5, 0.5),
        })

        createInstance("TextLabel", {
            Parent = introPanel,
            Text = introText,
            Font = Enum.Font.SourceSansBold,
            TextScaled = true,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.new(1, 0, 0.6, 0),
        })

        createInstance("ImageLabel", {
            Parent = introPanel,
            Image = introIcon,
            BackgroundTransparency = 1,
            Size = UDim2.new(0.3, 0, 0.3, 0),
            Position = UDim2.new(0.35, 0, 0.6, 0),
        })

        task.wait(2) -- Simulate intro delay
        introPanel:Destroy()
    end

    -- Main Window
    local window = createInstance("Frame", {
        Parent = screenGui,
        BackgroundColor3 = Color3.fromRGB(29, 40, 255),
        BackgroundTransparency = 0.7,
        Size = UDim2.new(0, 500, 0, 400),
        Position = UDim2.new(0.5, -250, 0.5, -200),
        AnchorPoint = Vector2.new(0.5, 0.5),
    })

    -- Title Bar
    local titleBar = createInstance("Frame", {
        Parent = window,
        BackgroundColor3 = Color3.fromRGB(29, 40, 255),
        BackgroundTransparency = 0.8,
        Size = UDim2.new(1, 0, 0.1, 0),
    })

    createInstance("TextLabel", {
        Parent = titleBar,
        Text = name,
        Font = Enum.Font.SourceSansBold,
        TextScaled = true,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(0.8, 0, 1, 0),
    })

    local closeButton = createInstance("TextButton", {
        Parent = titleBar,
        Text = "X",
        Font = Enum.Font.SourceSansBold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Size = UDim2.new(0.2, 0, 1, 0),
        Position = UDim2.new(0.8, 0, 0, 0),
    })

    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        closeCallback()
    end)

    -- Tabs Panel
    local tabsPanel = createInstance("Frame", {
        Parent = window,
        BackgroundColor3 = Color3.fromRGB(29, 40, 255),
        BackgroundTransparency = 0.7,
        Size = UDim2.new(0.3, 0, 0.9, 0),
        Position = UDim2.new(0, 0, 0.1, 0),
    })

    local tabs = {}

    -- Function to create a new tab
    function tabs:MakeTab(tabSettings)
        tabSettings = tabSettings or {}
        local tabName = tabSettings.Name or "Tab"
        local tabIcon = tabSettings.Icon or ""
        local premiumOnly = tabSettings.PremiumOnly or false

        local tabButton = createInstance("TextButton", {
            Parent = tabsPanel,
            Text = tabName,
            Font = Enum.Font.SourceSansBold,
            TextColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 0.7,
            Size = UDim2.new(1, 0, 0.1, 0),
            LayoutOrder = #tabsPanel:GetChildren(),
        })

        local contentFrame = createInstance("Frame", {
            Parent = window,
            BackgroundColor3 = Color3.fromRGB(29, 40, 255),
            BackgroundTransparency = 0.7,
            Size = UDim2.new(0.7, 0, 0.9, 0),
            Position = UDim2.new(0.3, 0, 0.1, 0),
            Visible = false,
        })

        tabButton.MouseButton1Click:Connect(function()
            for _, child in pairs(window:GetChildren()) do
                if child:IsA("Frame") and child ~= tabsPanel and child ~= titleBar then
                    child.Visible = false
                end
            end
            contentFrame.Visible = true
        end)

        local buttons = {}

        function buttons:AddButton(buttonSettings)
            buttonSettings = buttonSettings or {}
            local buttonName = buttonSettings.Name or "Button"
            local buttonCallback = buttonSettings.Callback or function() end

            local button = createInstance("TextButton", {
                Parent = contentFrame,
                Text = buttonName,
                Font = Enum.Font.SourceSansBold,
                TextColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = 0.7,
                Size = UDim2.new(0.9, 0, 0.1, 0),
                Position = UDim2.new(0.05, 0, #contentFrame:GetChildren() * 0.1, 0),
            })

            button.MouseButton1Click:Connect(buttonCallback)
        end

        return buttons
    end

    return tabs
end

return EclipseUILib
