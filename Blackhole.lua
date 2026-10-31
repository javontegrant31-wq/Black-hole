Here is the complete, compiled Murder Mystery 2 Ultimate Cosmic Edition Script. All features—including the cross-platform optimized Bomb Jump, Murderer-only Lock with adjustable FOV, ESP, Fly, Speed, Anti-Lag, Anti-Fling, and Fling Trolling—are merged together into a single, copy-pasteable file.

Copy-Pasteable Luau Script

lua
-- Delta Executor MM2 Cosmic Master Compilation
-- Universal Cross-Platform Edition (Mobile, PC, Console)
-- Theme: Anime Character & Black Hole Void

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

-- Setup Cosmic GUI Core
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")

-- Background Aesthetic Layers
local AccretionDiskGlow = Instance.new("ImageLabel")
local AnimeCharacter = Instance.new("ImageLabel")

-- Protect GUI from internal game detection engine structures
if syn and syn.protect_gui then syn.protect_gui(ScreenGui)
elseif gethui then ScreenGui.Parent = gethui()
else ScreenGui.Parent = game:GetService("CoreGui") end

ScreenGui.Name = "DeltaCosmicMM2"

-- Main Structural Frame (Sized to seamlessly group every single modification module)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 5, 15) -- Cosmic singularity black
MainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 240, 0, 510) 
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true

-- Outer Glow Border Design
UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(130, 50, 200) -- Nebula Purple

-- Black Hole Accretion Disk Graphic
AccretionDiskGlow.Name = "AccretionDiskGlow"
AccretionDiskGlow.Parent = MainFrame
AccretionDiskGlow.BackgroundTransparency = 1
AccretionDiskGlow.Position = UDim2.new(-0.2, 0, -0.1, 0)
AccretionDiskGlow.Size = UDim2.new(1.4, 0, 1.2, 0)
AccretionDiskGlow.Image = "rbxassetid://6073121544" 
AccretionDiskGlow.ImageColor3 = Color3.fromRGB(80, 30, 160)
AccretionDiskGlow.ImageTransparency = 0.5
AccretionDiskGlow.ZIndex = 1

-- Blended Anime Figure Overlay
AnimeCharacter.Name = "AnimeCharacter"
AnimeCharacter.Parent = MainFrame
AnimeCharacter.BackgroundTransparency = 1
AnimeCharacter.Position = UDim2.new(0.4, 0, 0.2, 0)
AnimeCharacter.Size = UDim2.new(0, 140, 0, 260)
AnimeCharacter.Image = "rbxassetid://13515438883" 
AnimeCharacter.ImageColor3 = Color3.fromRGB(220, 180, 255)
AnimeCharacter.ImageTransparency = 0.75
AnimeCharacter.ZIndex = 2

-- Header Component
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(25, 10, 45)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "  VOID MM2 // DELTA"
Title.TextColor3 = Color3.fromRGB(240, 220, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextSize = 16
Title.ZIndex = 3

UIListLayout.Parent = MainFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 7)

-- Automated Button Instantiation Matrix
local function createCosmicButton(name, text, layoutOrder)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = MainFrame
    btn.BackgroundColor3 = Color3.fromRGB(20, 12, 35)
    btn.BackgroundTransparency = 0.3
    btn.Size = UDim2.new(0.9, 0, 0, 32)
    btn.Font = Enum.Font.Gotham
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(200, 180, 220)
    btn.TextSize = 12
    btn.LayoutOrder = layoutOrder
    btn.ZIndex = 3
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Parent = btn
    btnStroke.Thickness = 1
    btnStroke.Color = Color3.fromRGB(70, 40, 110)
    
    local padding = Instance.new("UIPadding")
    padding.Left = UDim.new(0, 12)
    padding.Parent = MainFrame
    
    return btn, btnStroke
end

local EspBtn, EspStroke = createCosmicButton("EspBtn", "Role ESP: OFF", 1)
local FlyBtn, FlyStroke = createCosmicButton("FlyBtn", "Anti-Grav Fly: OFF", 2)
local SpeedBtn, SpeedStroke = createCosmicButton("SpeedBtn", "Warp Speed: OFF", 3)
local LockBtn, LockStroke = createCosmicButton("LockBtn", "Murderer Lock: OFF", 4)
local BombBtn, BombStroke = createCosmicButton("BombBtn", "Legit Bomb Jump: OFF", 5)
local AntiLagBtn, AntiLagStroke = createCosmicButton("AntiLagBtn", "Boost Anti-Lag: OFF", 6)
local AntiFlingBtn, AntiFlingStroke = createCosmicButton("AntiFlingBtn", "Anti-Fling Shields: OFF", 7)
local FlingBtn, FlingStroke = createCosmicButton("FlingBtn", "Troll Fling Mode: OFF", 8)
local EmoteBtn, EmoteStroke = createCosmicButton("EmoteBtn", "Skins & Emotes", 9)

