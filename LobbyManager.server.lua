-- LobbyManager.server.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameManager = require(script.Parent.GameManager)

local function teleportToLobby(player)
    -- Teleport player to the lobby area
    local lobbySpawn = workspace:FindFirstChild("LobbySpawn")
    if lobbySpawn then
        player.Character:MoveTo(lobbySpawn.Position)
    end
end

local function onPlayerAdded(player)
    teleportToLobby(player)
end

Players.PlayerAdded:Connect(onPlayerAdded)

return {
    teleportToLobby = teleportToLobby,
    onPlayerAdded = onPlayerAdded
}