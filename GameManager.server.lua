-- GameManager.server.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameState = {
    Lobby = "Lobby",
    Playing = "Playing",
    Ended = "Ended"
}

local currentState = GameState.Lobby
local currentRound = 0
local maxRounds = 5
local roundDuration = 300 -- 5 minutes in seconds
local lobbyWaitTime = 40 -- 40 seconds

local function startRound()
    currentState = GameState.Playing
    currentRound = currentRound + 1
    print("Round " .. currentRound .. " started")
    
    -- Choose a player to freeze
    local players = Players:GetPlayers()
    local chosenPlayer = players[math.random(1, #players)]
    
    -- Notify all players about the chosen player
    for _, player in ipairs(players) do
        if player == chosenPlayer then
            player:LoadCharacter() -- Freeze the chosen player
        end
    end
    
    -- Start the round timer
    wait(roundDuration)
    endRound()
end

local function endRound()
    currentState = GameState.Ended
    print("Round " .. currentRound .. " ended")
    
    -- Calculate the winner of the round
    -- This is a placeholder and should be implemented based on the actual game logic
    
    -- Start the lobby wait time
    wait(lobbyWaitTime)
    
    if currentRound < maxRounds then
        currentState = GameState.Lobby
        startRound()
    else
        print("Game ended")
    end
end

-- Start the first round after the lobby wait time
wait(lobbyWaitTime)
startRound()

return {
    GameState = GameState,
    currentState = currentState,
    currentRound = currentRound,
    maxRounds = maxRounds,
    roundDuration = roundDuration,
    lobbyWaitTime = lobbyWaitTime,
    startRound = startRound,
    endRound = endRound
}