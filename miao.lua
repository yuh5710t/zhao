-- =====================================================================
-- [第一段] 全屏流光启动 + 大字体公告
-- =====================================================================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local IntroGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
IntroGui.DisplayOrder = 99999
IntroGui.IgnoreGuiInset = true

local Bg = Instance.new("Frame", IntroGui)
Bg.Size = UDim2.new(1, 0, 1, 0)
Bg.BackgroundColor3 = Color3.fromRGB(10, 15, 25)
Bg.BorderSizePixel = 0

-- 流光光束
local Glow = Instance.new("Frame", Bg)
Glow.Size = UDim2.new(1, 0, 0, 4)
Glow.Position = UDim2.new(0, 0, 0.5, 0)
Glow.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Glow.BorderSizePixel = 0

local Ring = Instance.new("Frame", Bg)
Ring.Size = UDim2.new(0, 0, 0, 0)
Ring.Position = UDim2.new(0.5, 0, 0.5, 0)
Ring.BackgroundTransparency = 1
local RingStroke = Instance.new("UIStroke", Ring)
RingStroke.Color = Color3.fromRGB(255, 215, 0)
RingStroke.Thickness = 12
Instance.new("UICorner", Ring).CornerRadius = UDim.new(1, 0)

task.spawn(function()
    local spin = RunService.RenderStepped:Connect(function() Ring.Rotation = Ring.Rotation + 15 end)
    TweenService:Create(Ring, TweenInfo.new(0.6, Enum.EasingStyle.Back), {Size = UDim2.new(0, 200, 0, 200), Position = UDim2.new(0.5, -100, 0.5, -100)}):Play()
    TweenService:Create(Glow, TweenInfo.new(1, Enum.EasingStyle.Quart), {Position = UDim2.new(0, 0, 0.9, 0), BackgroundTransparency = 1}):Play()
    task.wait(1.5)
    
    TweenService:Create(Bg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(RingStroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
    TweenService:Create(Ring, TweenInfo.new(0.5), {Size = UDim2.new(0, 500, 0, 500), Position = UDim2.new(0.5, -250, 0.5, -250)}):Play()
    task.wait(0.6)
    spin:Disconnect()
    IntroGui:Destroy()
end)

task.wait(2.2)
local NoticeGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
NoticeGui.DisplayOrder = 9999
local Overlay = Instance.new("Frame", NoticeGui)
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.4

local Frame = Instance.new("Frame", Overlay)
Frame.Size = UDim2.new(0, 540, 0, 260)
Frame.Position = UDim2.new(0.5, -270, 0.5, -130)
Frame.BackgroundColor3 = Color3.fromRGB(20, 22, 28)
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)
local Stroke = Instance.new("UIStroke", Frame)
Stroke.Color = Color3.fromRGB(0, 170, 255)
Stroke.Thickness = 2

local T = Instance.new("TextLabel", Frame)
T.Size = UDim2.new(1, 0, 0, 50)
T.Position = UDim2.new(0, 0, 0, 20)
T.BackgroundTransparency = 1
T.Text = "【 索尼克造船寻宝 】"
T.TextColor3 = Color3.fromRGB(0, 170, 255)
T.Font = Enum.Font.GothamBold
T.TextSize = 26

local LoadBtn = Instance.new("TextButton", Frame)
LoadBtn.Size = UDim2.new(0, 240, 0, 55)
LoadBtn.Position = UDim2.new(0, 40, 1, -75)
LoadBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
LoadBtn.Text = "确定加载脚本"
LoadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadBtn.Font = Enum.Font.GothamBold
LoadBtn.TextSize = 20
Instance.new("UICorner", LoadBtn).CornerRadius = UDim.new(0, 6)

local CopyBtn = Instance.new("TextButton", Frame)
CopyBtn.Size = UDim2.new(0, 240, 0, 55)
CopyBtn.Position = UDim2.new(1, -280, 1, -75)
CopyBtn.BackgroundColor3 = Color3.fromRGB(50, 55, 65)
CopyBtn.Text = "复制官方群号"
CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.TextSize = 20
Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 6)

