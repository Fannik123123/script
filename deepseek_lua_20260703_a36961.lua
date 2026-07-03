--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88 
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  AUDITOR v3
]=]

-- Instances: 45+ | Scripts: 4 | Modules: 3 | Max Backdoor Detection
local G2L = {};

-- StarterGui.Ultimate Backdoor Auditor
G2L["1"] = Instance.new("ScreenGui", game:GetService('CoreGui'):WaitForChild('RobloxGui'));
G2L["1"]["Name"] = [[Ultimate Backdoor Auditor]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"]["ResetOnSpawn"] = false;

-- Main Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(10, 10, 10);
G2L["2"]["Size"] = UDim2.new(0, 650, 0, 480);
G2L["2"]["Position"] = UDim2.new(0.25, 0, 0.15, 0);
G2L["2"]["Active"] = true;
G2L["2"]["Draggable"] = true;

-- Glow Border
G2L["3"] = Instance.new("UIStroke", G2L["2"]);
G2L["3"]["Color"] = Color3.fromRGB(255, 0, 0);
G2L["3"]["Thickness"] = 2;

G2L["4"] = Instance.new("UIGradient", G2L["3"]);
G2L["4"]["Rotation"] = 50;
G2L["4"]["Color"] = ColorSequence.new{
	ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(0.333, Color3.fromRGB(0, 255, 0)),
	ColorSequenceKeypoint.new(0.666, Color3.fromRGB(0, 0, 255)),
	ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 0, 255))
};

G2L["5"] = Instance.new("UICorner", G2L["2"]);

