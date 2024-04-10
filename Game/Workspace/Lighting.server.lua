local lighting = game:GetService("Lighting");
local screenGui = game:GetService("StarterGui").ScreenGui;
local ingame = lighting.Ingame;


lighting.ClockTime = 5;
lighting.Brightness = ingame.Brihgtness.Value;
lighting.Ambient = ingame.Ambient.Value;


lighting.Atmosphere.Density = ingame.Density.Value;


lighting.ColorCorrection.Contrast = ingame.Contrast.Value;


screenGui.NightText.TextTransparency = 1;
