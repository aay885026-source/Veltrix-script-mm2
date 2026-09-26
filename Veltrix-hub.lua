-- Veltrix Hub (by : b8zm) - MM2 Ultimate Edition
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SetClipboard = toclipboard or setclipboard or Clipboard and Clipboard.set
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("VeltrixHubFinalUI") then
	PlayerGui.VeltrixHubFinalUI:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VeltrixHubFinalUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- زر العائم الاحترافي
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 85, 0, 38)
toggleBtn.Position = UDim2.new(0, 15, 0.35, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(110, 35, 200)
toggleBtn.Text = "Veltrix Hub"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 11
toggleBtn.Parent = screenGui
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 8)
local tStroke = Instance.new("UIStroke", toggleBtn)
tStroke.Color = Color3.fromRGB(180, 100, 255)
tStroke.Thickness = 2

-- النافذة الرئيسية
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 520, 0, 350)
mainFrame.Position = UDim2.new(0.5, -260, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 16, 30)
mainFrame.ClipsDescendants = true
mainFrame.Visible = false
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)
local mStroke = Instance.new("UIStroke", mainFrame)
mStroke.Color = Color3.fromRGB(120, 50, 210)
mStroke.Thickness = 1.5

toggleBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)

-- الشريط العلوي
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 38)
topBar.BackgroundColor3 = Color3.fromRGB(28, 22, 42)
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local hubTitleLbl = Instance.new("TextLabel")
hubTitleLbl.Size = UDim2.new(0, 300, 1, 0)
hubTitleLbl.Position = UDim2.new(0, 12, 0, 0)
hubTitleLbl.BackgroundTransparency = 1
hubTitleLbl.Text = "Veltrix Hub | by : b8zm"
hubTitleLbl.TextColor3 = Color3.fromRGB(220, 180, 255)
hubTitleLbl.Font = Enum.Font.GothamBold
hubTitleLbl.TextSize = 13
hubTitleLbl.TextXAlignment = Enum.TextXAlignment.Left
hubTitleLbl.Parent = topBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -32, 0, 5)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(170, 150, 200)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 13
closeBtn.Parent = topBar
closeBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
end)

-- حاوي التبويبات
local tabsContainer = Instance.new("ScrollingFrame")
tabsContainer.Size = UDim2.new(1, -210, 1, 0)
tabsContainer.Position = UDim2.new(0, 190, 0, 0)
tabsContainer.BackgroundTransparency = 1
tabsContainer.CanvasSize = UDim2.new(0, 400, 0, 0)
tabsContainer.ScrollBarThickness = 0
tabsContainer.Parent = topBar

local tabsLayout = Instance.new("UIListLayout")
tabsLayout.FillDirection = Enum.FillDirection.Horizontal
tabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabsLayout.Padding = UDim.new(0, 8)
tabsLayout.Parent = tabsContainer

-- حاوي الصفحات
local pagesContainer = Instance.new("Frame")
pagesContainer.Size = UDim2.new(1, 0, 1, -38)
pagesContainer.Position = UDim2.new(0, 0, 0, 38)
pagesContainer.BackgroundTransparency = 1
pagesContainer.Parent = mainFrame

local pages = {}
local tabButtons = {}

local function createTab(name, order)
	local tBtn = Instance.new("TextButton")
	tBtn.Size = UDim2.new(0, 72, 1, 0)
	tBtn.BackgroundTransparency = 1
	tBtn.Text = name
	tBtn.TextColor3 = (order == 1) and Color3.fromRGB(255, 100, 180) or Color3.fromRGB(160, 140, 190)
	tBtn.Font = Enum.Font.GothamMedium
	tBtn.TextSize = 10
	tBtn.LayoutOrder = order
	tBtn.Parent = tabsContainer

	local page = Instance.new("ScrollingFrame")
	page.Size = UDim2.new(1, 0, 1, 0)
	page.BackgroundTransparency = 1
	page.ScrollBarThickness = 3
	page.ScrollBarImageColor3 = Color3.fromRGB(140, 70, 230)
	page.Visible = (order == 1)
	page.Parent = pagesContainer

	local pLayout = Instance.new("UIListLayout")
	pLayout.SortOrder = Enum.SortOrder.LayoutOrder
	pLayout.Padding = UDim.new(0, 5)
	pLayout.Parent = page

	local pPadding = Instance.new("UIPadding")
	pPadding.PaddingTop = UDim.new(0, 6)
	pPadding.PaddingBottom = UDim.new(0, 6)
	pPadding.PaddingLeft = UDim.new(0, 10)
	pPadding.PaddingRight = UDim.new(0, 10)
	pPadding.Parent = page

	pages[order] = page
	tabButtons[order] = tBtn

	tBtn.MouseButton1Click:Connect(function()
		for k, p in pairs(pages) do
			p.Visible = false
			tabButtons[k].TextColor3 = Color3.fromRGB(160, 140, 190)
		end
		page.Visible = true
		tBtn.TextColor3 = Color3.fromRGB(255, 100, 180)
	end)

	return page
