-- SoundManager.server.lua

local SoundService = game:GetService("SoundService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SoundManager = {}

-- Sound IDs (replace with actual sound IDs)
local SOUND_IDS = {
    backgroundMusic = "rbxassetid://123456789",
    playerFrozen = "rbxassetid://987654321",
    boxColored = "rbxassetid://135792468",
    roundStart = "rbxassetid://246813579",
    roundEnd = "rbxassetid://112233445"
}

function SoundManager:playBackgroundMusic()
    local music = Instance.new("Sound")
    music.SoundId = SOUND_IDS.backgroundMusic
    music.Looped = true
    music.Volume = 0.5
    music.Parent = SoundService
    music:Play()
end

function SoundManager:playSound(soundName)
    local sound = Instance.new("Sound")
    sound.SoundId = SOUND_IDS[soundName]
    sound.Volume = 0.7
    sound.Parent = SoundService
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

return SoundManager