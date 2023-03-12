
local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()

--[[SolarisLib:New({
  Name - Title of the UI <string>
  FolderToSave - Name of the folder where the UI files will be stored <string>
})]]
local win = SolarisLib:New({
  Name = "RainHub V2: UnderGround War",
  FolderToSave = "RainStuff"
})
--win:Tab(title <string>)
local tab = win:Tab("Local")

--tab:Section(title <string>)
local sec = tab:Section("Local")

--sec:Slider(title <string>,default <number>,max <number>,minimum <number>,increment <number>, flag <string>, callback <function>)
local slider = sec:Slider("Walkspeed", 16,235,0,2.5,"Walkspeed", function(t)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = t
  end)

local slider = sec:Slider("Jumppower", 50,350,0,2.5,"Jumppower", function(t)
    game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = t
  end)
  sec:Button("Fly", function()
    SolarisLib:Notification("Fly", "Superman")
    local ToFly = "e" --set this to anything you want

repeat wait() 
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
local plr = game.Players.LocalPlayer 
local torso = plr.Character.Head 
local flying = false
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 50 
local speed = 0 

function Fly() 
local bg = Instance.new("BodyGyro", torso) 
bg.P = 9e4 
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
bg.cframe = torso.CFrame 
local bv = Instance.new("BodyVelocity", torso) 
bv.velocity = Vector3.new(0,0.1,0) 
bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
repeat wait() 
plr.Character.Humanoid.PlatformStand = true 
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
speed = speed+.5+(speed/maxspeed) 
if speed > maxspeed then 
speed = maxspeed 
end 
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
speed = speed-1 
if speed < 0 then 
speed = 0 
end 
end 
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
else 
bv.velocity = Vector3.new(0,0.1,0) 
end 
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
until not flying 
ctrl = {f = 0, b = 0, l = 0, r = 0} 
lastctrl = {f = 0, b = 0, l = 0, r = 0} 
speed = 0 
bg:Destroy() 
bv:Destroy() 
plr.Character.Humanoid.PlatformStand = false 
end 
mouse.KeyDown:connect(function(key) 
if key:lower() == ToFly then 
if flying then flying = false 
else 
flying = true 
Fly() 
end 
elseif key:lower() == "w" then 
ctrl.f = 1 
elseif key:lower() == "s" then 
ctrl.b = -1 
elseif key:lower() == "a" then 
ctrl.l = -1 
elseif key:lower() == "d" then 
ctrl.r = 1 
end 
end) 
mouse.KeyUp:connect(function(key) 
if key:lower() == "w" then 
ctrl.f = 0 
elseif key:lower() == "s" then 
ctrl.b = 0 
elseif key:lower() == "a" then 
ctrl.l = 0 
elseif key:lower() == "d" then 
ctrl.r = 0 
end 
end)
Fly()
    end)
--win:Tab(title <string>)
local tab = win:Tab("Main")

--tab:Section(title <string>)
local sec = tab:Section("Main")

--sec:Button(title <string>, callback <function>)
sec:Button("Bypass AC", function()
  SolarisLib:Notification("AC Bypass", "Anticheat Bypass")
  game:GetService("Players").LocalPlayer.PlayerGui.Main.GameStats.AntiCheat.SelectScript:Destroy()
  game:GetService("Lighting").GameModel.Events.Events.NotifyAntiCheat:Destroy()
end)

sec:Button("Teleport Red", function()
  SolarisLib:Notification("Red Teleport", "Teleports you to Red Team's Flag")
  local teleport_table = {
location1 = Vector3.new(-7.5, 14.5, 75.5)
}
tween_s = game:GetService('TweenService')
tweeninfo = TweenInfo.new(3.5, Enum. EasingStyle.Linear)

lp = game.Players.LocalPlayer

function bypass_teleport(v)
if lp.Character and
lp.Character:FindFirstChild('HumanoidRootPart') then
local cf = CFrame.new(v)
local a = tween_s:Create(lp.Character.HumanoidRootPart, tweeninfo,{CFrame = cf})
    a:Play()

end
end

bypass_teleport(teleport_table.location1)
end)
sec:Button("Teleport Blue", function()
  SolarisLib:Notification("Blue Teleport", "Teleports you to Blue Team's Flag")
  local teleport_table = {
location1 = Vector3.new(6.5, 14.5, -73.5)
}
tween_s = game:GetService('TweenService')
tweeninfo = TweenInfo.new(3.5, Enum. EasingStyle.Linear)

lp = game.Players.LocalPlayer

function bypass_teleport(v)
if lp.Character and
lp.Character:FindFirstChild('HumanoidRootPart') then
local cf = CFrame.new(v)
local a = tween_s:Create(lp.Character.HumanoidRootPart, tweeninfo,{CFrame = cf})
    a:Play()

end
end

bypass_teleport(teleport_table.location1)
end)

