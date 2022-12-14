-- SimpleConsole pre-release by accountrevived

local UIS = game:GetService("UserInputService")

local lib = {}
local console = {}

function lib.new(prop)
    consoleTitle = prop.title or "SimpleConsole"
    consoleTitleAlt = prop.titleAlt or "SimpleConsole"
    consoleOuterColor = prop.outerColor or Color3.fromRGB(2, 0, 20)
    consoleInnerColor = prop.innerColor or Color3.fromRGB(5, 0, 52)
    consoleButtonColor = prop.buttonColor or Color3.fromRGB(38, 0, 97)
    consoleSize = prop.size or UDim2.new(0.566125274, 0, 0.353579074, 0)
    consolePosition = prop.pos or UDim2.new(0.289392889, 0, 0.783366561, 0)
    consoleVisibleOnStart = prop.visibleOnStart or false

    local saveConnect, clearConnect

    local toggled = consoleVisibleOnStart

    local SimpleConsole = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local ConsoleTitle = Instance.new("TextLabel")
    local Console = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local Clear = Instance.new("TextButton")
    local Save = Instance.new("TextButton")
    local LineCount = Instance.new("TextLabel")
    local Line = Instance.new("TextLabel")

    SimpleConsole.Name = "SimpleConsole"
    SimpleConsole.Parent = game:WaitForChild("CoreGui")
    SimpleConsole.IgnoreGuiInset = true

    Main.Name = "Main"
    Main.Parent = SimpleConsole
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = consoleOuterColor
    Main.BorderSizePixel = 0
    Main.Position = consolePosition
    Main.Size = consoleSize
    Main.Visible = consoleVisibleOnStart

    UICorner.CornerRadius = UDim.new(0, 15)
    UICorner.Parent = Main

    ConsoleTitle.Name = "ConsoleTitle"
    ConsoleTitle.Parent = Main
    ConsoleTitle.AnchorPoint = Vector2.new(0.5, 0.5)
    ConsoleTitle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ConsoleTitle.BackgroundTransparency = 1.000
    ConsoleTitle.BorderSizePixel = 0
    ConsoleTitle.Position = UDim2.new(0.5, 0, 0.0458942242, 0)
    ConsoleTitle.Size = UDim2.new(0.942528725, 0, 0.0625, 0)
    ConsoleTitle.Font = Enum.Font.GothamMedium
    ConsoleTitle.Text = consoleTitle
    ConsoleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    ConsoleTitle.TextScaled = true
    ConsoleTitle.TextSize = 14.000
    ConsoleTitle.TextWrapped = true
    ConsoleTitle.TextXAlignment = Enum.TextXAlignment.Left

    LineCount.Name = "LineCount"
    LineCount.Parent = Main
    LineCount.AnchorPoint = Vector2.new(0.5, 0.5)
    LineCount.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    LineCount.BackgroundTransparency = 1.000
    LineCount.BorderSizePixel = 0
    LineCount.Position = UDim2.new(0.90897584, 0, 0.12936455, 0)
    LineCount.Size = UDim2.new(0.108376682, 0, 0.0461300872, 0)
    LineCount.Font = Enum.Font.GothamMedium
    LineCount.Text = "0 Lines"
    LineCount.TextColor3 = Color3.fromRGB(255, 255, 255)
    LineCount.TextScaled = true
    LineCount.TextSize = 14.000
    LineCount.TextWrapped = true
    LineCount.TextXAlignment = Enum.TextXAlignment.Right
    LineCount.ZIndex = 2

    function updateLineCount()
        LineCount.Text = tostring(#Console:GetChildren() - 1) .. " Lines"
    end

    Console.Name = "Console"
    Console.Parent = Main
    Console.Active = true
    Console.AnchorPoint = Vector2.new(0.5, 0.5)
    Console.BackgroundColor3 = consoleInnerColor
    Console.BorderSizePixel = 0
    Console.Position = UDim2.new(0.5, 0, 0.533999979, 0)
    Console.Size = UDim2.new(0.943000019, 0, 0.88499999, 0)
    Console.CanvasPosition = Vector2.new(0, 425.779968)
    Console.ScrollBarThickness = 0

    UIListLayout.Parent = Console
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom

    Line.Name = "Line"
    Line.AnchorPoint = Vector2.new(0.5, 0.5)
    Line.AutomaticSize = Enum.AutomaticSize.Y
    Line.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Line.BackgroundTransparency = 1.000
    Line.BorderSizePixel = 0
    Line.Position = UDim2.new(0.5, 0, 0.993918061, 0)
    Line.Size = UDim2.new(1, 0, 0.0121639203, 0)
    Line.Visible = true
    Line.Font = Enum.Font.SourceSans
    Line.Text = "[SimpleConsole] Sample Line"
    Line.TextColor3 = Color3.fromRGB(255, 255, 255)
    Line.TextSize = 18.000
    Line.TextWrapped = true
    Line.TextXAlignment = Enum.TextXAlignment.Left

    Clear.Name = "Clear"
    Clear.Parent = Main
    Clear.AnchorPoint = Vector2.new(0.5, 0.5)
    Clear.BackgroundColor3 = consoleButtonColor
    Clear.BorderSizePixel = 0
    Clear.Position = UDim2.new(0.928506315, 0, 0.0466816612, 0)
    Clear.Size = UDim2.new(0, 91, 0, 24)
    Clear.Font = Enum.Font.Gotham
    Clear.Text = "CLEAR"
    Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
    Clear.TextScaled = true
    Clear.TextSize = 14.000
    Clear.TextWrapped = true

    clearConnect = Clear.Activated:Connect(function()
        for _, v in ipairs(Console:GetChildren()) do
            if v:IsA("TextLabel") then
                v:Destroy()
            end
        end
        updateLineCount()
    end)

    Save.Name = "Save"
    Save.Parent = Main
    Save.AnchorPoint = Vector2.new(0.5, 0.5)
    Save.BackgroundColor3 = consoleButtonColor
    Save.BorderSizePixel = 0
    Save.Position = UDim2.new(0.832776785, 0, 0.0466816612, 0)
    Save.Size = UDim2.new(0, 91, 0, 24)
    Save.Font = Enum.Font.Gotham
    Save.Text = "SAVE"
    Save.TextColor3 = Color3.fromRGB(255, 255, 255)
    Save.TextScaled = true
    Save.TextSize = 14.000
    Save.TextWrapped = true

    saveConnect = Save.Activated:Connect(function()
        local lines = {}
        for _, v in ipairs(Console:GetChildren()) do
            if v:IsA("TextLabel") then
                table.insert(lines, v.Text)
            end
        end
        writefile("SimpleConsoleLog_" .. os.time(os.date("!*t")) .. ".txt", table.concat(lines, "\n"))
    end)

    function console:Log(line, color)
        local newLine = Line:Clone()
        newLine.Text = "[" .. consoleTitleAlt .. " on " .. os.date("*t").hour .. ":" .. os.date("*t").min .. "] " .. line
        newLine.Parent = Console
        newLine.Visible = true
        newLine.TextColor3 = color

        updateLineCount()
    end

    function console:Print(line)
        console:Log(line, Color3.fromRGB(255, 255, 255))
    end

    function console:Warn(line)
        console:Log(line, Color3.fromRGB(255, 255, 0))
    end

    function console:Err(line)
        console:Log(line, Color3.fromRGB(255, 0, 0))
    end

    function console:Success(line)
        console:Log(line, Color3.fromRGB(0, 255, 0))
    end

    function console:Toggle()
        if toggled then
            Main.Visible = false
            toggled = false
        else
            Main.Visible = true
            toggled = true
        end
    end

    function console:Kill()
        saveConnect:Disconnect()
        clearConnect:Disconnect()
        SimpleConsole:Destroy()
    end
	

    return console
end




return lib