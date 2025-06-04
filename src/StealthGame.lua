-- StealthGame.lua
-- Example glue code that ties together the stealth modules

local PlayerStealth = require(script.Parent.PlayerStealth)
local EnemyAI = require(script.Parent.EnemyAI)
local SoundManager = require(script.Parent.SoundManager)
local SoundEvent = require(script.Parent.SoundEvent)
local SoundPropagation = require(script.Parent.SoundPropagation)
local NPCDetection = require(script.Parent.NPCDetection)

local StealthGame = {}

-- Initialize systems
StealthGame.player = PlayerStealth
StealthGame.enemyDetection = NPCDetection.new()

-- Call every frame to update NPC state
function StealthGame:update(dt)
    self.enemyDetection:update(dt)
end

-- Called when the player makes a noise
function StealthGame:onPlayerNoise(position, volume, enemy)
    local event = SoundEvent.new(position, volume)
    local perceived = SoundPropagation:propagate(event, enemy)
    self.enemyDetection:processSound(perceived)
    EnemyAI:listen(perceived)
end

return StealthGame