end

local tabProj = createTab("Project", 1)
local tabGame = createTab("Gameplay", 2)
local tabEsp = createTab("ESP", 3)
local tabAuto = createTab("Auto Farm", 4)
local tabCoin = createTab("Coin Farm", 5)

local function addSectionTitle(parent, title)
	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, 0, 0, 20)
	lbl.BackgroundTransparency = 1
	lbl.Text = title
	lbl.TextColor3 = Color3.fromRGB(130, 110, 160)
	lbl.Font = Enum.Font.GothamBold
	lbl.TextSize = 10
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = parent
end

local function addToggle(parent, text, callback)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, 0, 0, 32)
	row.BackgroundColor3 = Color3.fromRGB(25, 20, 38)
	row.Parent = parent
	Instance.new("UICorner", row).CornerRadius = UDim.new(0, 5)

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(0.7, 0, 1, 0)
	lbl.Position = UDim2.new(0, 8, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.Text = text
	lbl.TextColor3 = Color3.fromRGB(210, 200, 230)
	lbl.Font = Enum.Font.GothamMedium
	lbl.TextSize = 11
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = row

	local tBtn = Instance.new("TextButton")
	tBtn.Size = UDim2.new(0, 36, 0, 18)
	tBtn.Position = UDim2.new(1, -44, 0.5, -9)
	tBtn.BackgroundColor3 = Color3.fromRGB(45, 35, 65)
	tBtn.Text = ""
	tBtn.Parent = row
	Instance.new("UICorner", tBtn).CornerRadius = UDim.new(0, 9)

	local circle = Instance.new("Frame")
	circle.Size = UDim2.new(0, 14, 0, 14)
	circle.Position = UDim2.new(0, 2, 0.5, -7)
	circle.BackgroundColor3 = Color3.fromRGB(170, 150, 200)
	circle.Parent = tBtn
	Instance.new("UICorner", circle).CornerRadius = UDim.new(0, 7)

	local active = false
	tBtn.MouseButton1Click:Connect(function()
		active = not active
		if active then
			tBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 120)
			circle:TweenPosition(UDim2.new(1, -16, 0.5, -7), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
		else
			tBtn.BackgroundColor3 = Color3.fromRGB(45, 35, 65)
			circle:TweenPosition(UDim2.new(0, 2, 0.5, -7), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
		end
		callback(active)
	end)
end

local function addButton(parent, text, isRed, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 32)
	btn.BackgroundColor3 = isRed and Color3.fromRGB(180, 50, 70) or Color3.fromRGB(30, 24, 46)
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(240, 230, 250)
	btn.Font = Enum.Font.GothamMedium
	btn.TextSize = 11
	btn.Parent = parent
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
	btn.MouseButton1Click:Connect(callback)
end

-- ==================== [1. TAB: Project] ====================
addSectionTitle(tabProj, "INFO & CREDITS")
addButton(tabProj, "Veltrix Hub - Created by b8zm", false, function() end)

addSectionTitle(tabProj, "COMMUNITY")
local dcBtn = Instance.new("TextButton")
dcBtn.Size = UDim2.new(1, 0, 0, 36)
dcBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242) -- لون ديسكورد الأزرق
dcBtn.Text = "💬  سيرفرنا ديسكورد"
dcBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
dcBtn.Font = Enum.Font.GothamBold
dcBtn.TextSize = 12
dcBtn.Parent = tabProj
Instance.new("UICorner", dcBtn).CornerRadius = UDim.new(0, 6)

dcBtn.MouseButton1Click:Connect(function()
	if SetClipboard then
		SetClipboard("https://discord.gg/gkKRKVBF8J")
		dcBtn.Text = "تم النسخ!"
		task.wait(1.5)
		dcBtn.Text = "💬  سيرفرنا ديسكورد"
	else
		dcBtn.Text = "المنفذ لا يدعم النسخ التلقائي"
		task.wait(1.5)
		dcBtn.Text = "💬  سيرفرنا ديسكورد"
	end
end)

-- ==================== [2. TAB: Gameplay] ====================
addSectionTitle(tabGame, "TOOLS & COMBAT")
addButton(tabGame, "Pick Up Gun / Drop", false, function()
	local gd = workspace:FindFirstChild("GunDrop", true) or workspace:FindFirstChild("KnifeDrop", true)
	if gd and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		LocalPlayer.Character.HumanoidRootPart.CFrame = gd.CFrame
	end
end)

addButton(tabGame, "Kill All (للقتال كـ قاتل)", true, function()
	pcall(function()
		local char = LocalPlayer.Character
		local knife = char and char:FindFirstChild("Knife") or LocalPlayer.Backpack:FindFirstChild("Knife")
		if knife then
			knife.Parent = char
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
					char.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame
					task.wait(0.1)
					knife:Activate()
				end
			end
		end
	end)
end)

addToggle(tabGame, "Kill Murder (الشرطي يطلق على القاتل تلقائياً)", function(v)
	task.spawn(function()
		while v and task.wait(0.3) do
			pcall(function()
				local char = LocalPlayer.Character
				local gun = char and char:FindFirstChild("Gun") or LocalPlayer.Backpack:FindFirstChild("Gun")
				if gun then
					gun.Parent = char
					for _, p in ipairs(Players:GetPlayers()) do
						if p ~= LocalPlayer and p.Character then
							if p.Backpack:FindFirstChild("Knife") or p.Character:FindFirstChild("Knife") then
								local tHRP = p.Character:FindFirstChild("HumanoidRootPart")
								if tHRP then
									gun.Shoot:FireServer(tHRP.Position, tHRP.Position)
								end
							end
						end
					end
				end
			end)
		end
	end)
end)

addSectionTitle(tabGame, "PLAYER SPEED & STABILS")
local customPlayerSpeed = 22

addToggle(tabGame, "تفعيل سرعة اللاعب المخصصة", function(v)
	task.spawn(function()
		while v and task.wait(0.2) do
			local char = LocalPlayer.Character
			if char and char:FindFirstChild("Humanoid") then
				char.Humanoid.WalkSpeed = customPlayerSpeed
			end
		end
		if not v then
			local char = LocalPlayer.Character
			if char and char:FindFirstChild("Humanoid") then
				char.Humanoid.WalkSpeed = 16
			end
		end
	end)
end)

local speedInputRow = Instance.new("Frame")
speedInputRow.Size = UDim2.new(1, 0, 0, 32)
speedInputRow.BackgroundColor3 = Color3.fromRGB(25, 20, 38)
speedInputRow.Parent = tabGame
Instance.new("UICorner", speedInputRow).CornerRadius = UDim.new(0, 5)

local speedLbl = Instance.new("TextLabel")
speedLbl.Size = UDim2.new(0.6, 0, 1, 0)
speedLbl.Position = UDim2.new(0, 8, 0, 0)
speedLbl.BackgroundTransparency = 1
speedLbl.Text = "اكتب سرعة المشي:"
speedLbl.TextColor3 = Color3.fromRGB(210, 200, 230)
speedLbl.Font = Enum.Font.GothamMedium
speedLbl.TextSize = 11
speedLbl.TextXAlignment = Enum.TextXAlignment.Left
speedLbl.Parent = speedInputRow

local speedTextBox = Instance.new("TextBox")
speedTextBox.Size = UDim2.new(0, 80, 0, 22)
speedTextBox.Position = UDim2.new(1, -88, 0.5, -11)
speedTextBox.BackgroundColor3 = Color3.fromRGB(45, 35, 65)
speedTextBox.Text = tostring(customPlayerSpeed)
speedTextBox.TextColor3 = Color3.fromRGB(255, 180, 255)
speedTextBox.Font = Enum.Font.GothamBold
speedTextBox.TextSize = 12
speedTextBox.Parent = speedInputRow
Instance.new("UICorner", speedTextBox).CornerRadius = UDim.new(0, 4)

speedTextBox.FocusLost:Connect(function()
	local num = tonumber(speedTextBox.Text)
	if num then
		customPlayerSpeed = num
	else
		speedTextBox.Text = tostring(customPlayerSpeed)
	end
end)

addToggle(tabGame, "Anti-Slow (منع البطء والتجميد)", function(v)
	task.spawn(function()
		while v and task.wait(0.5) do
			pcall(function()
				local char = LocalPlayer.Character
				if char and char:FindFirstChild("Humanoid") and char.Humanoid.WalkSpeed < 16 then
					char.Humanoid.WalkSpeed = 16
				end
			end)
		end
	end)
end)

-- الطيران الموجه للجوال
addSectionTitle(tabGame, "FLY CONTROL (طيران موجه للجوال)")
local flyGuiParent = Instance.new("ScreenGui")
flyGuiParent.Name = "VeltrixFlyControls"
flyGuiParent.ResetOnSpawn = false
flyGuiParent.Enabled = false
flyGuiParent.Parent = PlayerGui

local function createFlyButton(text, pos)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 50, 0, 50)
	btn.Position = pos
	btn.BackgroundColor3 = Color3.fromRGB(110, 35, 200)
	btn.BackgroundTransparency = 0.3
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	btn.Parent = flyGuiParent
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 25)
	return btn
