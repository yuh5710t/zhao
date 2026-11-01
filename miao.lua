-- =====================================================================
-- 索尼克中心 (极速狂飙版)
-- =====================================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.DisplayOrder = 9999
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 340, 0, 220)
frame.Position = UDim2.new(0.5, -170, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(218, 165, 32)
stroke.Thickness = 1.5

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "【 索尼克中心 】"
title.TextColor3 = Color3.fromRGB(218, 165, 32)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

local desc = Instance.new("TextLabel", frame)
desc.Size = UDim2.new(1, -40, 0, 100)
desc.Position = UDim2.new(0, 20, 0, 55)
desc.BackgroundTransparency = 1
desc.Text = "作者：李佳  等级v12\n\n作者做一半不想做了\n本脚本为半成品，随时可能失效。\n凑合用吧，别指望更新了。"
desc.TextColor3 = Color3.fromRGB(200, 200, 200)
desc.TextSize = 14
desc.Font = Enum.Font.Gotham
desc.TextXAlignment = Enum.TextXAlignment.Left
desc.TextYAlignment = Enum.TextYAlignment.Top

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0, 220, 0, 40)
btn.Position = UDim2.new(0.5, -110, 1, -55)
btn.BackgroundColor3 = Color3.fromRGB(218, 165, 32)
btn.Text = "凑合用（点我启动）"
btn.TextColor3 = Color3.fromRGB(20, 20, 20)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 15
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

btn.MouseButton1Click:Connect(function()
    gui:Destroy()
    
    local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
    local Window = WindUI:CreateWindow({
        Title = "索尼克中心", Author = "李佳", Folder = "SonicCore", Size = UDim2.fromOffset(460, 350), Theme = "Dark"
    })
    
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    local root = char:WaitForChild("HumanoidRootPart")
    local isManualFlying = false
    local isAutoFlying = false

    -- 暴力解卡
    local function ResetPhysics()
        humanoid.PlatformStand = true
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        root.Anchored = false
        root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        root.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        for _, c in ipairs(char:GetDescendants()) do
            if (c:IsA("Weld") or c:IsA("WeldConstraint")) and c.Name ~= "RootJoint" then c:Destroy() end
            if c:IsA("BasePart") then 
                c.CanCollide = false 
                c.Massless = true
            end
        end
    end

    -- 真实终点扫描
    local function GetTargetZ()
        local highestZ = 8500
        for _, obj in pairs(workspace:GetDescendants()) do
            local n = string.lower(obj.Name)
            if (string.find(n, "end") or string.find(n, "win") or string.find(n, "gate") or string.find(n, "door")) and not string.find(n, "wing") then
                local p = obj:IsA("BasePart") and obj.Position or (obj:IsA("Model") and obj.PrimaryPart and obj.PrimaryPart.Position)
                if p and p.Z > highestZ then highestZ = p.Z end
            end
        end
        return highestZ
    end

    -- 【极速狂飙引擎】：速度翻倍，但雷达依然生效
    local function SpeedFly(targetZ, isAutoMode)
        local rayParams = RaycastParams.new()
        rayParams.FilterDescendantsInstances = {char}
        rayParams.FilterType = Enum.RaycastFilterType.Exclude

        local currentZ = root.Position.Z
        local smoothY = 45 
        local speed = 12 -- 【速度拉满】：每帧推进 12 格！

        local stuckCounter = 0

        while currentZ < targetZ do
            if not isAutoMode and not isManualFlying then return end
            if isAutoMode and not isAutoFlying then return end
            
            local pos = root.Position
            
            -- 雷达避障
            local frontHit = workspace:Raycast(Vector3.new(pos.X, pos.Y, pos.Z), Vector3.new(0, 0, 40), rayParams)
            local targetY = 45 
            if frontHit then targetY = frontHit.Position.Y + 30 end
            
            -- 平滑防抖
            smoothY = smoothY + (targetY - smoothY) * 0.3
            
            local oldZ = currentZ
            currentZ = currentZ + speed
            root.CFrame = CFrame.new(0, smoothY, currentZ)
            
            -- 卡死检测
            if math.abs(currentZ - oldZ) < 0.1 then
                stuckCounter = stuckCounter + 1
                if stuckCounter > 5 then
                    ResetPhysics()
                    stuckCounter = 0
                end
            else
                stuckCounter = 0
            end
            
            RunService.Heartbeat:Wait()
        end
    end

    -- 手动飞行面板
    local MainTab = Window:Tab({ Title = "手动巡航", Icon = "anchor" })
    MainTab:Button({
        Title = "启动极速狂飙",
        Callback = function()
            if isManualFlying then return end
            isManualFlying = true
            ResetPhysics()
            task.wait(0.1)
            
            SpeedFly(GetTargetZ(), false)
            
            if isManualFlying then
                humanoid.PlatformStand = false
                for _, p in pairs(char:GetDescendants()) do
                    if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.CanCollide = true end
                end
                root.AssemblyLinearVelocity = Vector3.new(0, -100, 0)
            end
            isManualFlying = false
        end
    })
    
    MainTab:Button({
        Title = "紧急中止",
        Callback = function()
            isManualFlying = false
            ResetPhysics()
            humanoid.PlatformStand = false
        end
    })

    -- 无限挂机面板
    local AutoTab = Window:Tab({ Title = "无限挂机", Icon = "play" })
    AutoTab:Toggle({
        Title = "开启无限极速挂机",
        Desc = "每帧 12 格，狂飙全自动循环",
        Value = false,
        Callback = function(state)
            isAutoFlying = state
            if state then
                task.spawn(function()
                    while isAutoFlying do
                        ResetPhysics()
                        root.CFrame = CFrame.new(0, 45, 0) 
                        task.wait(0.3)
                        
                        SpeedFly(GetTargetZ(), true)
                        
                        if isAutoFlying then
                            humanoid.PlatformStand = false
                            for _, p in pairs(char:GetDescendants()) do
                                if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.CanCollide = true end
                            end
                            root.AssemblyLinearVelocity = Vector3.new(0, -150, 0)
                            task.wait(3) 
                        end
                    end
                end)
            end
        end,
    })

    -- 系统重置
    local SysTab = Window:Tab({ Title = "系统控制", Icon = "settings" })
    SysTab:Button({
        Title = "一键重置全部",
        Callback = function()
            isManualFlying = false
            isAutoFlying = false
            ResetPhysics()
            humanoid.PlatformStand = false
            game:GetService("StarterGui"):SetCore("SendNotification", {Title="重置", Text="功能已全部关闭"})
        end
    })
end)
