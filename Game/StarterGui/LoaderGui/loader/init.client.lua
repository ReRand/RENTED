local camera = workspace.CurrentCamera
local Values = require(workspace.Modules.Values)

local ContextActionService = game:GetService("ContextActionService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local music = script.music:GetChildren()
local ding = script.ding

script.Parent.Enabled = true

local colors = game.Lighting.ColorCorrection
colors.Brightness = -1


-- player.CameraMode = Enum.CameraMode.Classic
camera.CameraType = Enum.CameraType.Scriptable


local song = music[math.random(1, #music)]
song:Play()


wait(script.Parent.LoadTime.Value)


local info1 = TweenInfo.new(3, Enum.EasingStyle.Linear)
local info2 = TweenInfo.new(5, Enum.EasingStyle.Linear)


for _, child in pairs(script.Parent:GetChildren()) do
	if not not child.ClassName:match("Label$") then
		
		if child.ClassName == "TextLabel" then
			TweenService:Create(child, info1, { TextTransparency = 1 }):Play()
			
		elseif child.ClassName == "ImageLabel" then
			TweenService:Create(child, info1, { ImageTransparency = 1 }):Play()
			TweenService:Create(child, info2, { BackgroundTransparency = 1 }):Play()
		end
		
	end
end


Values:Fetch("Loaded").Value = true
ContextActionService:UnbindAction("freezeMovement")
StarterGui:SetCore("ResetButtonCallback", true) 
camera.CameraType = Enum.CameraType.Custom


TweenService:Create(song, info1, { Volume = 0 }):Play();


ding:Play()


TweenService:Create(colors, info2, { Brightness = 0 }):Play();