end

local btnForward = createFlyButton("▲", UDim2.new(0.82, 0, 0.55, -60))
local btnBackward = createFlyButton("▼", UDim2.new(0.82, 0, 0.55, 60))
local btnLeft = createFlyButton("◄", UDim2.new(0.82, -60, 0.55, 0))
local btnRight = createFlyButton("►", UDim2.new(0.82, 60, 0.55, 0))
local btnUp = createFlyButton("UP", UDim2.new(0.92, 0, 0.55, -40))
local btnDown = createFlyButton("DN", UDim2.new(0.92, 0, 0.55, 40))

local movingForward, movingBackward, movingLeft, movingRight, movingUp, movingDown = false, false, false, false, false, false

btnForward.MouseButton1Down:Connect(function() movingForward = true end)
btnForward.MouseButton1Up:Connect(function() movingForward = false end)
btnBackward.MouseButton1Down:Connect(function() movingBackward = true end)
btnBackward.MouseButton1Up:Connect(function() movingBackward = false end)
btnLeft.MouseButton1Down:Connect(function() movingLeft = true end)
btnLeft.MouseButton1Up:Connect(function() movingLeft = false end)
btnRight.MouseButton1Down:Connect(function() movingRight = true end)
btnRight.MouseButton1Up:Connect(function() movingRight = false end)
btnUp.MouseButton1Down:Connect(function() movingUp = true end)
btnUp.MouseButton1Up:Connect(function() movingUp = false end)
btnDown.MouseButton1Down:Connect(function() movingDown = true end)
btnDown.MouseButton1Up:Connect(function() movingDown = false end)