CopyBtn.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard("1107284557") end
    CopyBtn.Text = "✅ 已复制"
    task.wait(2)
    CopyBtn.Text = "复制官方群号"
end)

LoadBtn.MouseButton1Click:Connect(function()
    Overlay:Destroy()
    _G.StartUI = true
end)-- =====================================================================
-- [第二段] 长方形高级 UI (带特效)
-- =====================================================================
if not _G.StartUI then return end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", ScreenGui)
-- 初始大小设为 0，用于入场动画
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 28)
MainFrame.BorderSizePixel = 0
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

-- 呼吸流光特效边框
local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(0, 170, 255)
UIStroke.Thickness = 2
task.spawn(function()
    while MainFrame.Parent do
        TweenService:Create(UIStroke, TweenInfo.new(1.5), {Color = Color3.fromRGB(255, 215, 0)}):Play()
        task.wait(1.5)
        TweenService:Create(UIStroke, TweenInfo.new(1.5), {Color = Color3.fromRGB(0, 170, 255)}):Play()
        task.wait(1.5)
    end
end)

-- 弹性入场动画
task.wait(0.1)
TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 600, 0, 320)}):Play()

-- 顶栏
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(0, 300, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "索尼克造船寻宝"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left

local MinBtn = Instance.new("TextButton", TopBar)
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -80, 0, 10)
MinBtn.BackgroundColor3 = Color3.fromRGB(255, 180, 50)
MinBtn.Text = "➖"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 6)

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- 悬浮正方形图标
local MiniIcon = Instance.new("TextButton", ScreenGui)
MiniIcon.Size = UDim2.new(0, 0, 0, 0) -- 初始为0
MiniIcon.Position = UDim2.new(0.5, -30, 0.5, -30)
MiniIcon.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
MiniIcon.Text = "S"
MiniIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
MiniIcon.Font = Enum.Font.GothamBlack
MiniIcon.TextSize = 30
MiniIcon.Visible = false
Instance.new("UICorner", MiniIcon).CornerRadius = UDim.new(0, 12)

-- 【折叠动画】
MinBtn.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.wait(0.3)
    MainFrame.Visible = false
    MiniIcon.Visible = true
    TweenService:Create(MiniIcon, TweenInfo.new(0.4, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Size = UDim2.new(0, 60, 0, 60)}):Play()
end)

-- 【展开动画】
MiniIcon.MouseButton1Click:Connect(function()
    TweenService:Create(MiniIcon, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.wait(0.2)
    MiniIcon.Visible = false
    MainFrame.Visible = true
    TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 600, 0, 320)}):Play()
end)

-- 内容区
local ContentLeft = Instance.new("Frame", MainFrame)
ContentLeft.Size = UDim2.new(0.5, -20, 1, -70)
ContentLeft.Position = UDim2.new(0, 10, 0, 60)
ContentLeft.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
ContentLeft.BorderSizePixel = 0
Instance.new("UICorner", ContentLeft).CornerRadius = UDim.new(0, 8)

local ContentRight = Instance.new("Frame", MainFrame)
ContentRight.Size = UDim2.new(0.5, -20, 1, -70)
ContentRight.Position = UDim2.new(0.5, 10, 0, 60)
ContentRight.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
ContentRight.BorderSizePixel = 0
Instance.new("UICorner", ContentRight).CornerRadius = UDim.new(0, 8)

_G.LeftFrame = ContentLeft
_G.RightFrame = ContentRight
_G.MenuStep2 = true-- =====================================================================
-- [第三段] 右侧挂机引擎
-- =====================================================================
if not _G.MenuStep2 then return end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Right = _G.RightFrame

local isAutoFlying = false