-- Title
G2L["6"] = Instance.new("TextLabel", G2L["2"]);
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["BackgroundTransparency"] = 1;
G2L["6"]["FontFace"] = Font.new([[rbxassetid://12187365977]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["6"]["TextSize"] = 32;
G2L["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["Size"] = UDim2.new(1, 0, 0, 50);
G2L["6"]["Text"] = [[🛡️ ULTIMATE BACKDOOR AUDITOR v3]];
G2L["6"]["Position"] = UDim2.new(0, 0, 0, 10);

-- Title Gradient
G2L["7"] = Instance.new("UIGradient", G2L["6"]);
G2L["7"]["Rotation"] = 90;
G2L["7"]["Color"] = ColorSequence.new{
	ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 50, 50)),
	ColorSequenceKeypoint.new(0.500, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(1.000, Color3.fromRGB(50, 50, 255))
};

-- Tab System
G2L["8"] = Instance.new("Frame", G2L["2"]);
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(20, 20, 20);
G2L["8"]["Size"] = UDim2.new(1, 0, 0, 40);
G2L["8"]["Position"] = UDim2.new(0, 0, 0, 65);
G2L["8"]["Name"] = [[TabBar]];

-- Tab: Scanner
G2L["9"] = Instance.new("TextButton", G2L["8"]);
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(0, 180, 0);
G2L["9"]["TextSize"] = 16;
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["Size"] = UDim2.new(0, 200, 1, 0);
G2L["9"]["Text"] = [[🔍 SCANNER]];
G2L["9"]["Name"] = [[TabScanner]];

-- Tab: Tests
G2L["10"] = Instance.new("TextButton", G2L["8"]);
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(40, 40, 40);
G2L["10"]["TextSize"] = 16;
G2L["10"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["10"]["TextColor3"] = Color3.fromRGB(200, 200, 200);
G2L["10"]["Size"] = UDim2.new(0, 200, 1, 0);
G2L["10"]["Position"] = UDim2.new(0, 200, 0, 0);
G2L["10"]["Text"] = [[🧪 TEST PANEL]];
G2L["10"]["Name"] = [[TabTests]];

-- Tab: Webhooks
G2L["11"] = Instance.new("TextButton", G2L["8"]);
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(40, 40, 40);
G2L["11"]["TextSize"] = 16;
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["11"]["TextColor3"] = Color3.fromRGB(200, 200, 200);
G2L["11"]["Size"] = UDim2.new(0, 200, 1, 0);
G2L["11"]["Position"] = UDim2.new(0, 400, 0, 0);
G2L["11"]["Text"] = [[🔗 WEBHOOKS]];
G2L["11"]["Name"] = [[TabWebhooks]];

-- Main Content Area
G2L["12"] = Instance.new("Frame", G2L["2"]);
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(15, 15, 15);
G2L["12"]["Size"] = UDim2.new(1, -20, 1, -120);
G2L["12"]["Position"] = UDim2.new(0, 10, 0, 110);
G2L["12"]["Name"] = [[Content]];

-- Scanner Tab Content
G2L["13"] = Instance.new("ScrollingFrame", G2L["12"]);
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
G2L["13"]["Size"] = UDim2.new(1, 0, 1, -50);
G2L["13"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
G2L["13"]["ScrollBarThickness"] = 6;
G2L["13"]["Name"] = [[ScannerLog]];

G2L["14"] = Instance.new("UIListLayout", G2L["13"]);
G2L["14"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["14"]["Padding"] = UDim.new(0, 3);

-- Scan Button
G2L["15"] = Instance.new("TextButton", G2L["12"]);
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(0, 200, 0);
G2L["15"]["TextSize"] = 20;
G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["15"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["15"]["Size"] = UDim2.new(0, 200, 0, 40);
G2L["15"]["Position"] = UDim2.new(0, 0, 1, -45);
G2L["15"]["Text"] = [[🚀 START DEEP SCAN]];
G2L["15"]["Name"] = [[ScanButton]];

G2L["15a"] = Instance.new("UICorner", G2L["15"]);
G2L["15b"] = Instance.new("UIStroke", G2L["15"]);
G2L["15b"]["Color"] = Color3.fromRGB(0, 255, 0);

-- Clear Button
G2L["16"] = Instance.new("TextButton", G2L["12"]);
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(200, 0, 0);
G2L["16"]["TextSize"] = 20;
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["16"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["Size"] = UDim2.new(0, 150, 0, 40);
G2L["16"]["Position"] = UDim2.new(0, 210, 1, -45);
G2L["16"]["Text"] = [[🗑️ CLEAR]];
G2L["16"]["Name"] = [[ClearButton]];

G2L["16a"] = Instance.new("UICorner", G2L["16"]);
G2L["16b"] = Instance.new("UIStroke", G2L["16"]);
G2L["16b"]["Color"] = Color3.fromRGB(255, 0, 0);

-- Status Label
G2L["17"] = Instance.new("TextLabel", G2L["12"]);
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(30, 30, 30);
G2L["17"]["TextSize"] = 14;
G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["17"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["17"]["Size"] = UDim2.new(1, -370, 0, 40);
G2L["17"]["Position"] = UDim2.new(0, 370, 1, -45);
G2L["17"]["Text"] = [[Ready]];
G2L["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;

-- Tests Tab Content
G2L["18"] = Instance.new("ScrollingFrame", G2L["12"]);
G2L["18"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
G2L["18"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["18"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
G2L["18"]["ScrollBarThickness"] = 6;
G2L["18"]["Visible"] = false;
G2L["18"]["Name"] = [[TestsLog]];

G2L["19"] = Instance.new("UIListLayout", G2L["18"]);
G2L["19"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["19"]["Padding"] = UDim.new(0, 3);

-- Webhooks Tab Content
G2L["20"] = Instance.new("ScrollingFrame", G2L["12"]);
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
G2L["20"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["20"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
G2L["20"]["ScrollBarThickness"] = 6;
G2L["20"]["Visible"] = false;
G2L["20"]["Name"] = [[WebhooksLog]];

G2L["21"] = Instance.new("UIListLayout", G2L["20"]);
G2L["21"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["21"]["Padding"] = UDim.new(0, 3);

-- Main Script
G2L["22"] = Instance.new("LocalScript", G2L["1"]);

-- Dragify Script
G2L["23"] = Instance.new("LocalScript", G2L["1"]);
G2L["23"]["Name"] = [[Dragify]];

-- ==================== DRAGIFY SCRIPT ====================
G2L["23"].Source = [[
local UserInputService = game:GetService("UserInputService")
local gui = script.Parent.Frame

local dragging
local dragInput
local dragStart
local startPos

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
]]

-- ==================== MAIN SCRIPT ====================
G2L["22"].Source = [[
-- ULTIMATE BACKDOOR AUDITOR v3 - Main Logic
-- 12+ Detection Types | Auto-Tests | Discord Webhook Finder

local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- GUI References
local gui = script.Parent
local mainFrame = gui.Frame
local scannerLog = mainFrame.Content.ScannerLog
local testsLog = mainFrame.Content.TestsLog
local webhooksLog = mainFrame.Content.WebhooksLog
local scanBtn = mainFrame.Content.ScanButton
local clearBtn = mainFrame.Content.ClearButton
local statusLabel = mainFrame.Content.TextLabel

-- Tabs
local tabScanner = mainFrame.TabBar.TabScanner
local tabTests = mainFrame.TabBar.TabTests
local tabWebhooks = mainFrame.TabBar.TabWebhooks

-- Data
local findings = {} -- All findings
local webhooksFound = {} -- Discord webhooks
local totalScanned = 0
local totalSuspicious = 0

-- ==================== LOGGING ====================
local function AddLog(frame, text, color, findingData)
	local label = Instance.new("TextButton")
	label.Size = UDim2.new(1, -10, 0, 28)
	label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	label.TextColor3 = color or Color3.new(1, 1, 1)
	label.Text = "• " .. text
	label.Font = Enum.Font.SourceSans
	label.TextSize = 13
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.AutoButtonColor = false
	label.Parent = frame
	
	if findingData then
		label.BackgroundColor3 = Color3.fromRGB(60, 30, 0)
		label.Text = label.Text .. " [CLICK TO TEST]"
		label.MouseButton1Click:Connect(function()
			TestFinding(findingData)
		end)
	end
	
	frame.CanvasSize = UDim2.new(0, 0, 0, frame.UIListLayout.AbsoluteContentSize.Y + 10)
	return label
end

local function ClearFrame(frame)
	for _, child in ipairs(frame:GetChildren()) do
		if child:IsA("TextButton") then child:Destroy() end
	end
	frame.CanvasSize = UDim2.new(0, 0, 0, 0)
end

-- ==================== TAB SWITCHING ====================
local function SwitchTab(tab)
	scannerLog.Visible = (tab == "scanner")
	testsLog.Visible = (tab == "tests")
	webhooksLog.Visible = (tab == "webhooks")
	
	tabScanner.BackgroundColor3 = Color3.fromRGB(tab == "scanner" and 0 or 40, tab == "scanner" and 180 or 40, tab == "scanner" and 0 or 40)
	tabTests.BackgroundColor3 = Color3.fromRGB(tab == "tests" and 0 or 40, tab == "tests" and 180 or 40, tab == "tests" and 0 or 40)
	tabWebhooks.BackgroundColor3 = Color3.fromRGB(tab == "webhooks" and 0 or 40, tab == "webhooks" and 180 or 40, tab == "webhooks" and 0 or 40)
end

tabScanner.MouseButton1Click:Connect(function() SwitchTab("scanner") end)
tabTests.MouseButton1Click:Connect(function() SwitchTab("tests") end)
tabWebhooks.MouseButton1Click:Connect(function() SwitchTab("webhooks") end)

-- ==================== SAFE TESTING SYSTEM ====================
-- Marker that appears when backdoor is active
local function CreateTestMarker(testName)
	pcall(function()
		local part = Instance.new("Part")
		part.Name = "BACKDOOR_TEST_" .. testName
		part.Size = Vector3.new(5, 5, 5)
		part.Position = Vector3.new(0, 50, 0)
		part.BrickColor = BrickColor.new("Neon orange")
		part.Anchored = true
		part.Material = Enum.Material.Neon
		part.Parent = workspace
		
		local billboard = Instance.new("BillboardGui", part)
		billboard.Size = UDim2.new(0, 300, 0, 100)
		billboard.StudsOffset = Vector3.new(0, 3, 0)
		
		local textLabel = Instance.new("TextLabel", billboard)
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = "⚠️ BACKDOOR ACTIVE: " .. testName .. " ⚠️"
		textLabel.TextColor3 = Color3.new(1, 0, 0)
		textLabel.TextSize = 24
		textLabel.Font = Enum.Font.SourceSansBold
		
		game:GetService("Debris"):AddItem(part, 15)
	end)
end

-- Test Types:
-- 1. StringValue Backdoor
local function TestStringValue(finding)
	if not finding.object or not finding.object:IsA("StringValue") then
		AddLog(testsLog, "❌ Object is not a StringValue", Color3.new(1, 0, 0))
		return
	end
	
	local testCode = [[
		local p = Instance.new("Part")
		p.Name = "BACKDOOR_TEST_StringValue"
		p.Size = Vector3.new(5,5,5)
		p.Position = Vector3.new(0,50,0)
		p.BrickColor = BrickColor.new("Neon orange")
		p.Anchored = true
		p.Material = Enum.Material.Neon
		p.Parent = workspace
		
		local bbg = Instance.new("BillboardGui", p)
		bbg.Size = UDim2.new(0,300,0,100)
		bbg.StudsOffset = Vector3.new(0,3,0)
		local tl = Instance.new("TextLabel", bbg)
		tl.Size = UDim2.new(1,0,1,0)
		tl.BackgroundTransparency = 1
		tl.Text = "⚠️ STRINGVALUE BACKDOOR CONFIRMED ⚠️"
		tl.TextColor3 = Color3.new(1,0,0)
		tl.TextSize = 24
		tl.Font = Enum.Font.SourceSansBold
		game:GetService("Debris"):AddItem(p, 15)
	]]
	
	finding.object.Value = testCode
	AddLog(testsLog, "✅ Test payload sent to: " .. finding.object.Name, Color3.new(0, 1, 0))
	AddLog(testsLog, "👀 Look for ORANGE NEON CUBE in the sky!", Color3.new(1, 1, 0))
end

-- 2. Remote Backdoor
local function TestRemote(finding)
	if not finding.object then return end
	local remote = finding.object
	
	pcall(function()
		if remote:IsA("RemoteFunction") then
			remote:InvokeServer("__BACKDOOR_AUDIT_TEST__")
		elseif remote:IsA("RemoteEvent") then
			remote:FireServer("__BACKDOOR_AUDIT_TEST__")
		end
		AddLog(testsLog, "📤 Test request sent to: " .. remote.Name, Color3.new(0, 1, 0))
		AddLog(testsLog, "👀 Check if something happens on the server", Color3.new(1, 1, 0))
	end)
end

-- 3. Chat Backdoor - Extract password and test
local function TestChatBackdoor(finding)
	local scriptObj = finding.object
	if not scriptObj then return end
	
	local code = scriptObj.Source
	local passwords = {}
	
	-- Multiple patterns to extract passwords
	local patterns = {
		'msg%s*==%s*"([^"]+)"',           -- msg == "password"
		"msg%s*==%s*'([^']+)'",            -- msg == 'password'
		'string%.sub%((.-),%s*#?"([^"]+)"', -- string.sub(msg, #"password"
		'string%.sub%((.-),%s*#?\'([^\']+)\'', -- string.sub(msg, #'password'
		'if%s+.-%s*==%s*"([^"]+)"',       -- if something == "password"
		'if%s+.-%s*==%s*\'([^\']+)\'',    -- if something == 'password'
	}
	
	for _, pattern in ipairs(patterns) do
		for match in code:gmatch(pattern) do
			if match and #match > 2 and #match < 50 then
				table.insert(passwords, match)
			end
		end
	end
	
	if #passwords > 0 then
		AddLog(testsLog, "🔑 Found " .. #passwords .. " possible password(s):", Color3.new(0, 1, 1))
		for _, pass in ipairs(passwords) do
			AddLog(testsLog, "   Password: \"" .. pass .. "\"", Color3.new(1, 1, 0))
		end
		AddLog(testsLog, "💬 Try typing in chat: " .. passwords[1] .. " print('test')", Color3.new(1, 1, 1))
	else
		AddLog(testsLog, "❌ Could not extract password automatically", Color3.new(1, 0.5, 0))
	end
end

-- 4. HTTP Backdoor - Check if external URL is accessible
local function TestHTTPBackdoor(finding)
	local code = finding.object.Source
	local urls = {}
	
	-- Extract URLs
	for url in code:gmatch("(https?://[%w%.%_%-%+/%%?=&]+)") do
		if url:find("discord") or url:find("webhook") or url:find("pastebin") or url:find("github") or url:find("raw") then
			table.insert(urls, url)
		end
	end
	
	if #urls > 0 then
		AddLog(testsLog, "🌐 Found " .. #urls .. " external URL(s):", Color3.new(1, 1, 0))
		for _, url in ipairs(urls) do
			local displayUrl = #url > 80 and url:sub(1, 77) .. "..." or url
			AddLog(testsLog, "   " .. displayUrl, Color3.new(0.8, 0.8, 1))
		end
	else
		AddLog(testsLog, "❌ No external URLs found", Color3.new(1, 0.5, 0))
	end
end

-- Main Test Router
function TestFinding(finding)
	if not finding then return end
	
	AddLog(testsLog, "▶ Testing: " .. finding.message, Color3.new(1, 1, 0))
	
	if finding.testType == "stringvalue" then
		TestStringValue(finding)
	elseif finding.testType == "remote" then
		TestRemote(finding)
	elseif finding.testType == "chat" then
		TestChatBackdoor(finding)
	elseif finding.testType == "http" then
		TestHTTPBackdoor(finding)
	elseif finding.testType == "webhook" then
		AddLog(testsLog, "🔴 DISCORD WEBHOOK DETECTED - Check Webhooks tab!", Color3.new(1, 0, 0))
	else
		AddLog(testsLog, "ℹ️ No automatic test available for this type", Color3.new(0.8, 0.8, 1))
	end
	
	-- Switch to tests tab
	SwitchTab("tests")
end

-- ==================== ULTIMATE SCANNER ====================
local function HasDiscordWebhook(str)
	return str:find("discord%.com/api/webhooks") or str:find("discordapp%.com/api/webhooks") or str:find("canary%.discord%.com/api/webhooks")
end

local function IsSuspiciousStringValueName(name)
	local suspicious = {
		"loader", "payload", "backdoor", "config", "code", "script",
		"exec", "run", "command", "execute", "load", "string",
		"inject", "hook", "exploit", "hack", "bypass", "trigger",
		"master", "admin", "key", "secret", "hidden", "data"
	}
	for _, s in ipairs(suspicious) do
		if name:lower():find(s) then return true end
	end
	return false
end

local function IsInNonStandardLocation(obj)
	if not obj.Parent then return false end
	local parent = obj.Parent
	
	-- Standard locations
	if parent:IsA("ServerScriptService") or parent:IsA("ServerStorage") then return false end
	if parent:IsA("StarterPlayer") or parent:IsA("StarterPack") then return false end
	if parent:IsA("StarterGui") or parent:IsA("ReplicatedFirst") then return false end
	if parent:IsA("ReplicatedStorage") then return false end
	if parent:IsA("PlayerGui") or parent:IsA("PlayerScripts") then return false end
	if parent:IsA("Backpack") or parent:IsA("Tool") then return false end
	
	-- If it's inside a Part, Model, Attachment, etc. - SUSPICIOUS
	if parent:IsA("Part") or parent:IsA("MeshPart") or parent:IsA("Attachment") then return true end
	if parent:IsA("Model") and not parent:FindFirstChildOfClass("Humanoid") then return true end
	if parent:IsA("Folder") and parent.Parent and parent.Parent:IsA("Part") then return true end
	
	return false
end

local function HasObfuscation(code)
	local stripped = code:gsub("[%w%s%p]+", "")
	local totalChars = #code
	local nonStandard = #stripped
	
	-- Heuristic: if more than 15% non-standard characters and code > 200 chars
	if totalChars > 200 and nonStandard > totalChars * 0.15 then
		return true
	end
	
	-- Check for common obfuscation patterns
	if code:find("\\x[0-9a-fA-F][0-9a-fA-F]") then return true end
	if code:find("\\%d%d%d") then return true end
	if code:find("_G%[.-%]") and code:find("loadstring") then return true end
	
	return false
end

local function ScanAll()
	ClearFrame(scannerLog)
	ClearFrame(testsLog)
	ClearFrame(webhooksLog)
	
	findings = {}
	webhooksFound = {}
	totalScanned = 0
	totalSuspicious = 0
	
	statusLabel.Text = "🔍 Scanning..."
	AddLog(scannerLog, "🚀 DEEP SCAN STARTED", Color3.new(0, 1, 0))
	AddLog(scannerLog, "═" :rep(40), Color3.new(0.5, 0.5, 0.5))
	
	-- Collect ALL accessible objects
	local allContainers = {
		workspace,
		game:GetService("ReplicatedStorage"),
		game:GetService("ReplicatedFirst"),
		game:GetService("StarterGui"),
		game:GetService("StarterPack"),
		game:GetService("StarterPlayer"),
		game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"),
		game:GetService("Players").LocalPlayer:WaitForChild("Backpack"),
		game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"),
		game:GetService("Lighting"),
		game:GetService("SoundService"),
		game:GetService("Chat"),
	}
	
	local allObjects = {}
	for _, container in ipairs(allContainers) do
		pcall(function()
			for _, obj in ipairs(container:GetDescendants()) do
				allObjects[#allObjects + 1] = obj
			end
		end)
	end
	
	AddLog(scannerLog, "📊 Collected " .. #allObjects .. " objects to scan", Color3.new(0.8, 0.8, 1))
	
	-- ==================== DETECTION TYPES ====================
	local detectionTypes = {
		"StringValue Backdoor",
		"loadstring + Value",
		"loadstring + Changed",
		"Chat Backdoor",
		"Remote Backdoor",
		"HTTP Backdoor",
		"Discord Webhook",
		"Obfuscated Code",
		"Hidden Script",
		"getfenv/setfenv Abuse",
		"require() Abuse",
		"Bytecode/Encoded",
	}
	
	AddLog(scannerLog, "🔬 Scanning for " .. #detectionTypes .. " threat types...", Color3.new(0.8, 0.8, 1))
	AddLog(scannerLog, "═" :rep(40), Color3.new(0.5, 0.5, 0.5))
	
	for _, obj in ipairs(allObjects) do
		totalScanned = totalScanned + 1
		
		-- Update status every 100 objects
		if totalScanned % 100 == 0 then
			statusLabel.Text = "🔍 Scanned: " .. totalScanned .. " | Found: " .. totalSuspicious
		end
		
		-- ===== TYPE 1: StringValue with suspicious name =====
		if obj:IsA("StringValue") and IsSuspiciousStringValueName(obj.Name) then
			-- Check if there's a script nearby
			if obj.Parent then
				for _, child in ipairs(obj.Parent:GetDescendants()) do
					if child:IsA("Script") or child:IsA("LocalScript") or child:IsA("ModuleScript") then
						local idx = #findings + 1
						findings[idx] = {
							message = "📦 StringValue Backdoor: " .. obj.Name,
							object = obj,
							testType = "stringvalue",
							type = "StringValue Backdoor"
						}
						AddLog(scannerLog, "⚠️ [StringValue] " .. obj:GetFullName(), Color3.fromRGB(255, 150, 0), findings[idx])
						totalSuspicious = totalSuspicious + 1
						break
					end
				end
			end
		end
		
		-- Check StringValue value for webhooks
		if obj:IsA("StringValue") and HasDiscordWebhook(obj.Value) then
			table.insert(webhooksFound, {
				url = obj.Value,
				location = obj:GetFullName(),
				object = obj
			})
			AddLog(webhooksLog, "🔴 Discord Webhook in StringValue: " .. obj.Name, Color3.new(1, 0, 0))
			AddLog(webhooksLog, "   Location: " .. obj:GetFullName(), Color3.new(1, 0.5, 0.5))
			AddLog(webhooksLog, "   URL: " .. obj.Value:sub(1, 80) .. "...", Color3.new(0.8, 0.8, 1))
			totalSuspicious = totalSuspicious + 1
		end
		
		-- ===== TYPE 2-12: Script Analysis =====
		if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
			local code = obj.Source
			local lower = code:lower()
			local foundInThis = false
			
			-- TYPE 2: loadstring + Value
			if code:find("loadstring") and code:find("%.Value") then
				local idx = #findings + 1
				findings[idx] = {
					message = "⚡ loadstring + Value: " .. obj.Name,
					object = obj,
					testType = "stringvalue",
					type = "loadstring + Value"
				}
				AddLog(scannerLog, "⚠️ [loadstring+Value] " .. obj:GetFullName(), Color3.fromRGB(255, 150, 0), findings[idx])
				totalSuspicious = totalSuspicious + 1
				foundInThis = true
			end
			
			-- TYPE 3: loadstring + Changed
			if code:find("loadstring") and code:find("%.Changed:Connect") then
				local idx = #findings + 1
				findings[idx] = {
					message = "🔄 loadstring + Changed: " .. obj.Name,
					object = obj,
					testType = "stringvalue",
					type = "loadstring + Changed"
				}
				AddLog(scannerLog, "⚠️ [loadstring+Changed] " .. obj:GetFullName(), Color3.fromRGB(255, 150, 0), findings[idx])
				totalSuspicious = totalSuspicious + 1
				foundInThis = true
			end
			
			-- TYPE 4: Chat Backdoor
			if (code:find("Chatted:Connect") or code:find("Chatted:connect")) and code:find("loadstring") then
				local idx = #findings + 1
				findings[idx] = {
					message = "💬 Chat Backdoor: " .. obj.Name,
					object = obj,
					testType = "chat",
					type = "Chat Backdoor"
				}
				AddLog(scannerLog, "⚠️ [Chat Backdoor] " .. obj:GetFullName(), Color3.fromRGB(255, 150, 0), findings[idx])
				totalSuspicious = totalSuspicious + 1
				foundInThis = true
			end
			
			-- Also check for Chatted without loadstring (could be indirect)
			if code:find("Chatted:Connect") and (code:find("FireServer") or code:find("InvokeServer")) then
				local idx = #findings + 1
				findings[idx] = {
					message = "💬 Chat-to-Remote Bridge: " .. obj.Name,
					object = obj,
					testType = "chat",
					type = "Chat Bridge"
				}
				AddLog(scannerLog, "⚠️ [Chat Bridge] " .. obj:GetFullName(), Color3.fromRGB(255, 180, 0), findings[idx])
				totalSuspicious = totalSuspicious + 1
				foundInThis = true
			end
			
			-- TYPE 5: Remote Backdoor (server scripts that execute client data)
			if (code:find("OnServerEvent:Connect") or code:find("OnServerInvoke")) and code:find("loadstring") then
				local idx = #findings + 1
				findings[idx] = {
					message = "📡 Remote executes client code: " .. obj.Name,
					object = obj,
					testType = "remote",
					type = "Remote Backdoor"
				}
				AddLog(scannerLog, "⚠️ [Remote Exec] " .. obj:GetFullName(), Color3.fromRGB(255, 150, 0), findings[idx])
				totalSuspicious = totalSuspicious + 1
				foundInThis = true
			end
			
			-- TYPE 6: HTTP Backdoor
			if (code:find("HttpService") or code:find("http_request") or code:find("syn.request") or code:find("request%(")) and code:find("loadstring") then
				local idx = #findings + 1
				findings[idx] = {
					message = "🌐 HTTP downloads & executes code: " .. obj.Name,
					object = obj,
					testType = "http",
					type = "HTTP Backdoor"
				}
				AddLog(scannerLog, "⚠️ [HTTP Exec] " .. obj:GetFullName(), Color3.fromRGB(255, 100, 0), findings[idx])
				totalSuspicious = totalSuspicious + 1
				foundInThis = true
			end
			
			-- TYPE 7: Discord Webhook in code
			if HasDiscordWebhook(code) then
				-- Extract the webhook URL
				local webhookUrl = code:match("(https?://[%w%.]+/api/webhooks/%d+/[%w%-_]+)")
				if webhookUrl then
					table.insert(webhooksFound, {
						url = webhookUrl,
						location = obj:GetFullName(),
						object = obj
					})
					AddLog(webhooksLog, "🔴 Discord Webhook in code: " .. obj.Name, Color3.new(1, 0, 0))
					AddLog(webhooksLog, "   Location: " .. obj:GetFullName(), Color3.new(1, 0.5, 0.5))
					AddLog(webhooksLog, "   Webhook: " .. webhookUrl, Color3.new(0.8, 0.8, 1))
				end
				
				local idx = #findings + 1
				findings[idx] = {
					message = "🔴 Discord Webhook: " .. obj.Name,
					object = obj,
					testType = "webhook",
					type = "Discord Webhook"
				}
				AddLog(scannerLog, "🔴 [WEBHOOK] " .. obj:GetFullName(), Color3.new(1, 0, 0), findings[idx])
				totalSuspicious = totalSuspicious + 1
				foundInThis = true
			end
			
			-- TYPE 8: Obfuscated Code
			if HasObfuscation(code) then
				local idx = #findings + 1
				findings[idx] = {
					message = "🌀 Obfuscated code: " .. obj.Name,
					object = obj,
					testType = "obfuscation",
					type = "Obfuscation"
				}
				AddLog(scannerLog, "🌀 [OBFUSCATED] " .. obj:GetFullName(), Color3.fromRGB(200, 150, 0), findings[idx])
				totalSuspicious = totalSuspicious + 1
				foundInThis = true
			end
			
			-- TYPE 9: Hidden Scripts in non-standard locations
			if (obj:IsA("Script") or obj:IsA("LocalScript")) and IsInNonStandardLocation(obj) then
				local idx = #findings + 1
				findings[idx] = {
					message = "📌 Hidden script in " .. obj.Parent.ClassName .. ": " .. obj.Name,
					object = obj,
					testType = "hidden",
					type = "Hidden Script"
				}
				AddLog(scannerLog, "📌 [HIDDEN] " .. obj:GetFullName(), Color3.fromRGB(255, 200, 0), findings[idx])
				totalSuspicious = totalSuspicious + 1
				foundInThis = true
			end
			
			-- TYPE 10: getfenv/setfenv abuse
			if code:find("getfenv") or code:find("setfenv") then
				if code:find("loadstring") or code:find("require") then
					local idx = #findings + 1
					findings[idx] = {
						message = "🔓 Environment manipulation: " .. obj.Name,
						object = obj,
						testType = "env",
						type = "getfenv/setfenv"
					}
					AddLog(scannerLog, "🔓 [ENV] " .. obj:GetFullName(), Color3.fromRGB(255, 100, 100), findings[idx])
					totalSuspicious = totalSuspicious + 1
					foundInThis = true
				end
			end
			
			-- TYPE 11: require() abuse (dynamic require)
			if code:find("require%(%d+%)") or code:find("require%s*%(%s*%d") then
				local idx = #findings + 1
				findings[idx] = {
					message = "📚 Numeric require (possible bytecode): " .. obj.Name,
					object = obj,
					testType = "require",
					type = "require() Abuse"
				}
				AddLog(scannerLog, "📚 [REQUIRE] " .. obj:GetFullName(), Color3.fromRGB(255, 120, 0), findings[idx])
				totalSuspicious = totalSuspicious + 1
				foundInThis = true
			end
			
			-- TYPE 12: Encoded/Base64 strings
			if code:find("=[%s]*base64") or code:find("Base64") or code:find("b64") then
				if code:find("decode") or code:find("Decode") then
					local idx = #findings + 1
					findings[idx] = {
						message = "🔐 Base64 encoded payload: " .. obj.Name,
						object = obj,
						testType = "encoded",
						type = "Encoded Payload"
					}
					AddLog(scannerLog, "🔐 [ENCODED] " .. obj:GetFullName(), Color3.fromRGB(200, 100, 255), findings[idx])
					totalSuspicious = totalSuspicious + 1
					foundInThis = true
				end
			end
			
			-- TYPE 13: Suspicious Remote Names
			if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
				local nameLower = obj.Name:lower()
				local suspiciousRemoteNames = {
					"exec", "execute", "run", "command", "backdoor",
					"load", "inject", "hack", "bypass", "trigger",
					"fire", "invoke", "send", "receive", "data"
				}
				for _, s in ipairs(suspiciousRemoteNames) do
					if nameLower:find(s) then
						local idx = #findings + 1
						findings[idx] = {
							message = "📡 Suspicious Remote: " .. obj.Name,
							object = obj,
							testType = "remote",
							type = "Suspicious Remote"
						}
						AddLog(scannerLog, "📡 [REMOTE] " .. obj:GetFullName(), Color3.fromRGB(255, 150, 0), findings[idx])
						totalSuspicious = totalSuspicious + 1
						foundInThis = true
						break
					end
				end
			end
		end
	end
	
	-- Final report
	AddLog(scannerLog, "═" :rep(40), Color3.new(0.5, 0.5, 0.5))
	AddLog(scannerLog, "✅ SCAN COMPLETE!", Color3.new(0, 1, 0))
	AddLog(scannerLog, "📊 Total objects scanned: " .. totalScanned, Color3.new(1, 1, 1))
	AddLog(scannerLog, "⚠️ Suspicious findings: " .. totalSuspicious, Color3.new(1, 1, 0))
	AddLog(scannerLog, "🔴 Discord Webhooks found: " .. #webhooksFound, Color3.new(1, 0, 0))
	AddLog(scannerLog, "💡 Click on any orange finding to TEST it!", Color3.new(0.8, 0.8, 1))
	
	statusLabel.Text = "✅ Done! " .. totalSuspicious .. " findings | " .. #webhooksFound .. " webhooks"
end

-- ==================== BUTTON HANDLERS ====================
scanBtn.MouseButton1Click:Connect(ScanAll)

clearBtn.MouseButton1Click:Connect(function()
	ClearFrame(scannerLog)
	ClearFrame(testsLog)
	ClearFrame(webhooksLog)
	findings = {}
	webhooksFound = {}
	totalScanned = 0
	totalSuspicious = 0
	statusLabel.Text = "Ready"
end)

-- ==================== AUTO-START ====================
-- Uncomment to auto-scan on load:
-- spawn(function()
-- 	wait(1)
-- 	ScanAll()
-- end)

statusLabel.Text = "🟢 Auditor Ready | Click SCAN to begin"
AddLog(scannerLog, "🛡️ Ultimate Backdoor Auditor v3 Loaded", Color3.new(0, 1, 0))
AddLog(scannerLog, "🔍 Detects 12+ backdoor types", Color3.new(0.8, 0.8, 1))
AddLog(scannerLog, "🧪 Click findings to test them safely", Color3.new(0.8, 0.8, 1))
AddLog(scannerLog, "🔗 Discord Webhooks appear in Webhooks tab", Color3.new(0.8, 0.8, 1))
AddLog(scannerLog, "═" :rep(40), Color3.new(0.5, 0.5, 0.5))
AddLog(scannerLog, "👆 Press SCAN button to start", Color3.new(1, 1, 0))
]]

return G2L