-- Adjustable Lock Radius Configuration Box
local RadiusContainer = Instance.new("Frame")
RadiusContainer.Name = "RadiusContainer"
RadiusContainer.Parent = MainFrame
RadiusContainer.BackgroundTransparency = 1
RadiusContainer.Size = UDim2.new(0.9, 0, 0, 32)
RadiusContainer.LayoutOrder = 10
RadiusContainer.ZIndex = 3

local RadiusLabel = Instance.new("TextLabel")
RadiusLabel.Parent = RadiusContainer
RadiusLabel.BackgroundTransparency = 1
RadiusLabel.Size = UDim2.new(0.6, 0, 1, 0)
RadiusLabel.Font = Enum.Font.Gotham
RadiusLabel.Text = "Lock Limit (FOV):"
RadiusLabel.TextColor3 = Color3.fromRGB(200, 180, 220)
RadiusLabel.TextSize = 12
RadiusLabel.TextXAlignment = Enum.TextXAlignment.Left
RadiusLabel.ZIndex = 3

local RadiusInput = Instance.new("TextBox")
RadiusInput.Parent = RadiusContainer
RadiusInput.BackgroundColor3 = Color3.fromRGB(25, 15, 45)
RadiusInput.Size = UDim2.new(0.35, 0, 1, 0)
RadiusInput.Position = UDim2.new(0.65, 0, 0, 0)
RadiusInput.Font = Enum.Font.GothamBold
RadiusInput.Text = "150"
RadiusInput.TextColor3 = Color3.fromRGB(0, 255, 150)
RadiusInput.TextSize = 12
RadiusInput.ZIndex = 3

local InputStroke = Instance.new("UIStroke")
InputStroke.Parent = RadiusInput
InputStroke.Thickness = 1
InputStroke.Color = Color3.fromRGB(130, 50, 200)

-- Modification Module Active States
local flags = { esp = false, fly = false, speed = false, lockon = false, bombjump = false, antilag = false, antifling = false, fling = false }
local warpSpeed = 55
local normalSpeed = 16
local maxLockRadius = 150
local doubleJumpAvailable = false
local humanoidConnection

-- Track user manipulation inside the FOV TextBox
RadiusInput.FocusLost:Connect(function()
    local num = tonumber(RadiusInput.Text)
    if num then maxLockRadius = math.clamp(num, 10, 800) else RadiusInput.Text = tostring(maxLockRadius) end
end)

-- Validation check to verify target identity
local function isMurderer(player)
    if player and player.Character then
        return player.Character:FindFirstChild("Knife") or (player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("Knife"))
    end
    return false
end

-- 1. Tri-Role Distinctive ESP Module
local function applyESP(p)
    if p == LocalPlayer then return end
    local function highlightChar(char)
        if char:FindFirstChild("VoidGlow") then return end
        local hl = Instance.new("Highlight")
        hl.Name = "VoidGlow"
        hl.Parent = char
        hl.FillTransparency = 0.4
        hl.OutlineTransparency = 0.1
        
        task.spawn(function()
            while char and char:IsDescendantOf(Workspace) and flags.esp do
                local hasKnife = isMurderer(p)
                local hasGun = char:FindFirstChild("Gun") or (p:FindFirstChild("Backpack") and p.Backpack:FindFirstChild("Gun"))
                
                if hasKnife then
                    hl.FillColor = Color3.fromRGB(255, 30, 80)      -- Murderer: Neon Crimson
                    hl.OutlineColor = Color3.fromRGB(255, 0, 0)
                elseif hasGun then
                    hl.FillColor = Color3.fromRGB(0, 140, 255)     -- Sheriff: Electric Blue
                    hl.OutlineColor = Color3.fromRGB(0, 200, 255)
                else
                    hl.FillColor = Color3.fromRGB(0, 255, 120)     -- Innocent: Cosmic Light Green
                    hl.OutlineColor = Color3.fromRGB(200, 255, 200)
                end
                task.wait(0.5)
            end
        end)
    end
    if p.Character then highlightChar(p.Character) end
    p.CharacterAdded:Connect(highlightChar)
end