local flying = false
local flySpeed = 50
local bv, bg

addToggle(tabGame, "Fly GUI (طيران حر بالجوال)", function(v)
	flying = v
	flyGuiParent.Enabled = v
	local char = LocalPlayer.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart
	local cam = workspace.CurrentCamera

	if flying then
		bv = Instance.new("BodyVelocity", hrp)
		bg = Instance.new("BodyGyro", hrp)
		bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
		bv.Velocity = Vector3.new(0, 0, 0)
		bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.CFrame = hrp.CFrame

		task.spawn(function()
			while flying and char and char.Parent do
				local moveDir = Vector3.new()
				local camCF = cam.CFrame
				
				if movingForward or UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCF.LookVector end
				if movingBackward or UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCF.LookVector end
				if movingLeft or UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCF.RightVector end
				if movingRight or UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCF.RightVector end
				if movingUp then moveDir = moveDir + Vector3.new(0, 1, 0) end
				if movingDown then moveDir = moveDir - Vector3.new(0, 1, 0) end

				bg.CFrame = camCF
				if moveDir.Magnitude > 0 then
					bv.Velocity = moveDir.Unit * flySpeed
				else
					bv.Velocity = Vector3.new(0, 0.1, 0)
				end
				RunService.RenderStepped:Wait()
			end
			if bv then bv:Destroy() end
			if bg then bg:Destroy() end
		end)
	else
		if bv then bv:Destroy() end
		if bg then bg:Destroy() end
	end
end)

