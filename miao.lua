-- =====================================================================
-- [第一段] 索尼克 x 造船寻宝 专属开场
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
Bg.BackgroundColor3 = Color3.fromRGB(0, 80, 160) 
Bg.BorderSizePixel = 0

local Wave1 = Instance.new("Frame", Bg)
Wave1.Size = UDim2.new(1, 0, 0, 100)
Wave1.Position = UDim2.new(0, 0, 1, 100)
Wave1.BackgroundColor3 = Color3.fromRGB(0, 130, 220)
Wave1.BorderSizePixel = 0
Instance.new("UICorner", Wave1).CornerRadius = UDim.new(0.1, 0)

local Wave2 = Instance.new("Frame", Bg)
Wave2.Size = UDim2.new(1, 0, 0, 80)
Wave2.Position = UDim2.new(0, 0, 1, 100)
Wave2.BackgroundColor3 = Color3.fromRGB(30, 160, 255)
Wave2.BorderSizePixel = 0
Instance.new("UICorner", Wave2).CornerRadius = UDim.new(0.1, 0)

local Ring = Instance.new("Frame", Bg)
Ring.Size = UDim2.new(0, 0, 0, 0)
Ring.Position = UDim2.new(0.5, 0, 0.45, 0)
Ring.BackgroundTransparency = 1
local RingStroke = Instance.new("UIStroke", Ring)
RingStroke.Color = Color3.fromRGB(255, 215, 0)
RingStroke.Thickness = 14
Instance.new("UICorner", Ring).CornerRadius = UDim.new(1, 0)

local Boat = Instance.new("Frame", Bg)
Boat.Size = UDim2.new(0, 120, 0, 40)
Boat.Position = UDim2.new(-0.2, 0, 0.8, 0)
Boat.BackgroundColor3 = Color3.fromRGB(139, 69, 19)
Instance.new("UICorner", Boat).CornerRadius = UDim.new(0, 10)
local Sail = Instance.new("Frame", Boat)
Sail.Size = UDim2.new(0, 60, 0, 80)
Sail.Position = UDim2.new(0.5, -30, 0, -80)
Sail.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
Instance.new("UICorner", Sail).CornerRadius = UDim.new(0.5, 0)

local Title = Instance.new("TextLabel", Bg)
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Position = UDim2.new(0, 0, 0.55, 0)
Title.BackgroundTransparency = 1
Title.Text = "SONIC BOAT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 50
Title.TextStrokeTransparency = 0
Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Title.TextTransparency = 1

