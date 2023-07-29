--[[
    Hey there! You've stumbled upon the source code of Byte UI Library.

    Try to resist not being a skid 💪
]]

local Byte = {}
local TabsList = {}

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
    local DRAG_SPEED = (12); -- // The speed of the UI darg.
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
        Tab.Size = UDim2.new(0, 50, 0, 20)
        Tab.Font = Enum.Font.Gotham
        Tab.Text = tostring(name) or ""
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextScaled = true
        Tab.TextSize = 13.000
        Tab.TextWrapped = true
        Tab.AutomaticSize = Enum.AutomaticSize.X
        Tab.AutoButtonColor = false
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
        UITextSizeConstraint_2.MaxTextSize = 12

        if string.len(Tab.Text) >= 6 then
            local UIPadding = Instance.new("UIPadding")
            UIPadding.Parent = Tab
            UIPadding.PaddingBottom = UDim.new(0, 0)
            UIPadding.PaddingLeft = UDim.new(0, 5)
            UIPadding.PaddingRight = UDim.new(0, 5)
            UIPadding.PaddingTop = UDim.new(0, 0)
        end

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

        table.insert(TabsList, Tab.Name)

        Tab.MouseButton1Down:Connect(function()
            for i,v in pairs(Main:GetDescendants()) do
                if v:IsA("ScrollingFrame") then
                    v.Visible = false
                end
            end
            local contentTarget = Main:FindFirstChild(Tab.Name)
            contentTarget.Visible = true

            for i,v in pairs(Tabs:GetChildren()) do
                if v:IsA("TextButton") then
                    v.UIStroke.Color = Color3.fromRGB(60, 60, 60)
                end
            end
            Tab.UIStroke.Color = Color3.fromRGB(85, 85, 85)
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

            Button.MouseButton1Down:Connect(function()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.05), {BackgroundColor3 = Color3.fromRGB(43, 43, 43)}):Play()
                wait(0.05)
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.05), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
            end)
                
            Button.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(43, 43, 43)}):Play()
            end)
                
            Button.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
            end)
        end
        function Elements:CreateLabel(name, transparent)
            if not transparent or transparent == nil then
                transparent = false
            end
            local Label = Instance.new("TextLabel")
            local UICorner_11 = Instance.new("UICorner")
            local LabelText = Instance.new("TextLabel")
            local UITextSizeConstraint_7 = Instance.new("UITextSizeConstraint")

            if transparent == false then
                Label.Name = tostring(name) or ""
                Label.Parent = Content
                Label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Label.BorderSizePixel = 0
                Label.Position = UDim2.new(0, 0, 0, 120)
                Label.Size = UDim2.new(0, 506, 0, 34)
                Label.Font = Enum.Font.SourceSans
                Label.Text = ""
                Label.TextColor3 = Color3.fromRGB(0, 0, 0)
                Label.TextSize = 14.000
            else
                Label.Name = tostring(name) or ""
                Label.Parent = Content
                Label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                Label.BackgroundTransparency = 1.000
                Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Label.BorderSizePixel = 0
                Label.Position = UDim2.new(0, 0, 0, 120)
                Label.Size = UDim2.new(0, 506, 0, 34)
                Label.Font = Enum.Font.SourceSans
                Label.Text = ""
                Label.TextColor3 = Color3.fromRGB(0, 0, 0)
                Label.TextSize = 14.000
            end

            UICorner_11.CornerRadius = UDim.new(0, 3)
            UICorner_11.Parent = Label

            LabelText.Name = "LabelText"
            LabelText.Parent = Label
            LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelText.BackgroundTransparency = 1.000
            LabelText.BorderColor3 = Color3.fromRGB(0, 0, 0)
            LabelText.BorderSizePixel = 0
            LabelText.Position = UDim2.new(0, 7, 0, 10)
            LabelText.Size = UDim2.new(0, 40, 0, 13)
            LabelText.Font = Enum.Font.Gotham
            LabelText.Text = tostring(name) or ""
            LabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
            LabelText.TextScaled = true
            LabelText.TextSize = 14.000
            LabelText.TextWrapped = true
            LabelText.TextXAlignment = Enum.TextXAlignment.Left
            LabelText.AutomaticSize = Enum.AutomaticSize.X

            UITextSizeConstraint_7.Parent = LabelText
            UITextSizeConstraint_7.MaxTextSize = 14
        end
        function Elements:CreateToggle(name, callback)
            toggled = false
            callback = callback or function() end
            local Toggle = Instance.new("TextButton")
            local ToggleText = Instance.new("TextLabel")
            local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
            local UICorner_6 = Instance.new("UICorner")
            local Switch = Instance.new("TextLabel")
            local UICorner_7 = Instance.new("UICorner")
            local Circle = Instance.new("TextLabel")
            local UICorner_8 = Instance.new("UICorner")

            Toggle.Name = tostring(name) or ""
            Toggle.Parent = Content
            Toggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Toggle.BorderSizePixel = 0
            Toggle.Position = UDim2.new(0, 1, 0, 40)
            Toggle.Size = UDim2.new(0, 506, 0, 34)
            Toggle.AutoButtonColor = false
            Toggle.Font = Enum.Font.SourceSans
            Toggle.Text = ""
            Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
            Toggle.TextSize = 14.000

            ToggleText.Name = "ToggleText"
            ToggleText.Parent = Toggle
            ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleText.BackgroundTransparency = 1.000
            ToggleText.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ToggleText.BorderSizePixel = 0
            ToggleText.Position = UDim2.new(0, 7, 0, 9)
            ToggleText.Size = UDim2.new(0, 441, 0, 13)
            ToggleText.Font = Enum.Font.Gotham
            ToggleText.Text = tostring(name) or ""
            ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleText.TextScaled = true
            ToggleText.TextSize = 14.000
            ToggleText.TextWrapped = true
            ToggleText.TextXAlignment = Enum.TextXAlignment.Left

            UITextSizeConstraint_4.Parent = ToggleText
            UITextSizeConstraint_4.MaxTextSize = 14

            UICorner_6.CornerRadius = UDim.new(0, 3)
            UICorner_6.Parent = Toggle

            Switch.Name = "Switch"
            Switch.Parent = Toggle
            Switch.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
            Switch.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Switch.BorderSizePixel = 0
            Switch.Position = UDim2.new(0, 459, 0, 10)
            Switch.Size = UDim2.new(0, 35, 0, 13)
            Switch.Font = Enum.Font.SourceSans
            Switch.Text = ""
            Switch.TextColor3 = Color3.fromRGB(0, 0, 0)
            Switch.TextSize = 14.000

            UICorner_7.CornerRadius = UDim.new(1, 0)
            UICorner_7.Parent = Switch

            if toggled then
                Circle.Name = "Circle"
                Circle.Parent = Switch
                Circle.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
                Circle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Circle.BorderSizePixel = 0
                Circle.Position = UDim2.new(0, 23, 0, -2)
                Circle.Size = UDim2.new(0, 16, 0, 16)
                Circle.Font = Enum.Font.SourceSans
                Circle.Text = ""
                Circle.TextColor3 = Color3.fromRGB(0, 0, 0)
                Circle.TextSize = 14.000
            else
                Circle.Name = "Circle"
                Circle.Parent = Switch
                Circle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                Circle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Circle.BorderSizePixel = 0
                Circle.Position = UDim2.new(0, -2, 0, -2)
                Circle.Size = UDim2.new(0, 16, 0, 16)
                Circle.Font = Enum.Font.SourceSans
                Circle.Text = ""
                Circle.TextColor3 = Color3.fromRGB(0, 0, 0)
                Circle.TextSize = 14.000
            end

            UICorner_8.CornerRadius = UDim.new(1, 0)
            UICorner_8.Parent = Circle

            local db = false
            Toggle.MouseButton1Down:Connect(function()
                if not db then
                    db = true
                    if Circle.Position == UDim2.new(0, -2, 0, -2) then
                        Circle:TweenPosition(UDim2.new(0, 23, 0, -2), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.05)
                        Circle.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
                        game:GetService("TweenService"):Create(Toggle, TweenInfo.new(0.05), {BackgroundColor3 = Color3.fromRGB(43, 43, 43)}):Play()
                        wait(0.05)
                        game:GetService("TweenService"):Create(Toggle, TweenInfo.new(0.05), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
                    elseif Circle.Position == UDim2.new(0, 23, 0, -2) then
                        Circle:TweenPosition(UDim2.new(0, -2, 0, -2), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.05)
                        Circle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        game:GetService("TweenService"):Create(Toggle, TweenInfo.new(0.05), {BackgroundColor3 = Color3.fromRGB(43, 43, 43)}):Play()
                        wait(0.05)
                        game:GetService("TweenService"):Create(Toggle, TweenInfo.new(0.05), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
                    end
                    toggled = not toggled
                    pcall(callback, toggled)
                    wait(0.1)
                    db = false
                end
            end)
        end
        function Elements:CreateSlider(name, min, max, def, callback)
            min = tonumber(min) or 0
            max = tonumber(max) or 100
            def = tonumber(def) or 0
            value = math.clamp(def, min, max) or math.clamp(50, min, max)
            defscale = (value - min) / (max - min)
            callback = callback or function() end
            local Slider = Instance.new("TextLabel")
            local UICorner_9 = Instance.new("UICorner")
            local Slider_2 = Instance.new("Frame")
            local SliderShow = Instance.new("Frame")
            local SliderCircle = Instance.new("TextButton")
            local UICorner_10 = Instance.new("UICorner")
            local SliderText = Instance.new("TextLabel")
            local UITextSizeConstraint_5 = Instance.new("UITextSizeConstraint")
            local SliderText_2 = Instance.new("TextLabel")
            local UITextSizeConstraint_6 = Instance.new("UITextSizeConstraint")

            Slider.Name = tostring(name) or ""
            Slider.Parent = Content
            Slider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Slider.BorderSizePixel = 0
            Slider.Position = UDim2.new(0, 4, 0, 80)
            Slider.Size = UDim2.new(0, 506, 0, 40)
            Slider.Font = Enum.Font.SourceSans
            Slider.Text = ""
            Slider.TextColor3 = Color3.fromRGB(0, 0, 0)
            Slider.TextSize = 14.000

            UICorner_9.CornerRadius = UDim.new(0, 3)
            UICorner_9.Parent = Slider

            Slider_2.Name = "Slider"
            Slider_2.Parent = Slider
            Slider_2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            Slider_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Slider_2.BorderSizePixel = 0
            Slider_2.Position = UDim2.new(0, 7, 0, 30)
            Slider_2.Size = UDim2.new(0, 480, 0, 1)

            SliderShow.Name = "Slider"
            SliderShow.Parent = Slider_2
            SliderShow.BackgroundTransparency = 1.000
            SliderShow.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            SliderShow.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SliderShow.BorderSizePixel = 0
            SliderShow.Position = UDim2.new(0, 0, 0, 0)
            SliderShow.Size = UDim2.new(defscale, 0, 1, 0)

            SliderCircle.Name = "SliderCircle"
            SliderCircle.Parent = Slider_2
            SliderCircle.BackgroundColor3 = Color3.fromRGB(110, 110, 110)
            SliderCircle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SliderCircle.BorderSizePixel = 0
            SliderCircle.Position = UDim2.new(defscale, 0, 0, -8)
            SliderCircle.Size = UDim2.new(0, 4, 0, 14)
            SliderCircle.Font = Enum.Font.SourceSans
            SliderCircle.Text = ""
            SliderCircle.TextColor3 = Color3.fromRGB(0, 0, 0)
            SliderCircle.TextSize = 14.000

            UICorner_10.CornerRadius = UDim.new(1, 0)
            UICorner_10.Parent = SliderCircle

            SliderText.Name = "SliderText"
            SliderText.Parent = Slider
            SliderText.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            SliderText.BackgroundTransparency = 1.000
            SliderText.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SliderText.BorderSizePixel = 0
            SliderText.Position = UDim2.new(0, 7, 0, 4)
            SliderText.Size = UDim2.new(0, 412, 0, 13)
            SliderText.Font = Enum.Font.Gotham
            SliderText.Text = tostring(name) or ""
            SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderText.TextScaled = true
            SliderText.TextSize = 14.000
            SliderText.TextWrapped = true
            SliderText.TextXAlignment = Enum.TextXAlignment.Left

            UITextSizeConstraint_5.Parent = SliderText
            UITextSizeConstraint_5.MaxTextSize = 14

            SliderText_2.Name = "SliderText"
            SliderText_2.Parent = Slider
            SliderText_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderText_2.BackgroundTransparency = 1.000
            SliderText_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SliderText_2.BorderSizePixel = 0
            SliderText_2.Position = UDim2.new(0, 475, 0, 4)
            SliderText_2.Size = UDim2.new(0, 18, 0, 18)
            SliderText_2.Font = Enum.Font.Gotham
            SliderText_2.Text = tostring(value)
            SliderText_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderText_2.TextScaled = true
            SliderText_2.TextSize = 14.000
            SliderText_2.TextWrapped = true

            UITextSizeConstraint_6.Parent = SliderText_2
            UITextSizeConstraint_6.MaxTextSize = 14

            local db = false
            local percentage = 0+69-69*000
                
            local uis = game:GetService("UserInputService")
                
            function snap(number, factor)
                if factor == 0 then
                    return number
                else
                    return math.floor(number/factor) * factor
                end
            end
                
            uis.InputEnded:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 then
                    db = false
                end
            end)
                
            SliderCircle.MouseButton1Down:Connect(function()
                db = true
            end)

            pcall(callback, value)
                
            game.Players.LocalPlayer:GetMouse().Move:Connect(function()
                if db then
                    local mousepos = uis:GetMouseLocation().X
                    local btnpos = SliderCircle.Position
                    local fsize = Slider_2.AbsoluteSize.X
                    local fpos = Slider_2.AbsolutePosition.X
                    local pos = snap(((mousepos)-fpos)/fsize, 0.001)
                    percentage = math.clamp(pos, 0, 1)
                    SliderCircle.Position = UDim2.new(percentage, 0, btnpos.Y.Scale, btnpos.Y.Offset)
                    SliderShow.Size = UDim2.new(percentage, 0, SliderShow.Position.Y.Scale, SliderShow.Position.Y.Offset)
                    value = math.floor((((tonumber(max) - tonumber(min)) / 480) * SliderShow.AbsoluteSize.X) + tonumber(min)) or 0
                    SliderText_2.Text = tostring(value)
                    pcall(callback, value)
                end
            end)
        end
        function Elements:CreateTextbox(name, callback)
            callback = callback or function() end

            local TextBox = Instance.new("Frame")
            local UICorner_12 = Instance.new("UICorner")
            local Text = Instance.new("TextBox")
            local UITextSizeConstraint_8 = Instance.new("UITextSizeConstraint")
            local Underline = Instance.new("Frame")
            local SecondUnderline = Instance.new("Frame")

            TextBox.Name = tostring(name) or ""
            TextBox.Parent = Content
            TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextBox.BorderSizePixel = 0
            TextBox.Position = UDim2.new(0, 0, 0, 162)
            TextBox.Size = UDim2.new(0, 506, 0, 34)

            UICorner_12.CornerRadius = UDim.new(0, 3)
            UICorner_12.Parent = TextBox

            Text.Name = "Text"
            Text.Parent = TextBox
            Text.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Text.BackgroundTransparency = 1.000
            Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Text.BorderSizePixel = 0
            Text.Position = UDim2.new(0, 6, 0, 10)
            Text.Size = UDim2.new(0, 468, 0, 13)
            Text.Font = Enum.Font.Gotham
            Text.PlaceholderText = tostring(name) or ""
            Text.Text = ""
            Text.TextColor3 = Color3.fromRGB(255, 255, 255)
            Text.TextScaled = true
            Text.TextSize = 14.000
            Text.TextWrapped = true
            Text.TextXAlignment = Enum.TextXAlignment.Left

            UITextSizeConstraint_8.Parent = Text
            UITextSizeConstraint_8.MaxTextSize = 14

            Underline.Name = "Underline"
            Underline.Parent = TextBox
            Underline.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
            Underline.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Underline.BorderSizePixel = 0
            Underline.Position = UDim2.new(0, 0, 0, 34)
            Underline.Size = UDim2.new(0, 506, 0, 2)

            SecondUnderline.Name = "SecondUnderline"
            SecondUnderline.Parent = TextBox
            SecondUnderline.BackgroundColor3 = Color3.fromRGB(110, 110, 110)
            SecondUnderline.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SecondUnderline.BorderSizePixel = 0
            SecondUnderline.Position = UDim2.new(0, 243, 0, 34)
            SecondUnderline.Size = UDim2.new(0, 8, 0, 2)
            SecondUnderline.Visible = false

            Text.Focused:Connect(function()
                SecondUnderline.Visible = true
                SecondUnderline.BackgroundTransparency = 0
                SecondUnderline:TweenSizeAndPosition(UDim2.new(0, 506, 0, 2), UDim2.new(0, 0, 0, 34), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.25)
            end)
                
            Text.FocusLost:Connect(function()
                game:GetService("TweenService"):Create(SecondUnderline, TweenInfo.new(0.1), {BackgroundTransparency = 1}):Play()
                wait(0.1)
                SecondUnderline:TweenSizeAndPosition(UDim2.new(0, 8, 0, 2), UDim2.new(0, 243, 0, 34), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.001)
                SecondUnderline.Visible = false
            end)
                
            TextBox.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(Underline, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(90, 90, 90)}):Play()
            end)
                
            TextBox.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(Underline, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(75, 75, 75)}):Play()
            end)

            Text.FocusLost:Connect(function()
                pcall(callback, Text.Text)
            end)
        end
        return Elements
    end
    function TabsSection:SelectTab(tableNum)
        for i,v in pairs(TabsList) do
            if i == tableNum then
                if Main:FindFirstChild(v) then
                    local tabContent = Main:FindFirstChild(v)
                    tabContent.Visible = true
                    local tab = Tabs:FindFirstChild(v)
                    tab.UIStroke.Color = Color3.fromRGB(85, 85, 85)
                end
            end
        end
    end
    return TabsSection
end
return Byte
