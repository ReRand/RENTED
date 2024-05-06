local cas = game:GetService("ContextActionService");
local uis = game:GetService("UserInputService");
local TweenService = game:GetService("TweenService");

local CameraShaker = require(workspace.Modules.CameraShaker)
local Values = require(workspace.Modules.Values)


local Events = script.Parent.Events;
local sprintEvent = Events.Sprint;
local crouchEvent = Events.Crouch;



local Character = script.Parent.Parent;
local Humanoid = Character:WaitForChild("Humanoid");
local Camera = workspace.CurrentCamera;

local DefaultFieldOfView = Camera.FieldOfView
local DefaultWalkingSpeed = Humanoid.WalkSpeed



local Speed = 16

local Keys = {
	Enum.KeyCode.LeftShift, 
	Enum.KeyCode.ButtonL3,
	Enum.KeyCode.ButtonY,
	Enum.KeyCode.Q
}

local StartTweenSpeed = 3
local EndTweenSpeed = 1



local SprintingTween = TweenService:Create(Camera, TweenInfo.new(StartTweenSpeed), { FieldOfView = 95 }) -- for when the player is normally sprinting
local SprintingBackTween = TweenService:Create(Camera, TweenInfo.new(EndTweenSpeed), { FieldOfView = 80 }) -- for when the player is moving backwards
local WalkingTween = TweenService:Create(Camera, TweenInfo.new(EndTweenSpeed), { FieldOfView = DefaultFieldOfView }) -- for changing the stuff back



function Start(Input)
	local Sprinting = Values:Fetch("Sprinting")
	local Crouching = Values:Fetch("Crouching")
	local Standing = Values:Fetch("Standing")
	
	
	if not Crouching.Value and not Standing.Value then

		local IntoTween: Tween = TweenService:Create(Humanoid, TweenInfo.new(StartTweenSpeed), { WalkSpeed = Speed })
		IntoTween:Play()

		Sprinting.Value = true

		SprintingTween:Play()
	end

end



Humanoid.Running:Connect(function(Speed)
	local Sprinting = Values:Fetch("Sprinting")
	local ZMoveDir = Humanoid.MoveDirection:Dot(Camera.CFrame.LookVector)
	local XMoveDir = Humanoid.MoveDirection:Dot(Camera.CFrame.RightVector)

	if Sprinting.Value then

		-- forwards and backwards
		if ZMoveDir < 0 then
			SprintingBackTween:Play()		

		elseif ZMoveDir > 0 then
			SprintingTween:Play()

		end


		-- reset
		if Speed == 0 then
			local OutTween: Tween = TweenService:Create(Humanoid, TweenInfo.new(0.3), { WalkSpeed = DefaultWalkingSpeed })
			Sprinting.Value = false

			WalkingTween:Play()
			OutTween:Play()
		end	
	end

end)



function Stop(Input)
	local Crouching = Values:Fetch("Crouching")

	
	if not Crouching.Value then

		local IntoTween: Tween = TweenService:Create(Humanoid, TweenInfo.new(0.5), { WalkSpeed = DefaultWalkingSpeed })
		IntoTween:Play()

		local Sprinting = Values:Fetch("Sprinting")
		Sprinting.Value = false

		WalkingTween:Play()
	end

end


local function Handler(Name, State, Input)
	if State == Enum.UserInputState.Begin then
		Start(Input)

	elseif State == Enum.UserInputState.End then
		Stop(Input)
	end
end


-- Bind action to function
cas:BindAction("Sprint", Handler, true, table.unpack(Keys));
cas:SetTitle("Sprint", "Sprint")