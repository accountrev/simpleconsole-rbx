-- SimpleConsole pre-release by accountrevived

local lib = {}
console = {}

function lib.Create()
    local SimpleConsole = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local ConsoleTitle = Instance.new("TextLabel")
    local Console = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local Assets = Instance.new("Folder")
    local Line = Instance.new("TextLabel")

    SimpleConsole.Name = "SimpleConsole"
    SimpleConsole.Parent = game:WaitForChild("CoreGui")
    SimpleConsole.IgnoreGuiInset = true

    Main.Name = "Main"
    Main.Parent = SimpleConsole
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(2, 0, 20)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.289392889, 0, 0.783366561, 0)
    Main.Size = UDim2.new(0.566125274, 0, 0.353579074, 0)

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
    ConsoleTitle.Text = "SimpleConsole"
    ConsoleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    ConsoleTitle.TextScaled = true
    ConsoleTitle.TextSize = 14.000
    ConsoleTitle.TextWrapped = true
    ConsoleTitle.TextXAlignment = Enum.TextXAlignment.Left

    Console.Name = "Console"
    Console.Parent = Main
    Console.Active = true
    Console.AnchorPoint = Vector2.new(0.5, 0.5)
    Console.BackgroundColor3 = Color3.fromRGB(5, 0, 52)
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

    function console:Log(line, msgType)
        type = typeMsg or ""

        if #Console:GetChildren() > 100 then
            Console:FindFirstChildOfClass("TextLabel"):Destroy()
        end

        local newLine = Line:Clone()

        newLine.Text = line
        newLine.Parent = Console
        newLine.Visible = true

        if msgType == "error" then newLine.TextColor3 = Color3.fromRGB(255, 0, 0)
        else Line.TextColor3 = Color3.fromRGB(255, 255, 255) end
    end

    return console
end


return lib