local FarmTitle = Instance.new("TextLabel", Right)
FarmTitle.Size = UDim2.new(1, -20, 0, 30)
FarmTitle.Position = UDim2.new(0, 10, 0, 10)
FarmTitle.BackgroundTransparency = 1
FarmTitle.Text = "造船寻宝挂机"
FarmTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmTitle.Font = Enum.Font.GothamBold
FarmTitle.TextSize = 18
FarmTitle.TextXAlignment = Enum.TextXAlignment.Left

local ToggleBtn = Instance.new("TextButton", Right)
ToggleBtn.Size = UDim2.new(1, -20, 0, 45)
ToggleBtn.Position = UDim2.new(0, 10, 0, 50)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 55, 65)
ToggleBtn.Text = "开启贴水挂机: 关"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 16
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)

-- 按钮悬浮特效
ToggleBtn.MouseEnter:Connect(function() TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {Size = UDim2.new(1, -16, 0, 48), Position = UDim2.new(0, 8, 0, 48)}):Play() end)
ToggleBtn.MouseLeave:Connect(function() TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {Size = UDim2.new(1, -20, 0, 45), Position = UDim2.new(0, 10, 0, 50)}):Play() end)

local function ResetPhysics()
    local char = LocalPlayer.Character
    if not char then return end
    local root, hum = char:FindFirstChild("HumanoidRootPart"), char:FindFirstChild("Humanoid")
    if root and hum then
        hum.PlatformStand = true
        hum:ChangeState(Enum.HumanoidStateType.Physics)
        root.Anchored = false
        root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        for _, c in ipairs(char:GetDescendants()) do
            if (c:IsA("Weld") or c:IsA("WeldConstraint")) and c.Name ~= "RootJoint" then c:Destroy() end
            if c:IsA("BasePart") then c.CanCollide = false end
        end
    end
end

local function FlyLow()
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    ResetPhysics()
    task.wait(0.1)
    
    local targetZ = 8500
    local currentZ = root.Position.Z
    local Y = 12 -- 【贴水面飞，高度12】

    while currentZ < targetZ and isAutoFlying do
        if not char.Parent or char.Humanoid.Health <= 0 then break end
        currentZ = currentZ + 8 -- 速度放缓，确保穿洞
        root.CFrame = CFrame.new(0, Y, currentZ)
        RunService.Heartbeat:Wait()
    end
end

ToggleBtn.MouseButton1Click:Connect(function()
    isAutoFlying = not isAutoFlying
    if isAutoFlying then
        TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(64, 140, 255)}):Play()
        ToggleBtn.Text = "开启贴水挂机: 开"
        task.spawn(function()
            while isAutoFlying do
                local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                if char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                    FlyLow()
                    task.wait(4) 
                else
                    task.wait(1)
                end
            end
        end)
    else
        TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 55, 65)}):Play()
        ToggleBtn.Text = "开启贴水挂机: 关"
    end
end)

local SingleBtn = Instance.new("TextButton", Right)
SingleBtn.Size = UDim2.new(1, -20, 0, 45)
SingleBtn.Position = UDim2.new(0, 10, 0, 105)
SingleBtn.BackgroundColor3 = Color3.fromRGB(64, 140, 255)
SingleBtn.Text = "单次起飞"
SingleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SingleBtn.Font = Enum.Font.GothamBold
SingleBtn.TextSize = 16
Instance.new("UICorner", SingleBtn).CornerRadius = UDim.new(0, 6)

SingleBtn.MouseButton1Click:Connect(function()
    isAutoFlying = true
    task.spawn(function()
        FlyLow()
        isAutoFlying = false
    end)
end)

_G.MenuStep3 = true-- =====================================================================
-- [第四段] 左侧属性滑动条
-- =====================================================================
if not _G.MenuStep3 then return end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Left = _G.LeftFrame

local currentSpeed = 16
local currentJump = 50

-- 防死亡重置
LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1)
    if char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = currentSpeed
        char.Humanoid.JumpPower = currentJump
    end
end)

