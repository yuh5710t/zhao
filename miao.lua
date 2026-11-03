-- =====================================================================
-- 索尼克造船寻宝 [第一段]：经典开场 + 确认/复制公告
-- =====================================================================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- ==========================================
-- 1. 经典 2D 索尼克加载动画
-- ==========================================
local IntroGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
IntroGui.DisplayOrder = 99999
IntroGui.IgnoreGuiInset = true

-- 经典索尼克纯蓝背景
local Bg = Instance.new("Frame", IntroGui)
Bg.Size = UDim2.new(1, 0, 1, 0)
Bg.BackgroundColor3 = Color3.fromRGB(0, 100, 200) -- 经典蓝
Bg.BorderSizePixel = 0

-- 经典 2D 金环
local Ring = Instance.new("Frame", Bg)
Ring.Size = UDim2.new(0, 0, 0, 0)
Ring.Position = UDim2.new(0.5, 0, 0.45, 0)
Ring.BackgroundTransparency = 1
local RingStroke = Instance.new("UIStroke", Ring)
RingStroke.Color = Color3.fromRGB(255, 215, 0) -- 纯金
RingStroke.Thickness = 16
Instance.new("UICorner", Ring).CornerRadius = UDim.new(1, 0)

-- 经典文字
local Title = Instance.new("TextLabel", Bg)
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Position = UDim2.new(0, 0, 0.55, 0)
Title.BackgroundTransparency = 1
Title.Text = "SONIC"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 48
Title.TextStrokeTransparency = 0
Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Title.TextTransparency = 1

-- 启动动画执行
task.spawn(function()
    TweenService:Create(Ring, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 200, 0, 200), Position = UDim2.new(0.5, -100, 0.45, -100)}):Play()
    TweenService:Create(Title, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
    
    local spin = RunService.RenderStepped:Connect(function()
        Ring.Rotation = Ring.Rotation + 10
    end)
    
    task.wait(2)
    
    local outInfo = TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
    TweenService:Create(Bg, outInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(Ring, outInfo, {Size = UDim2.new(0, 600, 0, 600), Position = UDim2.new(0.5, -300, 0.45, -300)}):Play()
    TweenService:Create(RingStroke, outInfo, {Transparency = 1}):Play()
    TweenService:Create(Title, outInfo, {TextTransparency = 1, TextSize = 80}):Play()
    
    task.wait(0.8)
    spin:Disconnect()
    IntroGui:Destroy()
end)

-- ==========================================
-- 2. 确认公告 (左加载，右复制)
-- ==========================================
task.wait(3)
local NoticeGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
NoticeGui.DisplayOrder = 9999

local Overlay = Instance.new("Frame", NoticeGui)
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.4
Overlay.BorderSizePixel = 0

local Frame = Instance.new("Frame", Overlay)
Frame.Size = UDim2.new(0, 520, 0, 280)
Frame.Position = UDim2.new(0.5, -260, 0.5, -140)
Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)
local Stroke = Instance.new("UIStroke", Frame)
Stroke.Color = Color3.fromRGB(0, 150, 255)
Stroke.Thickness = 2

local T = Instance.new("TextLabel", Frame)
T.Size = UDim2.new(1, 0, 0, 50)
T.Position = UDim2.new(0, 0, 0, 20)
T.BackgroundTransparency = 1
T.Text = "【 索尼克造船寻宝 】"
T.TextColor3 = Color3.fromRGB(0, 150, 255)
T.Font = Enum.Font.GothamBold
T.TextSize = 24

local D = Instance.new("TextLabel", Frame)
D.Size = UDim2.new(1, -40, 0, 100)
D.Position = UDim2.new(0, 20, 0, 70)
D.BackgroundTransparency = 1
D.Text = "作者：李佳\n\n请选择加载脚本，或复制官方群号获取最新版本。"
D.TextColor3 = Color3.fromRGB(200, 200, 200)
D.Font = Enum.Font.Gotham
D.TextSize = 16

-- 左边的按钮：确定加载
local LoadBtn = Instance.new("TextButton", Frame)
LoadBtn.Size = UDim2.new(0, 220, 0, 50)
LoadBtn.Position = UDim2.new(0, 30, 1, -70)
LoadBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
LoadBtn.Text = "确定加载脚本"
LoadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadBtn.Font = Enum.Font.GothamBold
LoadBtn.TextSize = 16
Instance.new("UICorner", LoadBtn).CornerRadius = UDim.new(0, 6)

-- 右边的按钮：复制群号
local CopyBtn = Instance.new("TextButton", Frame)
CopyBtn.Size = UDim2.new(0, 220, 0, 50)
CopyBtn.Position = UDim2.new(1, -250, 1, -70)
CopyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
CopyBtn.Text = "复制官方群号"
CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.TextSize = 16
Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 6)

-- 【群号已填入】：1107284557
local QQGroup = "1107284557" 
CopyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(QQGroup)
        CopyBtn.Text = "✅ 群号已复制！"
        task.wait(2)
        CopyBtn.Text = "复制官方群号"
    end