addToggle(tabGame, "Noclip", function(v)
	task.spawn(function()
		while v and task.wait() do
			if LocalPlayer.Character then
				for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
					if part:IsA("BasePart") then part.CanCollide = false end
				end
			end
		end
	end)
end)

-- ==================== [3. TAB: ESP] ====================
addSectionTitle(tabEsp, "ESP SETTINGS (يكشف الدور قبل بدء الجولة)")
addToggle(tabEsp, "Players ESP (كشف الأدوار المسبق للقاتل والشريف)", function(v)
	task.spawn(function()
		while v and task.wait(0.2) do
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LocalPlayer and p.Character then
					local isMurder = false
					local isSheriff = false
					
					if p.Backpack:FindFirstChild("Knife") or p.Character:FindFirstChild("Knife") then isMurder = true end
					if p.Backpack:FindFirstChild("Gun") or p.Character:FindFirstChild("Gun") or p.Backpack:FindFirstChild("Revolver") or p.Character:FindFirstChild("Revolver") then isSheriff = true end

					local col = Color3.fromRGB(0, 255, 100)
					if isMurder then col = Color3.fromRGB(255, 40, 40) end
					if isSheriff then col = Color3.fromRGB(40, 120, 255) end

					local hl = p.Character:FindFirstChild("VeltrixESP")
					if not hl then
						hl = Instance.new("Highlight", p.Character)
						hl.Name = "VeltrixESP"
					end
					hl.FillColor = col
					hl.OutlineColor = Color3.fromRGB(255, 255, 255)
					hl.FillTransparency = 0.4
					hl.OutlineTransparency = 0
					hl.Enabled = true
				end
			end
		end
		if not v then
			for _, p in ipairs(Players:GetPlayers()) do
				if p.Character and p.Character:FindFirstChild("VeltrixESP") then
					p.Character.VeltrixESP:Destroy()
				end
			end
		end
	end)
end)

addToggle(tabEsp, "Coin ESP (كشف أماكن الكوينات بالخريطة)", function(v)
	task.spawn(function()
		while v and task.wait(1) do
			for _, coin in ipairs(workspace:GetDescendants()) do
				if coin:IsA("BasePart") and (coin.Name == "Coin" or coin.Name:lower():find("coin") or coin.Name:lower():find("gold") or coin.Parent.Name:lower():find("coin")) then
					local hl = coin:FindFirstChild("CoinESP")
					if not hl then
						hl = Instance.new("Highlight", coin)
						hl.Name = "CoinESP"
						hl.FillColor = Color3.fromRGB(255, 215, 0)
						hl.OutlineColor = Color3.fromRGB(255, 255, 255)
						hl.FillTransparency = 0.2
					end
					hl.Enabled = true
				end
			end
		end
		if not v then
			for _, coin in ipairs(workspace:GetDescendants()) do
				if coin:IsA("BasePart") and coin:FindFirstChild("CoinESP") then
					coin.CoinESP:Destroy()
				end
			end
		end
	end)
end)

-- ==================== [4. TAB: Auto Farm] ====================
addSectionTitle(tabAuto, "AUTOFARM FEATURES")
addToggle(tabAuto, "Auto Teleport At Spawn", function(v) print(v) end)
addToggle(tabAuto, "Auto Prestige", function(v) print(v) end)

-- ==================== [5. TAB: Coin Farm] ====================
addSectionTitle(tabCoin, "COIN FARM (التجميع السلس القديم)")
addToggle(tabCoin, "تفعيل جمع الكوينات", function(v)
	task.spawn(function()
		while v and task.wait(0.4) do
			pcall(function()
				local char = LocalPlayer.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				if hrp then
					for _, coin in ipairs(workspace:GetDescendants()) do
						if coin:IsA("BasePart") and (coin.Name == "Coin" or coin.Name:lower():find("coin") or coin.Parent.Name:lower():find("coin")) then
							hrp.CFrame = coin.CFrame
							task.wait(0.1)
						end
					end
				end
			end)
		end
	end)
end)

print("Veltrix Hub Loaded Successfully!")
