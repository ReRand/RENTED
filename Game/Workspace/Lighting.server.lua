local lighting = game:GetService("Lighting");
local nightGui = game:GetService("StarterGui").NightGui;
local ingame = lighting.Ingame;


lighting.ClockTime = 5;
lighting.Brightness = ingame.Brihgtness.Value;
lighting.Ambient = ingame.Ambient.Value;


lighting.Atmosphere.Density = ingame.Density.Value;


lighting.ColorCorrection.Contrast = ingame.Contrast.Value;


nightGui.NightText.TextTransparency = 1;
