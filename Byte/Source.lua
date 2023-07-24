--[[
    Hey there! You've stumbled upon the source code of Byte UI Library.

    Try to resist not being a skid 💪
]]

local Byte = {}

function Byte:CreateWindow(name)
    local ByteGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("Frame")
    local MainTitle = Instance.new("TextLabel")
    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    local Frame = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local CoverUpFrame = Instance.new("Frame")
    local Tabs = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local Sep = Instance.new("Frame")
    local UICorner_4 = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")

    --Properties:

    ByteGui.Name = "Byte"
    ByteGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ByteGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ByteGui.ResetOnSpawn = false

    Main.Name = "Main"
    Main.Parent = ByteGui
    Main.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0, 460, 0, 183)
    Main.Size = UDim2.new(0, 525, 0, 317)
    UIStroke.Parent = Main
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke.Color = Color3.fromRGB(60, 60, 60)
    UIStroke.LineJoinMode = Enum.LineJoinMode.Round
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0
    UIStroke.Enabled = true

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Main

    Title.Name = "Title"
    Title.Parent = Main
    Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(0, 525, 0, 25)

    MainTitle.Name = "MainTitle"
    MainTitle.Parent = Title
    MainTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainTitle.BackgroundTransparency = 1.000
    MainTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainTitle.BorderSizePixel = 0
    MainTitle.Position = UDim2.new(0, 5, 0, 4)
    MainTitle.Size = UDim2.new(0, 508, 0, 16)
    MainTitle.Font = Enum.Font.GothamBold
    MainTitle.Text = tostring(name) or ""
    MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainTitle.TextScaled = true
    MainTitle.TextSize = 14.000
    MainTitle.TextWrapped = true
    MainTitle.TextXAlignment = Enum.TextXAlignment.Left

    UITextSizeConstraint.Parent = MainTitle
    UITextSizeConstraint.MaxTextSize = 13

    Frame.Parent = Title
    Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0, 0, 0, 25)
    Frame.Size = UDim2.new(0, 514, 0, 0)

    UICorner_2.CornerRadius = UDim.new(0, 5)
    UICorner_2.Parent = Title

    CoverUpFrame.Name = "CoverUpFrame"
    CoverUpFrame.Parent = Title
    CoverUpFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    CoverUpFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CoverUpFrame.BorderSizePixel = 0
    CoverUpFrame.Position = UDim2.new(0, 0, 0, 20)
    CoverUpFrame.Size = UDim2.new(0, 525, 0, 5)

    Tabs.Name = "Tabs"
    Tabs.Parent = Main
    Tabs.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Tabs.BackgroundTransparency = 1.000
    Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0, 7, 0, 32)
    Tabs.Size = UDim2.new(0, 514, 0, 23)

    UIListLayout.Parent = Tabs
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    UIListLayout.Padding = UDim.new(0, 10)

    Sep.Name = "Sep"
    Sep.Parent = Main
    Sep.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Sep.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Sep.BorderSizePixel = 0
    Sep.Position = UDim2.new(0, 5, 0, 62)
    Sep.Size = UDim2.new(0, 512, 0, 1)

    UICorner_4.CornerRadius = UDim.new(1, 0)
    UICorner_4.Parent = Sep
    
    --drag

    local UserInputService = game:GetService("UserInputService")
    local runService = (game:GetService("RunService"));

    local gui = Main
    local clickGui = Title

    local dragging
    local dragInput
    local dragStart
    local startPos

    function Lerp(a, b, m)
        return a + (b - a) * m
    end;

    local lastMousePos
    local lastGoalPos
    local DRAG_SPEED = (8); -- // The speed of the UI darg.
    function Update(dt)
        if not (startPos) then return end;
        if not (dragging) and (lastGoalPos) then
            gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
            return 
        end;

        local delta = (lastMousePos - UserInputService:GetMouseLocation())
        local xGoal = (startPos.X.Offset - delta.X);
        local yGoal = (startPos.Y.Offset - delta.Y);
        lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
        gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
    end;

    clickGui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            lastMousePos = UserInputService:GetMouseLocation()

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    clickGui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    runService.Heartbeat:Connect(Update)

    local TabsSection = {}

    function TabsSection:CreateTab(name)
        local Tab = Instance.new("TextButton")
        local UICorner_3 = Instance.new("UICorner")
        local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
        local UIStroke_2 = Instance.new("UIStroke")

        for i,v in pairs(Main:GetDescendants()) do
            if v:IsA("TextButton") then
                if v.Name == name then
                    alreadyExists = true
                    break
                end
            end
        end

        count = 0
        for i,v in pairs(Main:GetDescendants()) do
            if v:IsA("ScrollingFrame") then
                if v.Name == name then
                    count += 1
                end
            end
        end

        if not alreadyExists then
            Tab.Name = tostring(name) or ""
        else
            Tab.Name = tostring(name)..tostring(count) or ""..tostring(count)
        end
        Tab.Parent = Tabs
        Tab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab.BorderSizePixel = 0
        Tab.Position = UDim2.new(0, 1, 0, 1)
        Tab.Size = UDim2.new(0, 86, 0, 20)
        Tab.Font = Enum.Font.Gotham
        Tab.Text = tostring(name) or ""
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextScaled = true
        Tab.TextSize = 13.000
        Tab.TextWrapped = true
        UIStroke_2.Parent = Tab
        UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke_2.Color = Color3.fromRGB(60, 60, 60)
        UIStroke_2.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke_2.Thickness = 1
        UIStroke_2.Transparency = 0
        UIStroke_2.Enabled = true

        UICorner_3.CornerRadius = UDim.new(0, 3)
        UICorner_3.Parent = Tab

        UITextSizeConstraint_2.Parent = Tab
        UITextSizeConstraint_2.MaxTextSize = 13

        wait()
        local Content = Instance.new("ScrollingFrame")
        local UIListLayout_2 = Instance.new("UIListLayout")

        Content.Name = Tab.Name
        Content.Parent = Main
        Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Content.BackgroundTransparency = 1.000
        Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Content.BorderSizePixel = 0
        Content.Position = UDim2.new(0, 4, 0, 70)
        Content.Size = UDim2.new(0, 514, 0, 239)
        Content.ScrollBarThickness = 2

        UIListLayout_2.Parent = Content
        UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 6)

        Content.Visible = false

        Tab.MouseButton1Down:Connect(function()
            for i,v in pairs(Main:GetDescendants()) do
                if v:IsA("ScrollingFrame") then
                    v.Visible = false
                end
            end
            local contentTarget = Main:FindFirstChild(Tab.Name)
            contentTarget.Visible = true
        end)

        local Elements = {}

        function Elements:CreateButton(name, callback)
            local Button = Instance.new("TextButton")
            local ButtonText = Instance.new("TextLabel")
            local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
            local UICorner_5 = Instance.new("UICorner")

            Button.Name = tostring(name) or ""
            Button.Parent = Content
            Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(0, 506, 0, 34)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.SourceSans
            Button.Text = ""
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 14.000

            pcall(function()
                Button.MouseButton1Down:Connect(callback)
            end)

            ButtonText.Name = "ButtonText"
            ButtonText.Parent = Button
            ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonText.BackgroundTransparency = 1.000
            ButtonText.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ButtonText.BorderSizePixel = 0
            ButtonText.Position = UDim2.new(0, 7, 0, 10)
            ButtonText.Size = UDim2.new(0, 468, 0, 13)
            ButtonText.Font = Enum.Font.Gotham
            ButtonText.Text = tostring(name) or ""
            ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
            ButtonText.TextScaled = true
            ButtonText.TextSize = 14.000
            ButtonText.TextWrapped = true
            ButtonText.TextXAlignment = Enum.TextXAlignment.Left

            UITextSizeConstraint_3.Parent = ButtonText
            UITextSizeConstraint_3.MaxTextSize = 14

            UICorner_5.CornerRadius = UDim.new(0, 3)
            UICorner_5.Parent = Button
        end
        return Elements
    end
    function TabsSection:SelectTab(name)
        for i,v in pairs(Main:GetChildren()) do
            if v:IsA("ScrollingFrame") and v.Name == name then
                v.Visible = true
            else
                v.Visible = false
            end
        end
    end
    return TabsSection
end
return Byte
