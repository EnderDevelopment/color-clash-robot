-- BoxColoring.server.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameManager = require(script.Parent.GameManager)

local function onTouched(part)
    local player = Players:GetPlayerFromCharacter(part.Parent)
    if player then
        if GameManager.currentState == GameManager.GameState.Playing then
            if player:GetAttribute("IsFrozen") then
                -- Chosen player colors boxes red
                part.BrickColor = BrickColor.new("Bright red")
            else
                -- Other players color boxes blue
                part.BrickColor = BrickColor.new("Bright blue")
            end
            
            -- Update player score
            local score = player:GetAttribute("Score") or 0
            player:SetAttribute("Score", score + 1)
        end
    end
end

-- Connect the onTouched function to all boxes
local boxes = workspace:GetDescendants()
for _, part in ipairs(boxes) do
    if part:IsA("BasePart") and part.Name == "Box" then
        part.Touched:Connect(onTouched)
    end
end

return {
    onTouched = onTouched
}