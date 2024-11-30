local EclipseUILib = {}

-- Helper: Make UI draggable
local function makeDraggable(guiObject, dragHandle)
    local dragging, dragInput, dragStart, startPos
    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = guiObject.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    dragHandle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            guiObject.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- Core UI function
function EclipseUILib:CreateWindow(options)
    -- Options
    local titleText = options.Title or "Window"

    -- Fetch player info
    local player = game.Players.LocalPlayer
    local playerName = player.DisplayName or player.Name
    local profileIcon = string.format("https://www.roblox.com/headshot-thumbnail/image?userId=%s&width=420&height=420&format=png", player.UserId)

    -- UI Elements
    local ScreenGui = Instance.new("ScreenGui")
    local Window = Instance.new("Frame")
    local Panel = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local CloseButton = Instance.new("TextButton")
    local LeftSidePanel = Instance.new("Frame")
    local MainPanel = Instance.new("Frame")
    local ProfileFrame = Instance.new("Frame")
    local RobloxProfile = Instance.new("ImageLabel")
    local RobloxName = Instance.new("TextLabel")

    -- Set parent and basic properties
    ScreenGui.Name = "EclipseUI"
    ScreenGui.Parent = player:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Window
    Window.Name = "Window"
    Window.Parent = ScreenGui
    Window.BackgroundColor3 = Color3.fromRGB(29, 40, 255)
    Window.BackgroundTransparency = 0.7
    Window.Position = UDim2.new(0.3, 0, 0.3, 0)
    Window.Size = UDim2.new(0, 498, 0, 373)

    -- Panel
    Panel.Name = "Panel"
    Panel.Parent = Window
    Panel.BackgroundColor3 = Color3.fromRGB(29, 40, 255)
    Panel.BackgroundTransparency = 0.8
    Panel.Size = UDim2.new(1, 0, 0, 46)

    -- Title
    Title.Name = "Title"
    Title.Parent = Panel
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(0.8, 0, 1, 0)
    Title.Font = Enum.Font.SourceSansBold
    Title.Text = titleText
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextScaled = true

    -- Close Button
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = Panel
    CloseButton.BackgroundTransparency = 1
    CloseButton.Size = UDim2.new(0.2, 0, 1, 0)
    CloseButton.Position = UDim2.new(0.8, 0, 0, 0)
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextScaled = true
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Main Panel
    MainPanel.Name = "MainPanel"
    MainPanel.Parent = Window
    MainPanel.BackgroundColor3 = Color3.fromRGB(29, 40, 255)
    MainPanel.BackgroundTransparency = 0.7
    MainPanel.Position = UDim2.new(0.3, 0, 0.2, 0)
    MainPanel.Size = UDim2.new(0.7, 0, 0.7, 0)

    -- Profile Frame
    ProfileFrame.Name = "ProfileFrame"
    ProfileFrame.Parent = Window
    ProfileFrame.BackgroundTransparency = 1
    ProfileFrame.Position = UDim2.new(0.03, 0, 0.8, 0)
    ProfileFrame.Size = UDim2.new(0.3, 0, 0.2, 0)

    RobloxProfile.Name = "RobloxProfile"
    RobloxProfile.Parent = ProfileFrame
    RobloxProfile.Size = UDim2.new(0.3, 0, 1, 0)
    RobloxProfile.Image = profileIcon

    RobloxName.Name = "RobloxName"
    RobloxName.Parent = ProfileFrame
    RobloxName.Size = UDim2.new(0.7, 0, 1, 0)
    RobloxName.Position = UDim2.new(0.3, 0, 0, 0)
    RobloxName.Font = Enum.Font.SourceSansBold
    RobloxName.Text = playerName
    RobloxName.TextColor3 = Color3.fromRGB(255, 255, 255)
    RobloxName.TextScaled = true

    -- Make the window draggable
    makeDraggable(Window, Panel)

    -- Button creation function
    function EclipseUILib:CreateButton(buttonOptions)
        local buttonText = buttonOptions.Text or "Button"
        local callback = buttonOptions.Callback or function() end

        local Button = Instance.new("TextButton")
        Button.Parent = MainPanel
        Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button.BackgroundTransparency = 0.7
        Button.Size = UDim2.new(0.8, 0, 0.1, 0)
        Button.Position = UDim2.new(0.1, 0, (#MainPanel:GetChildren() - 1) * 0.12, 0)
        Button.Font = Enum.Font.SourceSansBold
        Button.Text = buttonText
        Button.TextColor3 = Color3.fromRGB(0, 0, 0)
        Button.TextScaled = true
        Button.MouseButton1Click:Connect(callback)
    end

    return EclipseUILib
end

return EclipseUILib
