--[[
    Hello there, fellow skid!
    If you've arrived at this gist for the sole purpose of changing the source code, note the following:
    Changing the design or appearance just to edit the looks of the NotificationLib is completely fine, however, changing the system and how stuff works (the waittime between notifications, tweens, etc.) may cause issues with the script. Be aware!
]]

--created by theo

local NotificationLib = {}

local ScreenGui = game:GetService("CoreGui"):FindFirstChild("N")
if not ScreenGui then
    ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Name = "N"
end

debounce = false

function NotificationLib:Notify(title, text, duration, notificationType)
    if debounce == false then
        debounce = true

        c = 0
        -- (USED GUITOLUA CUZ LAZY ASF 😡🧢🥶🤪💀💸🛠️✅💫🤓😃😩)
        if ScreenGui:FindFirstChild("Frame"..tostring(1)) then
            count = true
        end
        wait()
        local Frame = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local Title = Instance.new("TextLabel")
        local Text = Instance.new("TextLabel")
        local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
        local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
        local Type = Instance.new("ImageButton")
        local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
        local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
        local Text_2 = Instance.new("TextLabel")
        local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
        local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
        local Done = Instance.new("ImageButton")
        local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
        local ProgressBar = Instance.new("Frame")
        local Progress = Instance.new("Frame")
        local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
        local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")


        for i,v in pairs(ScreenGui:GetChildren()) do
            if v.Name:find("Frame") and v ~= Frame then
                c += 1
            end
        end
        Frame.Name = "Frame"..tostring(c + 1)
        Frame.Parent = ScreenGui
        Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Frame.Position = UDim2.new(2, -398, 1, -128)
        Frame.Size = UDim2.new(0, 392, 0, 124)

        UICorner.CornerRadius = UDim.new(0, 6)
        UICorner.Parent = Frame

        Title.Name = "Title"
        Title.Parent = Frame
        Title.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        Title.BackgroundTransparency = 0.900
        Title.BorderSizePixel = 0
        Title.Size = UDim2.new(0, 393, 0, 18)
        Title.Font = Enum.Font.SourceSans
        Title.Text = ""
        Title.TextColor3 = Color3.fromRGB(0, 0, 0)
        Title.TextSize = 14.000
        Title.TextXAlignment = Enum.TextXAlignment.Left

        Text.Name = "Text"
        Text.Parent = Title
        Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Text.BackgroundTransparency = 1.000
        Text.Position = UDim2.new(0, 4, 0, 2)
        Text.Size = UDim2.new(0, 388, 0, 14)
        Text.Font = Enum.Font.GothamBold
        Text.Text = "Notification"
        Text.TextColor3 = Color3.fromRGB(255, 255, 255)
        Text.TextScaled = true
        Text.TextSize = 14.000
        Text.TextWrapped = true
        Text.TextXAlignment = Enum.TextXAlignment.Left

        UITextSizeConstraint.Parent = Text
        UITextSizeConstraint.MaxTextSize = 14

        UIAspectRatioConstraint.Parent = Text
        UIAspectRatioConstraint.AspectRatio = 27.714

        Type.Name = "Type"
        Type.Parent = Title
        Type.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Type.BackgroundTransparency = 1.000
        Type.Position = UDim2.new(0, 373, 0, 0)
        Type.Size = UDim2.new(0, 16, 0, 16)
        if notificationType == "Info" then
            Type.Image = "rbxassetid://13012250972"
        elseif notificationType == "Error" then
            Type.Image = "rbxassetid://5107154082"
        elseif notificationType == "Warning" then
            Type.Image = "rbxassetid://12069916896"
        end

        UIAspectRatioConstraint_2.Parent = Type

        UIAspectRatioConstraint_3.Parent = Title
        UIAspectRatioConstraint_3.AspectRatio = 21.833

        Text_2.Name = "Text"
        Text_2.Parent = Frame
        Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Text_2.BackgroundTransparency = 1.000
        Text_2.Position = UDim2.new(0, 6, 0, 23)
        Text_2.Size = UDim2.new(0, 382, 0, 75)
        Text_2.Font = Enum.Font.SourceSans
        Text_2.Text = "This is a notification."
        Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)
        Text_2.TextScaled = true
        Text_2.TextSize = 16.000
        Text_2.TextWrapped = true
        Text_2.TextXAlignment = Enum.TextXAlignment.Left
        Text_2.TextYAlignment = Enum.TextYAlignment.Top

        UITextSizeConstraint_2.Parent = Text_2
        UITextSizeConstraint_2.MaxTextSize = 16

        UIAspectRatioConstraint_4.Parent = Text_2
        UIAspectRatioConstraint_4.AspectRatio = 5.093

        Done.Name = "Done"
        Done.Parent = Frame
        Done.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Done.BackgroundTransparency = 1.000
        Done.Position = UDim2.new(0, 368, 0, 100)
        Done.Size = UDim2.new(0, 20, 0, 20)
        Done.Image = "rbxassetid://1202200114"

        UIAspectRatioConstraint_5.Parent = Done

        ProgressBar.Name = "ProgressBar"
        ProgressBar.Parent = Frame
        ProgressBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        ProgressBar.BorderSizePixel = 0
        ProgressBar.Position = UDim2.new(0, 3, 0, 110)
        ProgressBar.Size = UDim2.new(0, 356, 0, 5)

        Progress.Name = "Progress"
        Progress.Parent = ProgressBar
        Progress.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        Progress.BorderSizePixel = 0
        Progress.Size = UDim2.new(0.00280898879, 0, 1, 0)

        UIAspectRatioConstraint_6.Parent = ProgressBar
        UIAspectRatioConstraint_6.AspectRatio = 71.200

        UIAspectRatioConstraint_7.Parent = Frame
        UIAspectRatioConstraint_7.AspectRatio = 3.161

        --
        
        Text.Text = tostring(title) or "Notification"
        Text_2.Text = tostring(text) or "This is a notification."
        Frame:TweenPosition(UDim2.new(1, -398, 1, -128), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.2)
        if count then
            for i,v in pairs(ScreenGui:GetChildren()) do
                if v.Name:find("Frame") then
                    v:TweenPosition(v.Position - UDim2.new(0, 0, 0, 128), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.2)
                end
            end
        end
        Done.MouseButton1Click:Connect(function()
            Done.Parent:TweenPosition(UDim2.new(2, -398, 1, -128), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.2)
            wait(0.2)
            if count then
                for i,v in pairs(ScreenGui:GetChildren()) do
                    if v.Name:find("Frame") then
                        if tonumber(string.sub(v.Name, 6, 6)) < tonumber(string.sub(Done.Parent.Name, 6, 6)) then
                            v:TweenPosition(v.Position + UDim2.new(0, 0, 0, 128), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.2)
                        end
                    end
                end
            end
            wait()
            Done.Parent:Destroy()
        end)
        Progress:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, tonumber(duration) or 4, false, function()
            Progress.Parent.Parent:TweenPosition(UDim2.new(2, -398, 1, -128), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.2)
            wait(0.2)
            Progress.Parent.Parent:Destroy()
        end)
        wait(0.5)
        debounce = false
    end
end

return NotificationLib
