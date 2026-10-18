-- PlayerManager.server.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameManager = require(script.Parent.GameManager)

local function onPlayerAdded(player)
    print(player.Name .. " joined the game")
    
    -- Initialize player data
    player:SetAttribute("Score", 0)
    player:SetAttribute("IsFrozen", false)
    
    -- Handle player actions
    player.CharacterAdded:Connect(function(character)
        -- Handle character actions
    end)
end

local function onPlayerRemoving(player)
    print(player.Name .. " left the game")
end

Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)

return {
    onPlayerAdded = onPlayerAdded,
    onPlayerRemoving = onPlayerRemoving
}