--win:Tab(title <string>)
local tab = win:Tab("Other")

--tab:Section(title <string>)
local sec = tab:Section("Other")--sec:Colorpicker(title <string>, default <color3>, flag <string>, callback <function>)
sec:Colorpicker("Colorpicker", Color3.fromRGB(255,255,255),"Colorpicker", function(t)
	win.Color = Color3.fromRGB(t,t,t)
  end)
sec:Button("ESP", function()
	local players = game.Players:GetPlayers()

	for i,v in pairs(players) do
	 local esp = Instance.new("Highlight")
	 esp.Name = v.Name
	 esp.FillTransparency = 0
	 esp.FillColor = Color3.new(t)
	 esp.OutlineColor = Color3.new(t)
	 esp.OutlineTransparency = 0
	 esp.Parent = v.Character
	end
end)
--sec:Button(title <string>, callback <function>)
sec:Button("Rainbow Character {NOT FE}", function()
  SolarisLib:Notification("Rainbow Character {NOT FE}", "Gay")
  r = 255
g = 0
b = 0

while true do
	
	game.Players.LocalPlayer.Character.Shirt:Destroy()
	game.Players.LocalPlayer.Character.Pants:Destroy()
	game.Players.LocalPlayer.Character["Left Arm"].Transparency = 0.5
	game.Players.LocalPlayer.Character.Head.Transparency = 0.5
	game.Players.LocalPlayer.Character.Torso.Transparency = 0.5
	game.Players.LocalPlayer.Character["Right Arm"].Transparency = 0.5
	game.Players.LocalPlayer.Character["Left Leg"].Transparency = 0.5
	game.Players.LocalPlayer.Character["Right Leg"].Transparency = 0.5
    while (r == 255 and g ~= 255) do
	wait(0.1)
	g = g + 1
		game.Players.LocalPlayer.Character.Torso.Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character.Head.Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Left Arm"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Right Arm"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Left Leg"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Right Leg"].Color = Color3.fromRGB(r,g,b)
	end
	wait(0.1)
	r = r - 1
	game.Players.LocalPlayer.Character.Torso.Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character.Head.Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character["Left Arm"].Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character["Right Arm"].Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character["Left Leg"].Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character["Right Leg"].Color = Color3.fromRGB(r,g,b)
	while (r ~= 0) do
	wait(0.1)
	r = r - 1
		game.Players.LocalPlayer.Character.Torso.Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character.Head.Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Left Arm"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Right Arm"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Left Leg"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Right Leg"].Color = Color3.fromRGB(r,g,b)
	end

    while (g == 255 and b ~= 255) do
	wait(0.1)
	b = b + 1
		game.Players.LocalPlayer.Character.Torso.Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character.Head.Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Left Arm"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Right Arm"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Left Leg"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Right Leg"].Color = Color3.fromRGB(r,g,b)
	end
	wait(0.1)
	g = g - 1
	game.Players.LocalPlayer.Character.Torso.Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character.Head.Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character["Left Arm"].Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character["Right Arm"].Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character["Left Leg"].Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character["Right Leg"].Color = Color3.fromRGB(r,g,b)
	while (g ~= 0) do
	wait(0.1)
	g = g - 1
		game.Players.LocalPlayer.Character.Torso.Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character.Head.Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Left Arm"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Right Arm"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Left Leg"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Right Leg"].Color = Color3.fromRGB(r,g,b)
	end
	
	while (b == 255 and r ~= 255) do
	wait(0.1)
	r = r + 1
		game.Players.LocalPlayer.Character.Torso.Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character.Head.Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Left Arm"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Right Arm"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Left Leg"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Right Leg"].Color = Color3.fromRGB(r,g,b)
	end
	wait(0.1)
	b = b - 1
	game.Players.LocalPlayer.Character.Torso.Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character.Head.Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character["Left Arm"].Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character["Right Arm"].Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character["Left Leg"].Color = Color3.fromRGB(r,g,b)
	game.Players.LocalPlayer.Character["Right Leg"].Color = Color3.fromRGB(r,g,b)
	while (b ~= 0) do
	wait(0.1)
	b = b - 1
		game.Players.LocalPlayer.Character.Torso.Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character.Head.Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Left Arm"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Right Arm"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Left Leg"].Color = Color3.fromRGB(r,g,b)
		game.Players.LocalPlayer.Character["Right Leg"].Color = Color3.fromRGB(r,g,b)
	end
	
end
end)

