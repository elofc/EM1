-- PlayerStealth.lua
-- Handles player stealth mechanics

local PlayerStealth = {}

-- Amount of noise generated when walking normally
PlayerStealth.walkNoise = 5
-- Amount of noise generated when crouching
PlayerStealth.crouchNoise = 1
-- Current noise level
PlayerStealth.currentNoise = 0

function PlayerStealth:setCrouching(crouch)
    if crouch then
        self.currentNoise = self.crouchNoise
    else
        self.currentNoise = self.walkNoise
    end
end

function PlayerStealth:getNoiseLevel()
    return self.currentNoise
end

return PlayerStealth
