local TweenService = game:GetService('TweenService')
local main = script.Parent

local info = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut) -- Quad

local tween = TweenService:Create(main, info, { Rotation = 360 });

tween:Play()

tween.Completed:Connect(function()
	if script.Parent.ImageTransparency == 1 then
		return script:Destroy()
	end
	
	main.Rotation = 0
	tween:Play()
end)