local AttrTitle = Instance.new("TextLabel", Left)
AttrTitle.Size = UDim2.new(1, -20, 0, 30)
AttrTitle.Position = UDim2.new(0, 10, 0, 10)
AttrTitle.BackgroundTransparency = 1
AttrTitle.Text = "通用属性"
AttrTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
AttrTitle.Font = Enum.Font.GothamBold
AttrTitle.TextSize = 18
AttrTitle.TextXAlignment = Enum.TextXAlignment.Left

local function CreateSlider(yPos, text, min, max, default, callback)
    local row = Instance.new("Frame", Left)
    row.Size = UDim2.new(1, -20, 0, 50)
    row.Position = UDim2.new(0, 10, 0, yPos)
    row.BackgroundTransparency = 1
    
    local lbl = Instance.new("TextLabel", row)
    lbl.Size = UDim2.new(1, 0, 0, 25)
    lbl.BackgroundTransparency = 1
    lbl.Text = text .. ": " .. default
    lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 16
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local barBg = Instance.new("Frame", row)
    barBg.Size = UDim2.new(1, 0, 0, 8)
    barBg.Position = UDim2.new(0, 0, 0, 32)
    barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)
    
    local fill = Instance.new("Frame", barBg)
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(64, 140, 255)
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
    
    local knob = Instance.new("Frame", barBg)
    knob.Size = UDim2.new(0, 18, 0, 18)
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.Position = UDim2.new((default - min) / (max - min), 0, 0.5, 0)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)
    local kSt = Instance.new("UIStroke", knob); kSt.Color = Color3.fromRGB(180, 180, 180)
    
    local hitbox = Instance.new("TextButton", barBg)
    hitbox.Size = UDim2.new(1, 0, 3, 0)
    hitbox.Position = UDim2.new(0, 0, -1, 0)
    hitbox.BackgroundTransparency = 1
    hitbox.Text = ""
    
    local isDragging = false
    local trackX, trackW
    
    local function update(input)
        local pct = math.clamp((input.Position.X - trackX) / trackW, 0, 1)
        fill.Size = UDim2.new(pct, 0, 1, 0)
        knob.Position = UDim2.new(pct, 0, 0.5, 0)
        local val = math.floor(min + (max - min) * pct)
        lbl.Text = text .. ": " .. val
        callback(val)
    end
    
    hitbox.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true; trackX = barBg.AbsolutePosition.X; trackW = barBg.AbsoluteSize.X
            -- 拖动时发光特效
            TweenService:Create(knob, TweenInfo.new(0.2), {Size = UDim2.new(0, 24, 0, 24)}):Play()
            update(input)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then update(input) end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
            isDragging = false 
            TweenService:Create(knob, TweenInfo.new(0.2), {Size = UDim2.new(0, 18, 0, 18)}):Play()
        end
    end)
end

CreateSlider(50, "移动速度", 16, 150, 16, function(val)
    currentSpeed = val
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then char.Humanoid.WalkSpeed = val end
end)

CreateSlider(110, "跳跃高度", 50, 300, 50, function(val)
    currentJump = val
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then char.Humanoid.JumpPower = val end
end)ding = UDim.new(0, 15); l.SortOrder = Enum.SortOrder.LayoutOrder
    
    local title = Instance.new("TextLabel", card)
    title.Size = UDim2.new(1, 0, 0, 25)
    title.BackgroundTransparency = 1
    title.Text = name
    title.TextColor3 = Color3.fromRGB(30, 30, 40)
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 20
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.LayoutOrder = 1
    
    return card
end

