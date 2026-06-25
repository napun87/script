--[[ 
    PREMIUM SLEEK DARK LOADER 2026 - MODERN MINIMALIST EDITION
    Secured & Hex Obfuscated Version
]]

-- Hàm giải mã chuỗi nội bộ từ Hex sang String ký tự thường
local function _vX4(hexString)
    local decoded = {}
    for token in string.gmatch(hexString, "%S+") do
        table.insert(decoded, string.char(tonumber(token, 16)))
    end
    return table.concat(decoded)
end

-- Khởi tạo cấu hình tài nguyên hệ thống (Đã mã hóa chống quét tĩnh)
local Config_URL   = _vX4("68 74 74 70 73 3a 2f 2f 72 61 77 2e 67 69 74 68 75 62 75 73 65 72 63 6f 6e 74 65 6e 74 2e 63 6f 6d 2f 42 75 62 75 32 6b 2f 63 6f 6e 66 69 67 2e 74 78 74 2f 72 65 66 73 2f 68 65 61 64 73 2f 6d 61 69 6e 2f 6b 65 79") 
local File_Name    = _vX4("45 63 6c 69 70 73 65 4b 65 79 43 61 63 68 65 2e 74 78 74")
local MainAPI_URL  = _vX4("68 74 74 70 73 3a 2f 2f 72 61 77 2e 67 69 74 68 75 62 75 73 65 72 63 6f 6e 74 65 6e 74 2e 63 6f 6d 2f 52 78 31 6d 2f 43 70 73 48 75 62 2f 72 65 66 73 2f 68 65 61 64 73 2f 6d 61 69 6e 2f 48 75 62")
local Backup_URL   = _vX4("68 74 74 70 73 3a 2f 2f 66 75 6e 6c 69 6e 6b 2e 69 6f 2f 50 75 5f 73 32 77 63")
local Core_GuiName = _vX4("45 63 6c 69 70 73 65 53 6c 65 65 6b 55 49 5f 76 33")

---------------------------------------------------------
-- HỆ THỐNG TỰ ĐỘNG TẢI DỮ LIỆU CHỦ
---------------------------------------------------------
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local fetchedLink = Backup_URL
local fetchedKey = nil

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
-- HÀM KÍCH HOẠT SCRIPT CHÍNH (CPSHUB RUNNER)
---------------------------------------------------------
local function ExecuteMainScript()
    local loadSuccess, err = pcall(function()
        loadstring(game:HttpGet(MainAPI_URL, true))()
    end)
    
    if not loadSuccess then
        warn(_vX4("4c e1 69 20 53 63 72 69 70 74 20 43 68 e1 bb 93 6e 67 3a 20") .. tostring(err))
    end
end

---------------------------------------------------------
-- KIỂM TRA CHỨC NĂNG LƯU KEY TỰ ĐỘNG (AUTO LOGIN)
---------------------------------------------------------
if fetchedKey and readfile and isfile and isfile(File_Name) then
    local savedKey = readfile(File_Name)
    if savedKey == fetchedKey then
        ExecuteMainScript()
        return 
    end
end

---------------------------------------------------------
-- KHỞI TẠO GIAO DIỆN TỐI GIẢN HIỆN ĐẠI (MINIMALIST DARK)
---------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = Core_GuiName
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BackgroundTransparency = 0.05
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 330, 0, 220)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = MainFrame

local DropShadow = Instance.new("ImageLabel")
DropShadow.Name = "DropShadow"
DropShadow.Parent = MainFrame
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 40, 1, 40)
DropShadow.BackgroundTransparency = 1
DropShadow.Image = "rbxassetid://6015897843"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.5
DropShadow.ZIndex = MainFrame.ZIndex - 1

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = MainFrame
UIStroke.Thickness = 1
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(45, 45, 55)

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Text = "ECLIPSE LOADER"
Title.Font = Enum.Font.GothamMedium
Title.TextColor3 = Color3.fromRGB(240, 240, 245)
Title.TextSize = 16
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = MainFrame
KeyInput.PlaceholderText = "Enter your access key..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
KeyInput.Position = UDim2.new(0.08, 0, 0.28, 0)
KeyInput.Size = UDim2.new(0.84, 0, 0, 40)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 13

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = KeyInput

local InputStroke = Instance.new("UIStroke")
InputStroke.Parent = KeyInput
InputStroke.Thickness = 1
InputStroke.Color = Color3.fromRGB(40, 40, 50)

