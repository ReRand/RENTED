game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)


local camera = workspace.CurrentCamera


local player = game.Players.LocalPlayer
local Values = require(workspace.Modules.Values)


local mouse = player:GetMouse()
mouse.Icon = "rbxassetid://14013223911"


repeat task.wait() until Values:FetchRel("Game", "Loaded").Value