local function CreateSlider(parent, text, min, max, default, callback)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1, 0, 0, 50)
    row.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel", row)
    label.Size = UDim2.new(1, 0, 0, 25)
    label.BackgroundTransparency = 1
    label.Text = text .. ": " .. default
    label.TextColor3 = Color3.fromRGB(60, 60, 70)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 18
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local barBg = Instance.new("Frame", row)
    barBg.Size = UDim2.new(1, 0, 0, 8)
    barBg.Position = UDim2.new(0, 0, 0, 32)
    barBg.BackgroundColor3 = Color3.fromRGB(220, 220, 225)
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)
    
    local fill = Instance.new("Frame", barBg)
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(64, 140, 255)
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
    
    local knob = Instance.new("Frame", barBg)
    knob.Size = UDim2.new(0, 18, 0, 18)
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.Position = UDim2.new((default - min) / (max - min), 0, 0.5, 0)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)
    local kSt = Instance.new("UIStroke", knob); kSt.Color = Color3.fromRGB(180, 180, 180)
    
    local hitbox = Instance.new("TextButton", barBg)
    hitbox.Size = UDim2.new(1, 0, 3, 0)
    hitbox.Position = UDim2.new(0, 0, -1, 0)
    hitbox.BackgroundTransparency = 1
    hitbox.Text = ""
    
    local isDragging = false
    local trackX, trackW
    
    local function update(input)
        local pct = math.clamp((input.Position.X - trackX) / trackW, 0, 1)
        fill.Size = UDim2.new(pct, 0, 1, 0)
        knob.Position = UDim2.new(pct, 0, 0.5, 0)
        local val = math.floor(min + (max - min) * pct)
        label.Text = text .. ": " .. val
        callback(val)
    end
    
    hitbox.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true; trackX = barBg.AbsolutePosition.X; trackW = barBg.AbsoluteSize.X; update(input)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then update(input) end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then isDragging = false end
    end)
end

local GeneralCard = CreateCard("通用属性 (防死亡重置)")
CreateSlider(GeneralCard, "移动速度", 16, 150, 16, function(val)
    currentSpeed = val
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then char.Humanoid.WalkSpeed = val end
end)
CreateSlider(GeneralCard, "跳跃高度", 50, 300, 50, function(val)
    currentJump = val
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then char.Humanoid.JumpPower = val end
end)

_G.BoatStep4 = true-- =====================================================================
-- [第五段] 终极飞行避障与挂机引擎
-- =====================================================================
if not _G.BoatStep4 then return end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Content = _G.BoatContent

local isAutoFlying = false

-- 构建挂机卡片
local FarmCard = Instance.new("Frame", Content)
FarmCard.Size = UDim2.new(1, 0, 0, 0)
FarmCard.AutomaticSize = Enum.AutomaticSize.Y
FarmCard.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FarmCard.BorderSizePixel = 0
Instance.new("UICorner", FarmCard).CornerRadius = UDim.new(0, 10)
local pad = Instance.new("UIPadding", FarmCard)
pad.PaddingTop = UDim.new(0, 20); pad.PaddingBottom = UDim.new(0, 20)
pad.PaddingLeft = UDim.new(0, 20); pad.PaddingRight = UDim.new(0, 20)
local l = Instance.new("UIListLayout", FarmCard)
l.Padding = UDim.new(0, 15); l.SortOrder = Enum.SortOrder.LayoutOrder

local fTitle = Instance.new("TextLabel", FarmCard)
fTitle.Size = UDim2.new(1, 0, 0, 25)
fTitle.BackgroundTransparency = 1
fTitle.Text = "造船寻宝 - 极限挂机"
fTitle.TextColor3 = Color3.fromRGB(30, 30, 40)
fTitle.Font = Enum.Font.GothamBlack
fTitle.TextSize = 20
fTitle.TextXAlignment = Enum.TextXAlignment.Left
fTitle.LayoutOrder = 1

-- 开关逻辑
local row = Instance.new("Frame", FarmCard)
row.Size = UDim2.new(1, 0, 0, 35)
row.BackgroundTransparency = 1
row.LayoutOrder = 2

local label = Instance.new("TextLabel", row)
label.Size = UDim2.new(1, -60, 1, 0)
label.BackgroundTransparency = 1
label.Text = "开启无限避障挂机"
label.TextColor3 = Color3.fromRGB(60, 60, 70)
label.Font = Enum.Font.GothamBold
label.TextSize = 18
label.TextXAlignment = Enum.TextXAlignment.Left

