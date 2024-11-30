local EclipseUILib = {}

-- Setup function to create a draggable UI
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

-- Function to create the UI
function EclipseUILib:MakeWindow(options)
    local ScreenGui = Instance.new("ScreenGui")
    local IntroPanel = Instance.new("Frame")
    local IntroTextLabel = Instance.new("TextLabel")
    local Icon = Instance.new("ImageLabel")
    local Window = Instance.new("Frame")
    local Panel = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local CloseButton = Instance.new("TextButton")
    local LeftSidePanel = Instance.new("Frame")
    local MainPanel = Instance.new("Frame")
    local TabsContainer = {}

    -- Assign options
    local windowTitle = options.Name or "Window"
    local introText = options.IntroText or "Welcome!"
    local introIcon = options.IntroIcon or ""
    local icon = options.Icon or ""

    ScreenGui.Name = "EclipseUI"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- IntroPanel
    IntroPanel.Name = "IntroPanel"
    IntroPanel.Parent = ScreenGui
    IntroPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    IntroPanel.Size = UDim2.new(0, 300, 0, 200)
    IntroPanel.Position = UDim2.new(0.5, -150, 0.5, -100)
    IntroPanel.AnchorPoint = Vector2.new(0.5, 0.5)

    Icon.Name = "Icon"
    Icon.Parent = IntroPanel
    Icon.Image = introIcon
    Icon.Size = UDim2.new(0, 50, 0, 50)
    Icon.Position = UDim2.new(0.05, 0, 0.25, 0)
    Icon.BackgroundTransparency = 1

    IntroTextLabel.Name = "IntroTextLabel"
    IntroTextLabel.Parent = IntroPanel
    IntroTextLabel.Text = ""
    IntroTextLabel.Font = Enum.Font.SourceSansBold
    IntroTextLabel.TextSize = 20
    IntroTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    IntroTextLabel.Position = UDim2.new(0.2, 0, 0.25, 0)
    IntroTextLabel.Size = UDim2.new(0.75, 0, 0.5, 0)
    IntroTextLabel.BackgroundTransparency = 1

    -- Intro animation
    coroutine.wrap(function()
        local text = introText
        for i = 1, #text do
            IntroTextLabel.Text = string.sub(text, 1, i)
            wait(0.05)
        end
        wait(5)
        IntroPanel:Destroy()
        Window.Visible = true
    end)()

    -- Window
    Window.Name = "Window"
    Window.Parent = ScreenGui
    Window.BackgroundColor3 = Color3.fromRGB(29, 40, 255)
    Window.Size = UDim2.new(0, 400, 0, 300)
    Window.Position = UDim2.new(0.5, -200, 0.5, -150)
    Window.AnchorPoint = Vector2.new(0.5, 0.5)
    Window.Visible = false

    Panel.Name = "Panel"
    Panel.Parent = Window
    Panel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Panel.Size = UDim2.new(1, 0, 0, 40)

    Title.Name = "Title"
    Title.Parent = Panel
    Title.Text = windowTitle
    Title.Font = Enum.Font.SourceSansBold
    Title.TextSize = 20
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Size = UDim2.new(0.8, 0, 1, 0)

    CloseButton.Name = "CloseButton"
    CloseButton.Parent = Panel
    CloseButton.Text = "X"
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.TextSize = 20
    CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.Size = UDim2.new(0.2, 0, 1, 0)
    CloseButton.Position = UDim2.new(0.8, 0, 0, 0)
    CloseButton.MouseButton1Click:Connect(function()
        Window.Visible = false
    end)

    -- LeftSidePanel
    LeftSidePanel.Name = "LeftSidePanel"
    LeftSidePanel.Parent = Window
    LeftSidePanel.BackgroundColor3 = Color3.fromRGB(29, 40, 255)
    LeftSidePanel.Size = UDim2.new(0.2, 0, 1, -40)
    LeftSidePanel.Position = UDim2.new(0, 0, 0, 40)

    -- MainPanel
    MainPanel.Name = "MainPanel"
    MainPanel.Parent = Window
    MainPanel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MainPanel.Size = UDim2.new(0.8, 0, 1, -40)
    MainPanel.Position = UDim2.new(0.2, 0, 0, 40)

    makeDraggable(Window, Panel)

    local function createTab(tabName)
        local TabButton = Instance.new("TextButton")
        local TabFrame = Instance.new("Frame")

        TabButton.Name = tabName
        TabButton.Parent = LeftSidePanel
        TabButton.Text = tabName
        TabButton.Font = Enum.Font.SourceSansBold
        TabButton.Size = UDim2.new(1, 0, 0, 30)
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)

        TabFrame.Name = tabName .. "Frame"
        TabFrame.Parent = MainPanel
        TabFrame.Size = UDim2.new(1, 0, 1, 0)
        TabFrame.Visible = false

        TabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(MainPanel:GetChildren()) do
                v.Visible = false
            end
            TabFrame.Visible = true
        end)

        TabsContainer[tabName] = TabFrame
        return TabFrame
    end

    local function createButton(tabFrame, buttonName, callback)
        local Button = Instance.new("TextButton")

        Button.Name = buttonName
        Button.Parent = tabFrame
        Button.Text = buttonName
        Button.Font = Enum.Font.SourceSansBold
        Button.Size = UDim2.new(1, 0, 0, 30)
        Button.Position = UDim2.new(0, 0, #tabFrame:GetChildren() * 0.1, 0)
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.MouseButton1Click:Connect(callback)
    end

    return {
        AddTab = function(self, tabOptions)
            local tabFrame = createTab(tabOptions.Name)
            return {
                AddButton = function(_, buttonOptions)
                    createButton(tabFrame, buttonOptions.Name, buttonOptions.Callback)
                end
            }
        end
    }
end

return EclipseUILib
