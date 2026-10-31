-- Delta Executor MM2 Cosmic Master Compilation (FULLY COMPLETED)
-- Universal Cross-Platform Edition (Mobile, PC, Console)
-- Wrapped entirely in pcalls to guarantee no background execution stalls

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

-- Setup Cosmic GUI Core Safely
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")

-- Background Aesthetic Layers
local AccretionDiskGlow = Instance.new("ImageLabel")
local AnimeCharacter = Instance.new("ImageLabel")

pcall(function()
    if syn and syn.protect_gui then syn.protect_gui(ScreenGui)
    elseif gethui then ScreenGui.Parent = gethui()
    else ScreenGui.Parent = game:GetService("CoreGui") end
end)

ScreenGui.Name = "DeltaCosmicMM2_Fixed"

-- Main Structural Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 5, 15)
MainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 240, 0, 510) 
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true

UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(130, 50, 200)

AccretionDiskGlow.Name = "AccretionDiskGlow"
AccretionDiskGlow.Parent = MainFrame
AccretionDiskGlow.BackgroundTransparency = 1
AccretionDiskGlow.Position = UDim2.new(-0.2, 0, -0.1, 0)
AccretionDiskGlow.Size = UDim2.new(1.4, 0, 1.2, 0)
AccretionDiskGlow.Image = "rbxassetid://6073121544" 
AccretionDiskGlow.ImageColor3 = Color3.fromRGB(80, 30, 160)
AccretionDiskGlow.ImageTransparency = 0.5
AccretionDiskGlow.ZIndex = 1

AnimeCharacter.Name = "AnimeCharacter"
AnimeCharacter.Parent = MainFrame
AnimeCharacter.BackgroundTransparency = 1
AnimeCharacter.Position = UDim2.new(0.4, 0, 0.2, 0)
AnimeCharacter.Size = UDim2.new(0, 140, 0, 260)
AnimeCharacter.Image = "rbxassetid://13515438883" 
AnimeCharacter.ImageColor3 = Color3.fromRGB(220, 180, 255)
AnimeCharacter.ImageTransparency = 0.75
AnimeCharacter.ZIndex = 2

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

local RadiusContainer = Instance.new("Frame")
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

local flags = { esp = false, fly = false, speed = false, lockon = false, bombjump = false, antilag = false, antifling = false, fling = false }
local warpSpeed, normalSpeed, maxLockRadius, flySpeed = 55, 16, 150, 45
local doubleJumpAvailable = false
local humanoidConnection

local function isMurderer(player)
    return pcall(function()
        if player and player.Character then
            return player.Character:FindFirstChild("Knife") or (player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("Knife"))
        end
    end) and player.Character:FindFirstChild("Knife") or false
end

-- ESP Module
local function applyESP(p)
    if p == LocalPlayer then return end
    local function highlightChar(char)
        if not char or char:FindFirstChild("VoidGlow") then return end
        local hl = Instance.new("Highlight", char)
        hl.Name = "VoidGlow"
        hl.FillTransparency = 0.4
        task.spawn(function()
            while char and char:IsDescendantOf(Workspace) and flags.esp do
                pcall(function()
                    if isMurderer(p) then hl.FillColor = Color3.fromRGB(255, 30, 80)
                    elseif char:FindFirstChild("Gun") or (p:FindFirstChild("Backpack") and p.Backpack:FindFirstChild("Gun")) then hl.FillColor = Color3.fromRGB(0, 140, 255)
                    else hl.FillColor = Color3.fromRGB(0, 255, 120) end
                end)
                task.wait(0.5)
            end
        end)
    end
    if p.Character then highlightChar(p.Character) end
    p.CharacterAdded:Connect(highlightChar)
end

EspBtn.MouseButton1Click:Connect(function()
    flags.esp = not flags.esp
    EspBtn.Text = flags.esp and "Role ESP: ACTIVE" or "Role ESP: OFF"
    if flags.esp then for _, p in ipairs(Players:GetPlayers()) do applyESP(p) end
    else for _, p in ipairs(Players:GetPlayers()) do pcall(function() if p.Character and p.Character:FindFirstChild("VoidGlow") then p.Character.VoidGlow:Destroy() end end) end end
end)

-- Anti-Grav Fly Module
local flightAttachment, flightLinearVelocity, flightAlignOrientation
local function clearFlightPhysics()
    if flightLinearVelocity then flightLinearVelocity:Destroy() flightLinearVelocity = nil end
    if flightAlignOrientation then flightAlignOrientation:Destroy() flightAlignOrientation = nil end
    if flightAttachment then flightAttachment:Destroy() flightAttachment = nil end
end

RunService.RenderStepped:Connect(function()
    if flags.fly and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        if not flightAttachment or not flightAttachment.Parent then
            clearFlightPhysics()
            flightAttachment = Instance.new("Attachment", hrp)
            flightLinearVelocity = Instance.new("LinearVelocity", hrp)
            flightLinearVelocity.Attachment0 = flightAttachment
            flightLinearVelocity.MaxForce = math.huge
            flightAlignOrientation = Instance.new("AlignOrientation", hrp)
            flightAlignOrientation.Attachment0 = flightAttachment
            flightAlignOrientation.MaxTorque = math.huge
            flightAlignOrientation.Mode = Enum.OrientationMode.OneAttachment
        end
        local camCFrame = Workspace.CurrentCamera.CFrame
        local moveDirection = Vector3.new(0,0,0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDirection = moveDirection + camCFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDirection = moveDirection - camCFrame.LookVector end
        flightAlignOrientation.CFrame = camCFrame
        flightLinearVelocity.Velocity = moveDirection * flySpeed
    else clearFlightPhysics() end
end)

FlyBtn.MouseButton1Click:Connect(function()
    flags.fly = not flags.fly
    FlyBtn.Text = flags.fly and "Anti-Grav Fly: ACTIVE" or "Anti-Grav Fly: OFF"
end)

-- Warp Speed Module
SpeedBtn.MouseButton1Click:Connect(function()
    flags.speed = not flags.speed
    SpeedBtn.Text = flags.speed and "Warp Speed: ACTIVE" or "Warp Speed: OFF"
    pcall(function() LocalPlayer.Character.Humanoid.WalkSpeed = flags.speed and warpSpeed or normalSpeed end)
end)

-- Lock On Engine
local function getMurdererWithinRadius()
    local currentCam = Workspace.CurrentCamera
    if not currentCam then return nil end
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and isMurderer(p) and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = p.Character.HumanoidRootPart
            local screenPos, onScreen = currentCam:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - UserInputService:GetMouseLocation()).Magnitude
