local main = script.Parent
local sfx = Instance.new("Sound", main)

sfx.SoundId = "rbxassetid://9114138931"
sfx.Volume = 0.5

main.ClickDetector.MouseClick:Connect(function()
	sfx:Play()
end)