local tgBg = Instance.new("Frame", row)
tgBg.Size = UDim2.new(0, 50, 0, 26)
tgBg.Position = UDim2.new(1, -50, 0.5, -13)
tgBg.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
Instance.new("UICorner", tgBg).CornerRadius = UDim.new(1, 0)

local circle = Instance.new("Frame", tgBg)
circle.Size = UDim2.new(0, 22, 0, 22)
circle.Position = UDim2.new(0, 2, 0.5, -11)
circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

local btn = Instance.new("TextButton", tgBg)
btn.Size = UDim2.new(1, 0, 1, 0)
btn.BackgroundTransparency = 1
btn.Text = ""

-- 暴力解卡与飞行逻辑
local function ResetPhysics()
    local char = LocalPlayer.Character
    if not char then return end
    local root, hum = char:FindFirstChild("HumanoidRootPart"), char:FindFirstChild("Humanoid")
    if root and hum then
        hum.PlatformStand = true
        hum:ChangeState(Enum.HumanoidStateType.Physics)
        root.Anchored = false
        root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        root.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        for _, c in ipairs(char:GetDescendants()) do
            if (c:IsA("Weld") or c:IsA("WeldConstraint")) and c.Name ~= "RootJoint" then c:Destroy() end
            if c:IsA("BasePart") then c.CanCollide = false end
        end
    end
end

local function AdvancedFly()
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    ResetPhysics()
    task.wait(0.1)
    
    -- 建立避障射线
    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = {char}
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    
    local targetZ = 8500
    local currentZ = root.Position.Z
    
    -- 高空平滑防抖
    local smoothY = 45
    
    while currentZ < targetZ and isAutoFlying do
        if not char.Parent or char.Humanoid.Health <= 0 then break end
        
        local pos = root.Position
        
        -- 【核心避障雷达】：向前探测 40 格
        local frontHit = workspace:Raycast(Vector3.new(pos.X, pos.Y, pos.Z), Vector3.new(0, 0, 40), rayParams)
        local targetY = 45
        
        -- 遇到墙自动拉高
        if frontHit then targetY = frontHit.Position.Y + 30 end
        
        -- 插值平滑抬升，防止视角乱晃
        smoothY = smoothY + (targetY - smoothY) * 0.3
        
        -- 推进
        currentZ = currentZ + 15
        root.CFrame = CFrame.new(0, smoothY, currentZ)
        
        RunService.Heartbeat:Wait()
    end
end

local state = false
btn.MouseButton1Click:Connect(function()
    state = not state
    isAutoFlying = state
    TweenService:Create(tgBg, TweenInfo.new(0.2), {BackgroundColor3 = state and Color3.fromRGB(64, 140, 255) or Color3.fromRGB(200, 200, 200)}):Play()
    TweenService:Create(circle, TweenInfo.new(0.2), {Position = state and UDim2.new(1, -24, 0.5, -11) or UDim2.new(0, 2, 0.5, -11)}):Play()
    
    if state then
        task.spawn(function()
            while isAutoFlying do
                local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                if char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                    AdvancedFly()
                    -- 飞到终点等待结算重生
                    task.wait(5) 
                else
                    task.wait(1)
                end
            end
        end)
    end
end)

-- 手动单次起飞按钮
local singleBtn = Instance.new("TextButton", FarmCard)
singleBtn.Size = UDim2.new(1, 0, 0, 45)
singleBtn.BackgroundColor3 = Color3.fromRGB(64, 140, 255)
singleBtn.Text = "单次极速避障起飞"
singleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
singleBtn.Font = Enum.Font.GothamBold
singleBtn.TextSize = 18
Instance.new("UICorner", singleBtn).CornerRadius = UDim.new(0, 8)
singleBtn.LayoutOrder = 3

singleBtn.MouseButton1Click:Connect(function()
    local wasAuto = isAutoFlying
    isAutoFlying = true
    task.spawn(function()
        AdvancedFly()
        isAutoFlying = wasAuto
    end)
end)
