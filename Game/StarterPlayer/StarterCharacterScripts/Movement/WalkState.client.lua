local playerModel = script.Parent.Parent
local Humanoid = playerModel:WaitForChild("Humanoid")
local Values = require(workspace.Modules.Values)


Humanoid:SetStateEnabled(12, false)


Humanoid.Running:Connect(function(speed)
	local Standing = Values:Fetch("Standing")
	local Walking = Values:Fetch("Walking")
	local Sprinting = Values:Fetch("Sprinting")
	local Crouching = Values:Fetch("Crouching")


	if speed == 0 then
		Standing.Value = true
		Walking.Value = false
		
	else
		Standing.Value = false

		if not Sprinting.Value and not Crouching.Value then 
			Walking.Value = true
		else
			Walking.Value = false
		end
		
	end
end)