end)

-- 加载脚本逻辑 (触发第二段)
LoadBtn.MouseButton1Click:Connect(function()
    Overlay:Destroy()
    _G.SonicStart = true -- 给第二段传递启动信号
end)-- =====================================================================
-- 索尼克造船寻宝 [第二段]：高级悬浮窗 + 挂机 + 通用功能
-- =====================================================================
if not _G.SonicStart then return end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- 1. 高级 WindUI 构建
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "索尼克造船寻宝", Author = "李佳", Folder = "SonicBoat", Size = UDim2.fromOffset(480, 380), Theme = "Dark", Transparent = true
})

-- 全局状态与默认值
local isAutoFlying = false
local defaultSpeed = 16
local defaultJump = 50
local currentSpeed = defaultSpeed
local currentJump = defaultJump

-- 2. 核心物理引擎 (解卡 + 强推)
local function ResetPhysics()
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    if not root or not hum then return end
    
    hum.PlatformStand = true
    hum:ChangeState(Enum.HumanoidStateType.Physics)
    root.Anchored = false
    root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    for _, c in ipairs(char:GetDescendants()) do
        if (c:IsA("Weld") or c:IsA("WeldConstraint")) and c.Name ~= "RootJoint" then c:Destroy() end
        if c:IsA("BasePart") then c.CanCollide = false end
    end
end

local function Fly()
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    ResetPhysics()
    task.wait(0.1)
    
    local targetZ = 8500
    local cz = root.Position.Z
    
    while cz < targetZ and (isAutoFlying) do
        if not char.Parent or char.Humanoid.Health <= 0 then break end
        cz = cz + 15
        root.CFrame = CFrame.new(0, 45, cz)
        RunService.Heartbeat:Wait()
    end
end

-- 3. 帧率显示器 (FPS) 逻辑
local fpsGui = Instance.new("ScreenGui")
fpsGui.Name = "FPS_Monitor"
fpsGui.ResetOnSpawn = false
fpsGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local fpsLabel = Instance.new("TextLabel", fpsGui)
fpsLabel.Size = UDim2.new(0, 100, 0, 30)
fpsLabel.Position = UDim2.new(0, 10, 0, 10)
fpsLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
fpsLabel.BackgroundTransparency = 0.5
fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
fpsLabel.Font = Enum.Font.Code
fpsLabel.TextSize = 14
fpsLabel.Text = "FPS: 60"
fpsLabel.Visible = false
Instance.new("UICorner", fpsLabel).CornerRadius = UDim.new(0, 4)

-- 帧率计算线程
local frames = 0
local lastTime = tick()
RunService.RenderStepped:Connect(function()
    frames = frames + 1
    if tick() - lastTime >= 1 then
        if fpsLabel.Visible then
            fpsLabel.Text = "FPS: " .. frames
        end
        frames = 0
        lastTime = tick()
    end
end)

-- 4. 角色重生监听 (保持修改的属性不丢失)
LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1) -- 等待角色加载
    if char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = currentSpeed
        char.Humanoid.JumpPower = currentJump
    end
end)

-- ==========================================
-- UI 面板挂载
-- ==========================================

-- 标签页 1：自动巡航
local MainTab = Window:Tab({ Title = "自动巡航", Icon = "anchor" })
MainTab:Button({
    Title = "单次极速起飞",
    Callback = function()
        isAutoFlying = false
        task.spawn(function()
            local temp = isAutoFlying
            isAutoFlying = true
            Fly()
            isAutoFlying = temp
        end)
    end
})
MainTab:Toggle({
    Title = "开启无限全自动挂机",
    Desc = "死循环复活起飞，无需人工干预",
    Value = false,
    Callback = function(s)
        isAutoFlying = s
        if s then
            task.spawn(function()
                while isAutoFlying do
                    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                    if char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                        Fly()
                        task.wait(5) 
                    else
                        task.wait(1)
                    end
                end
            end)
        end
    end
})

-- 标签页 2：通用功能 (全新添加)
local GeneralTab = Window:Tab({ Title = "通用功能", Icon = "settings" })

GeneralTab:Toggle({
    Title = "显示实时帧率 (FPS)",
    Desc = "在屏幕左上角显示当前游戏帧数",
    Value = false,
    Callback = function(state)
        fpsLabel.Visible = state
    end
})

GeneralTab:Slider({
    Title = "移动速度调整",
    Desc = "拉取滑动条调整人物行走速度 (默认16)",
    Value = {
        Min = 16,
        Max = 150,
        Default = 16,
    },
    Callback = function(val)
        currentSpeed = val
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = val
        end
    end
})

GeneralTab:Slider({
    Title = "跳跃高度调整",
    Desc = "拉取滑动条调整人物跳跃力 (默认50)",
    Value = {
        Min = 50,
        Max = 300,
        Default = 50,
    },
    Callback = function(val)
        currentJump = val
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = val
        end
    end
})
