local NotificationLib = {}

local ScreenGui = Instance.new("ScreenGui")

function NotificationLib:Notify(title, text, duration, notificationType)
    -- (USED GUITOLUA CUZ LAZY ASF 😡🧢🥶🤪💀💸🛠️✅💫🤓😃😩)
    if ScreenGui:FindFirstChild("Frame") then
        count = true
    end
    wait()
    local Frame = Instance.new("Frame")
    local Frame_2 = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Text = Instance.new("TextLabel")
    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    local Type = Instance.new("ImageButton")
    local Text_2 = Instance.new("TextLabel")
    local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
    local Done = Instance.new("ImageButton")
    local ProgressBar = Instance.new("Frame")
    local Progress = Instance.new("Frame")


    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = ScreenGui
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.BackgroundTransparency = 1.000
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(1.1, 0, 0.949999988, 0)

    Frame_2.Parent = Frame
    Frame_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame_2.Position = UDim2.new(0, -303, 0, -79)
    Frame_2.Size = UDim2.new(0, 392, 0, 124)

    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = Frame_2

    Title.Name = "Title"
    Title.Parent = Frame_2
    Title.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    Title.BackgroundTransparency = 0.900
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(-0.00255102036, 0, 0, 0)
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
    Text.Position = UDim2.new(0.0127226459, 0, 0.111111112, 0)
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
    Type.Position = UDim2.new(0.951498032, 0, 0.036738079, 0)
    Type.Size = UDim2.new(0, 16, 0, 16)
    Type.Image = "rbxassetid://13012250972"

    Text_2.Name = "Text"
    Text_2.Parent = Frame_2
    Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text_2.BackgroundTransparency = 1.000
    Text_2.Position = UDim2.new(0.0153061226, 0, 0.193548381, 0)
    Text_2.Size = UDim2.new(0.974489808, 0, 0.604838729, 0)
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

    Done.Name = "Done"
    Done.Parent = Frame_2
    Done.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Done.BackgroundTransparency = 1.000
    Done.Position = UDim2.new(0.938775539, 0, 0.814516127, 0)
    Done.Size = UDim2.new(0, 20, 0, 20)
    Done.Image = "rbxassetid://1202200114"

    ProgressBar.Name = "ProgressBar"
    ProgressBar.Parent = Frame_2
    ProgressBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    ProgressBar.BorderSizePixel = 0
    ProgressBar.Position = UDim2.new(0.0102040814, 0, 0.895161271, 0)
    ProgressBar.Size = UDim2.new(0, 356, 0, 5)

    Progress.Name = "Progress"
    Progress.Parent = ProgressBar
    Progress.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    Progress.BorderSizePixel = 0
    Progress.Size = UDim2.new(0.00280898879, 0, 1, 0)

    --
    
    Text.Text = tostring(title) or "Notification"
    Text_2.Text = tostring(text) or "This is a notification."
    Frame:TweenPosition(UDim2.new(0.95, 0, 0.95, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.2)
    if count then
        for i,v in pairs(ScreenGui:GetChildren()) do
            if v.Name == "Frame" then
                v:TweenPosition(v.Position - UDim2.new(0, 0, 0.1325, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.2)
            end
        end
    end
    Done.MouseButton1Click:Connect(function()
        Frame:TweenPosition(UDim2.new(1.1, 0, 0.949999988, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.2)
        wait(0.2)
        Frame:Destroy()
    end)
    Progress:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, tonumber(duration) or 4, false, function()
        Frame:TweenPosition(UDim2.new(1.1, 0, 0.949999988, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.2)
        wait(0.2)
        Frame:Destroy()
    end)
end

return NotificationLib
