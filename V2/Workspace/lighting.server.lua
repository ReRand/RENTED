local lighting = game:GetService("Lighting");
local screenGui = game:GetService("StarterGui").ScreenGui;
local ingame = lighting.Ingame;

lighting.ClockTime = 5;
lighting.Atmosphere.Density = ingame.Density.Value;
lighting.Brightness = ingame.Brihgtness.Value;
lighting.Ambient = ingame.Ambient.Value;

lighting.ColorCorrection.Contrast = ingame.Contrast.Value;

screenGui.ngihtText.TextTransparency = 1;