task.spawn(function()
    local spin = RunService.RenderStepped:Connect(function()
        Ring.Rotation = Ring.Rotation + 12
    end)
    TweenService:Create(Ring, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(0, 220, 0, 220), Position = UDim2.new(0.5, -110, 0.45, -110)}):Play()
    TweenService:Create(Wave1, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {Position = UDim2.new(0, 0, 1, -80)}):Play()
    TweenService:Create(Wave2, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {Position = UDim2.new(0, 0, 1, -60)}):Play()
    task.wait(0.3)
    TweenService:Create(Boat, TweenInfo.new(1.5, Enum.EasingStyle.Quart), {Position = UDim2.new(0.35, 0, 0.68, 0)}):Play()
    TweenService:Create(Title, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    task.wait(2)
    
    local outInfo = TweenInfo.new(0.5, Enum.EasingStyle.Exponential)
    TweenService:Create(Bg, outInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(Ring, outInfo, {Size = UDim2.new(0, 500, 0, 500), Position = UDim2.new(0.5, -250, 0.45, -250)}):Play()
    TweenService:Create(RingStroke, outInfo, {Transparency = 1}):Play()
    TweenService:Create(Title, outInfo, {TextTransparency = 1, TextSize = 80}):Play()
    TweenService:Create(Boat, outInfo, {Position = UDim2.new(1.5, 0, 0.68, 0)}):Play()
    TweenService:Create(Wave1, outInfo, {Position = UDim2.new(0, 0, 1, 100)}):Play()
    TweenService:Create(Wave2, outInfo, {Position = UDim2.new(0, 0, 1, 100)}):Play()
    task.wait(0.6)
    spin:Disconnect()
    IntroGui:Destroy()
    _G.BoatStep1 = true
end)-- =====================================================================
-- [第二段] 大字体纯净公告
-- =====================================================================
if not _G.BoatStep1 then return end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

task.wait(3.5)

local NoticeGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
NoticeGui.DisplayOrder = 9999
NoticeGui.IgnoreGuiInset = true

local Overlay = Instance.new("Frame", NoticeGui)
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.4
Overlay.BorderSizePixel = 0

local Frame = Instance.new("Frame", Overlay)
Frame.Size = UDim2.new(0, 560, 0, 300)
Frame.Position = UDim2.new(0.5, -280, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(20, 22, 28) 
Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

local Stroke = Instance.new("UIStroke", Frame)
Stroke.Color = Color3.fromRGB(0, 170, 255)
Stroke.Thickness = 2

local T = Instance.new("TextLabel", Frame)
T.Size = UDim2.new(1, 0, 0, 50)
T.Position = UDim2.new(0, 0, 0, 25)
T.BackgroundTransparency = 1
T.Text = "【 索尼克造船寻宝 】"
T.TextColor3 = Color3.fromRGB(0, 170, 255)
T.Font = Enum.Font.GothamBold
T.TextSize = 28

local D = Instance.new("TextLabel", Frame)
D.Size = UDim2.new(1, -40, 0, 100)
D.Position = UDim2.new(0, 20, 0, 80)
D.BackgroundTransparency = 1
D.Text = "作者：李佳\n\n请选择加载脚本，或复制官方群号获取最新版本。"
D.TextColor3 = Color3.fromRGB(220, 220, 220)
D.Font = Enum.Font.GothamBold
D.TextSize = 18

local LoadBtn = Instance.new("TextButton", Frame)
LoadBtn.Size = UDim2.new(0, 240, 0, 55)
LoadBtn.Position = UDim2.new(0, 30, 1, -75)
LoadBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
LoadBtn.Text = "确定加载脚本"
LoadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadBtn.Font = Enum.Font.GothamBold
LoadBtn.TextSize = 18
Instance.new("UICorner", LoadBtn).CornerRadius = UDim.new(0, 6)

local CopyBtn = Instance.new("TextButton", Frame)
CopyBtn.Size = UDim2.new(0, 240, 0, 55)
CopyBtn.Position = UDim2.new(1, -270, 1, -75)
CopyBtn.BackgroundColor3 = Color3.fromRGB(50, 55, 65)
CopyBtn.Text = "复制官方群号"
CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.TextSize = 18
Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 6)

local QQGroup = "1107284557" 
CopyBtn.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(QQGroup) end
    CopyBtn.Text = "✅ 群号已复制！"
    task.wait(2)
    CopyBtn.Text = "复制官方群号"
end)

LoadBtn.MouseButton1Click:Connect(function()
    Overlay:Destroy()
    _G.BoatStep2 = true
end)-- =====================================================================
-- [第三段] NokiaUI 大字体菜单框架
-- =====================================================================
if not _G.BoatStep2 then return end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SonicNokiaUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = LocalPlayer.PlayerGui

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 520, 0, 400)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(245, 248, 255) 
MainFrame.BorderSizePixel = 0
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(0, 300, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "索尼克造船寻宝"
Title.TextColor3 = Color3.fromRGB(30, 30, 40)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -42, 0, 9)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)
CloseBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false end)

local Content = Instance.new("ScrollingFrame", MainFrame)
Content.Size = UDim2.new(1, -40, 1, -80)
Content.Position = UDim2.new(0, 20, 0, 60)
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.ScrollBarThickness = 4
Content.ScrollBarImageColor3 = Color3.fromRGB(64, 140, 255)

local Layout = Instance.new("UIListLayout", Content)
Layout.Padding = UDim.new(0, 20)
Layout.SortOrder = Enum.SortOrder.LayoutOrder

_G.BoatContent = Content
_G.BoatStep3 = true-- =====================================================================
-- [第四段] UI 组件与属性控制
-- =====================================================================
if not _G.BoatStep3 then return end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Content = _G.BoatContent

local currentSpeed = 16
local currentJump = 50

-- 防死亡失效
LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1)
    if char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = currentSpeed
        char.Humanoid.JumpPower = currentJump
    end
end)

local function CreateCard(name)
    local card = Instance.new("Frame", Content)
    card.Size = UDim2.new(1, 0, 0, 0)
    card.AutomaticSize = Enum.AutomaticSize.Y
    card.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    card.BorderSizePixel = 0
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)
    
    local pad = Instance.new("UIPadding", card)
    pad.PaddingTop = UDim.new(0, 20); pad.PaddingBottom = UDim.new(0, 20)
    pad.PaddingLeft = UDim.new(0, 20); pad.PaddingRight = UDim.new(0, 20)
    
    local l = Instance.new("UIListLayout", card)
    l.Padding = UDim.new(0, 15); l.SortOrder = Enum.SortOrder.LayoutOrder
    
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
