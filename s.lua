-- Services
local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")
local r = game:GetService("RunService")

-------------------------------------------------
-- Anti AFK
-------------------------------------------------
task.spawn(function()
    local VirtualUser = game:GetService('VirtualUser')

    game:GetService('Players').LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "AntiAFK loaded!",
        Text = "Made by Gio",
        Button1 = "Thanks",
        Duration = 5
    })
end)
-------------------------------------------------
-- Noclip GUI
-------------------------------------------------
local g=Instance.new("ScreenGui",game.CoreGui)
g.Name="IconNoclip"

local b=Instance.new("ImageButton",g)
b.Size=UDim2.new(0,48,0,48)
b.Position=UDim2.new(0,20,0,280)
b.BackgroundColor3=Color3.fromRGB(20,20,20)
b.AutoButtonColor=false
b.Active=true
b.Draggable=true
b.Image=""

local corner=Instance.new("UICorner",b)
corner.CornerRadius=UDim.new(0,12)

local stroke=Instance.new("UIStroke",b)
stroke.Thickness=2
stroke.Color=Color3.fromRGB(70,70,70)

local pad=Instance.new("UIPadding",b)
pad.PaddingTop=UDim.new(0,6)
pad.PaddingBottom=UDim.new(0,6)
pad.PaddingLeft=UDim.new(0,6)
pad.PaddingRight=UDim.new(0,6)

local txt=Instance.new("TextLabel",b)
txt.Size=UDim2.new(1,0,1,0)
txt.BackgroundTransparency=1
txt.Text="noclip"
txt.TextColor3=Color3.fromRGB(230,230,230)
txt.Font=Enum.Font.GothamBold
txt.TextSize=13
txt.TextXAlignment=Enum.TextXAlignment.Center
txt.TextYAlignment=Enum.TextYAlignment.Center

-------------------------------------------------
-- Noclip System
-------------------------------------------------
local n,c=false,nil

local function set(s)
	n=s
	stroke.Color=n and Color3.fromRGB(0,255,120) or Color3.fromRGB(70,70,70)
	if c then c:Disconnect() end

	if n then
		c=r.Stepped:Connect(function()
			if p.Character then
				for _,v in ipairs(p.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide=false
					end
				end
			end
		end)
	else
		if p.Character then
			for _,v in ipairs(p.Character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide=true
				end
			end
		end
	end
end

b.MouseButton1Click:Connect(function()
	set(not n)
end)

u.InputBegan:Connect(function(i,gp)
	if not gp and i.KeyCode==Enum.KeyCode.V then
		set(not n)
	end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Skibidiking123/Fisch1/refs/heads/main/FischMain"))()