local CopyBtn = Instance.new("TextButton")
CopyBtn.Parent = MainFrame
CopyBtn.Text = "Get Encryption Key"
CopyBtn.Font = Enum.Font.GothamMedium
CopyBtn.TextSize = 12
CopyBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
CopyBtn.TextColor3 = Color3.fromRGB(160, 160, 175)
CopyBtn.Position = UDim2.new(0.08, 0, 0.56, 5)
CopyBtn.Size = UDim2.new(0.84, 0, 0, 32)

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 8)
CopyCorner.Parent = CopyBtn

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Parent = MainFrame
SubmitBtn.Text = "Verify & Access"
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 13
SubmitBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 245)
SubmitBtn.TextColor3 = Color3.fromRGB(15, 15, 20)
SubmitBtn.Position = UDim2.new(0.08, 0, 0.77, 5)
SubmitBtn.Size = UDim2.new(0.84, 0, 0, 36)

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 8)
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
-- HIỆU ỨNG HOVER SANG TRỌNG (FADE EFFECT)
---------------------------------------------------------
local function ApplySleekHover(button, targetColor, originalColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = targetColor}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = originalColor}):Play()
    end)
end

ApplySleekHover(CopyBtn, Color3.fromRGB(36, 36, 46), Color3.fromRGB(28, 28, 36))
ApplySleekHover(SubmitBtn, Color3.fromRGB(210, 210, 215), Color3.fromRGB(240, 240, 245))

local function AdvancedNotify(msg, isError)
    local NotifyGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    local Box = Instance.new("Frame", NotifyGui)
    local Text = Instance.new("TextLabel", Box)
    
    Box.Size = UDim2.new(0, 260, 0, 40)
    Box.Position = UDim2.new(0.5, -130, 0, -50)
    Box.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    
    local BC = Instance.new("UICorner", Box) BC.CornerRadius = UDim.new(0, 8)
    local S = Instance.new("UIStroke", Box) 
    S.Color = isError and Color3.fromRGB(200, 60, 60) or Color3.fromRGB(60, 180, 100)
    S.Thickness = 1
    
    Text.Size = UDim2.new(1, 0, 1, 0)
    Text.BackgroundTransparency = 1
    Text.Text = msg
    Text.TextColor3 = Color3.fromRGB(230, 230, 235)
    Text.Font = Enum.Font.GothamMedium
    Text.TextSize = 12
    
    TweenService:Create(Box, TweenInfo.new(0.4, Enum.EasingStyle.OutQuad), {Position = UDim2.new(0.5, -130, 0, 30)}):Play()
    task.wait(2.2)
    TweenService:Create(Box, TweenInfo.new(0.4, Enum.EasingStyle.InQuad), {Position = UDim2.new(0.5, -130, 0, -50)}):Play()
    task.wait(0.4)
    NotifyGui:Destroy()
end

---------------------------------------------------------
-- LOGIC XỬ LÝ NÚT BẤM
---------------------------------------------------------
CopyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(fetchedLink)
        CopyBtn.Text = "Link Copied!"
        AdvancedNotify("URL copied successfully.", false)
    else
        AdvancedNotify("Your executor doesn't support clipboard.", true)
    end
    task.wait(2)
    CopyBtn.Text = "Get Encryption Key"
end)

SubmitBtn.MouseButton1Click:Connect(function()
    if not fetchedKey or fetchedKey == "" then
        SubmitBtn.Text = "Server Error"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(45, 25, 25)
        SubmitBtn.TextColor3 = Color3.fromRGB(200, 60, 60)
        AdvancedNotify("Failed to sync configuration from GitHub.", true)
        task.wait(2)
        SubmitBtn.Text = "Verify & Access"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 245)
        SubmitBtn.TextColor3 = Color3.fromRGB(15, 15, 20)
        return
    end

    local userKey = KeyInput.Text
    
    if userKey == fetchedKey then
        SubmitBtn.Text = "Authorized"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(25, 45, 30)
        SubmitBtn.TextColor3 = Color3.fromRGB(60, 200, 100)
        
        if writefile then
            pcall(function() writefile(File_Name, userKey) end)
        end
        
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 330, 0, 0), BackgroundTransparency = 1}):Play()
        TweenService:Create(DropShadow, TweenInfo.new(0.2), {ImageTransparency = 1}):Play()
        task.wait(0.3)
        ScreenGui:Destroy()
        
        ExecuteMainScript()
    else
        SubmitBtn.Text = "Access Denied"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(45, 25, 25)
        SubmitBtn.TextColor3 = Color3.fromRGB(200, 60, 60)
        AdvancedNotify("Invalid or expired access token.", true)
        task.wait(2)
        SubmitBtn.Text = "Verify & Access"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 245)
        SubmitBtn.TextColor3 = Color3.fromRGB(15, 15, 20)
    end
end)
