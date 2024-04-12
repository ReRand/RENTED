local CameraShaker = require(workspace.Modules.CameraShaker);
local CameraShakeInstance = CameraShaker.CameraShakeInstance;


local RunService = game:GetService("RunService");
local camera = workspace.CurrentCamera;
local character = script.Parent:IsA("Character") and script.Parent or script.Parent.Parent;
local humanoid = character:WaitForChild("Humanoid");
local hrp = character:WaitForChild("HumanoidRootPart");


local cs = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCFrame)
	camera.CFrame *= shakeCFrame
end)


cs:Start()


local shaking = false;


local idleCsi = CameraShakeInstance.new( 0.1, 1, 1, 10)
idleCsi.PositionInfluence = Vector3.new(0.01, 0.01, 0.01)
idleCsi.RotationInfluence = Vector3.new(1, 1, 1)


cs:ShakeSustain(idleCsi);


local csi = nil;
local fadeTime = 0.3;


RunService.RenderStepped:Connect(function()
	if not (humanoid.MoveDirection == Vector3.new()) then
		if not shaking then
			
			shaking = true;
			
			task.wait(0.1);
			
			csi = CameraShakeInstance.new( ((hrp.Velocity.Magnitude/3)/10 or 0.3), 2, 1, fadeTime)
			csi.PositionInfluence = Vector3.new(0.15, 4, 0.15)
			csi.RotationInfluence = Vector3.new(0.5, 0.5, 3)
			
			cs:ShakeSustain(csi);
		end
		
	elseif shaking then
		csi:StartFadeOut(fadeTime)
		shaking = false;
	end;
end)