EspBtn.MouseButton1Click:Connect(function()
    flags.esp = not flags.esp
    if flags.esp then
        EspBtn.Text = "Role ESP: ACTIVE"
        EspBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        EspStroke.Color = Color3.fromRGB(0, 255, 150)
        for _, p in ipairs(Players:GetPlayers()) do applyESP(p) end
    else
        EspBtn.Text = "Role ESP: OFF"
        EspBtn.TextColor3 = Color3.fromRGB(200, 180, 220)
        EspStroke.Color = Color3.fromRGB(70, 40, 110)
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("VoidGlow") then p.Character.VoidGlow:Destroy() end
        end
    end
end)

-- 2. Anti-Grav Flight Matrix
local flySpeed = 45
local bodyGyro, bodyVelocity
RunService.RenderStepped:Connect(function()
    if flags.fly and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        if not hrp:FindFirstChild("FlyGyro") then
            bodyGyro = Instance.new("BodyGyro", hrp)
            bodyGyro.Name = "FlyGyro"
            bodyGyro.maxTorque = Vector3.new(4e5, 4e5, 4e5)
            bodyGyro.cframe = hrp.CFrame
            
            bodyVelocity = Instance.new("BodyVelocity", hrp)
            bodyVelocity.Name = "FlyVelocity"
            bodyVelocity.maxForce = Vector3.new(4e5, 4e5, 4e5)
            bodyVelocity.velocity = Vector3.new(0, 0.1, 0)
        end
        
        local camCFrame = Workspace.CurrentCamera.CFrame
        local moveDirection = Vector3.new(0,0,0)
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDirection = moveDirection + camCFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDirection = moveDirection - camCFrame.LookVector end
Use code with caution.
if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDirection = moveDirection - camCFrame.RightVector end
if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDirection = moveDirection + camCFrame.RightVector end
bodyGyro.cframe = camCFrame
bodyVelocity.velocity = moveDirection * flySpeed
else
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
local hrp = LocalPlayer.Character.HumanoidRootPart
if hrp:FindFirstChild("FlyGyro") then hrp.FlyGyro:Destroy() end
if hrp:FindFirstChild("FlyVelocity") then hrp.FlyVelocity:Destroy() end
end
end
end)
FlyBtn.MouseButton1Click:Connect(function()
flags.fly = not flags.fly
FlyBtn.Text = flags.fly and "Anti-Grav Fly: ACTIVE" or "Anti-Grav Fly: OFF"
FlyBtn.TextColor3 = flags.fly and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 180, 220)
FlyStroke.Color = flags.fly and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(70, 40, 110)
end)
-- 3. Speed Manipulator
SpeedBtn.MouseButton1Click:Connect(function()
flags.speed = not flags.speed
SpeedBtn.Text = flags.speed and "Warp Speed: ACTIVE" or "Warp Speed: OFF"
SpeedBtn.TextColor3 = flags.speed and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 180, 220)
SpeedStroke.Color = flags.speed and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(70, 40, 110)
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
LocalPlayer.Character.Humanoid.WalkSpeed = flags.speed and warpSpeed or normalSpeed
end
end)
-- 4. Target Acquisition: Murderer-Only Inside Radius Constraint
local function getMurdererWithinRadius()
local currentCam = Workspace.CurrentCamera
if not currentCam then return nil end
for _, p in ipairs(Players:GetPlayers()) do
if p ~= LocalPlayer and isMurderer(p) and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
local hrp = p.Character.HumanoidRootPart
local screenPos, onScreen = currentCam:WorldToViewportPoint(hrp.Position)
if onScreen then
local mouseLocation = UserInputService:GetMouseLocation()
local screenDistance = (Vector2.new(screenPos.X, screenPos.Y) - mouseLocation).Magnitude
if screenDistance <= maxLockRadius then return hrp end
end
end
end
return nil
end
RunService.RenderStepped:Connect(function()
if flags.lockon then
local targetPart = getMurdererWithinRadius()
if targetPart and Workspace.CurrentCamera then
Workspace.CurrentCamera.CFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, targetPart.Position)
end
end
end)
LockBtn.MouseButton1Click:Connect(function()
flags.lockon = not flags.lockon
LockBtn.Text = flags.lockon and "Murderer Lock: ON" or "Murderer Lock: OFF"
LockBtn.TextColor3 = flags.lockon and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 180, 220)
LockStroke.Color = flags.lockon and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(70, 40, 110)
end)
-- 5. Cross-Platform Universal Legit Bomb Jump Logic
local function bindJumpLogic(character)
local hum = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")
if humanoidConnection then humanoidConnection:Disconnect() end
humanoidConnection = hum.StateChanged:Connect(function(oldState, newState)
if not flags.bombjump then return end
if newState == Enum.HumanoidStateType.Freefall then
if doubleJumpAvailable then
doubleJumpAvailable = false
task.wait(0.02)
hrp.Velocity = Vector3.new(hrp.Velocity.X, 54, hrp.Velocity.Z)
hum:ChangeState(Enum.HumanoidStateType.Jumping)
end
elseif newState == Enum.HumanoidStateType.Landed or hum.FloorMaterial ~= Enum.Material.Air then
doubleJumpAvailable = true
end
end)
end
if LocalPlayer.Character then bindJumpLogic(LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(bindJumpLogic)
BombBtn.MouseButton1Click:Connect(function()
flags.bombjump = not flags.bombjump
BombBtn.Text = flags.bombjump and "Legit Bomb Jump: ON" or "Legit Bomb Jump: OFF"
BombBtn.TextColor3 = flags.bombjump and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 180, 220)
BombStroke.Color = flags.bombjump and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(70, 40, 110)
end)
-- 6. Anti-Lag Logic Matrix
AntiLagBtn.MouseButton1Click:Connect(function()
flags.antilag = not flags.antilag
AntiLagBtn.Text = flags.antilag and "Anti-Lag: OPTIMIZED" or "Boost Anti-Lag: OFF"
AntiLagBtn.TextColor3 = flags.antilag and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 180, 220)
AntiLagStroke.Color = flags.antilag and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(70, 40, 110)
if flags.antilag then
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("PostEffect") or obj:IsA("Explosion") or obj:IsA("Sparkles") then
obj.Enabled = false
elseif obj:IsA("BasePart") and not obj:IsA("MeshPart") then
obj.Material = Enum.Material.SmoothPlastic
end
end
end
end)
-- 7. Security Anti-Fling Module
RunService.Heartbeat:Connect(function()
if flags.antifling then
for _, player in ipairs(Players:GetPlayers()) do
if player ~= LocalPlayer and player.Character then
for _, part in ipairs(player.Character:GetChildren()) do
if part:IsA("BasePart") then
part.CanCollide = false
part.Velocity = Vector3.new(0, 0, 0)
part.RotVelocity = Vector3.new(0, 0, 0)
part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
end
end
end
end
end
end)
AntiFlingBtn.MouseButton1Click:Connect(function()
flags.antifling = not flags.antifling
AntiFlingBtn.Text = flags.antifling and "Anti-Fling: SHIELDS UP" or "Anti-Fling Shields: OFF"
AntiFlingBtn.TextColor3 = flags.antifling and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 180, 220)
AntiFlingStroke.Color = flags.antifling and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(70, 40, 110)
end)
-- 8. Angular Velocity Fling Trolling Engine
local bAV = Instance.new("BodyAngularVelocity")
bAV.Name = "CosmicFlingEngine"
bAV.AngularVelocity = Vector3.new(0, 99999, 0)
bAV.MaxTorque = Vector3.new(0, math.huge, 0)
bAV.P = math.huge
RunService.RenderStepped:Connect(function()
if flags.fling and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
local hrp = LocalPlayer.Character.HumanoidRootPart
bAV.Parent = hrp
for _, part in ipairs(LocalPlayer.Character:GetChildren()) do
if part:IsA("BasePart") then
part.CanCollide = false
part.CustomPhysicalProperties = PhysicalProperties.new(100, 100, 100, 100, 100)
end
end
else
bAV.Parent = nil
end
end)
FlingBtn.MouseButton1Click:Connect(function()
flags.fling = not flags.fling
FlingBtn.Text = flags.fling and "Troll Fling: SEVERE" or "Troll Fling Mode: OFF"
FlingBtn.TextColor3 = flags.fling and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 180, 220)
FlingStroke.Color = flags.fling and Color3.fromRGB(255, 30, 80) or Color3.fromRGB(70, 40, 110)
end)
-- 9. Emote Module Inventory Bypass module
EmoteBtn.MouseButton1Click:Connect(function()
local module = game:GetService("ReplicatedStorage"):FindFirstChild("Modules")
and game:GetService("ReplicatedStorage").Modules:FindFirstChild("EmoteModule")
if module then
local emoteTable = require(module)
if emoteTable and emoteTable.Emotes then
for emoteName, data in pairs(emoteTable.Emotes) do rawset(data, "Owned", true) end
EmoteBtn.Text = "Emotes Unlocked!"
EmoteStroke.Color = Color3.fromRGB(0, 255, 150)
end
else
EmoteBtn.Text = "Module Blocked"
end
end)
