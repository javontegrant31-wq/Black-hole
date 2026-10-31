-- Delta Executor MM2 Cosmic Master Compilation (FIXED)
-- Universal Cross-Platform Edition (Mobile, PC, Console)
-- All systems wrapped in protected pcalls to prevent execution crashes

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

-- Core Configurations
local flags = { esp = false, fly = false, speed = false, lockon = false, bombjump = false, antilag = false, antifling = false, fling = false }
local warpSpeed = 55
local normalSpeed = 16
local maxLockRadius = 150
local doubleJumpAvailable = false
local humanoidConnection

RadiusInput.FocusLost:Connect(function()
    local num = tonumber(RadiusInput.Text)
    if num then maxLockRadius = math.clamp(num, 10, 800) else RadiusInput.Text = tostring(maxLockRadius) end
end)

local function isMurderer(player)
    return pcall(function()
        if player and player.Character then
            return player.Character:FindFirstChild("Knife") or (player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("Knife"))
        end
    end) and player.Character:FindFirstChild("Knife") or false
end

-- 1. Tri-Role Distinctive ESP Module (Fixed Loop Checks)
local function applyESP(p)
    if p == LocalPlayer then return end
    local function highlightChar(char)
        if not char or char:FindFirstChild("VoidGlow") then return end
        local hl = Instance.new("Highlight")
        hl.Name = "VoidGlow"
        hl.Parent = char
        hl.FillTransparency = 0.4
        hl.OutlineTransparency = 0.1
        
        task.spawn(function()
            while char and char:IsDescendantOf(Workspace) and flags.esp do
                pcall(function()
                    local hasKnife = isMurderer(p)
                    local hasGun = char:FindFirstChild("Gun") or (p:FindFirstChild("Backpack") and p.Backpack:FindFirstChild("Gun"))
                    
                    if hasKnife then
                        hl.FillColor = Color3.fromRGB(255, 30, 80)
                        hl.OutlineColor = Color3.fromRGB(255, 0, 0)
                    elseif hasGun then
                        hl.FillColor = Color3.fromRGB(0, 140, 255)
                        hl.OutlineColor = Color3.fromRGB(0, 200, 255)
                    else
                        hl.FillColor = Color3.fromRGB(0, 255, 120)
                        hl.OutlineColor = Color3.fromRGB(200, 255, 200)
                    end
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
    if flags.esp then
        EspBtn.Text = "Role ESP: ACTIVE"
        EspStroke.Color = Color3.fromRGB(0, 255, 150)
        for _, p in ipairs(Players:GetPlayers()) do applyESP(p) end
    else
        EspBtn.Text = "Role ESP: OFF"
        EspStroke.Color = Color3.fromRGB(70, 40, 110)
        for _, p in ipairs(Players:GetPlayers()) do
            pcall(function()
                if p.Character and p.Character:FindFirstChild("VoidGlow") then p.Character.VoidGlow:Destroy() end
            end)
        end
    end
end)

-- 2. Anti-Grav Flight Matrix (Modern Attachment Physics Constraints Fixed)
local flySpeed = 45
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
            flightLinearVelocity.Velocity = Vector3.new(0, 0, 0)
            
            flightAlignOrientation = Instance.new("AlignOrientation", hrp)
            flightAlignOrientation.Attachment0 = flightAttachment
            flightAlignOrientation.MaxTorque = math.huge
            flightAlignOrientation.Mode = Enum.OrientationMode.OneAttachment
        end
        
        local camCFrame = Workspace.CurrentCamera.CFrame
      
