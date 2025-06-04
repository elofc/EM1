-- EnemyAI.lua
-- Basic enemy AI that listens for player noise

local EnemyAI = {}
EnemyAI.detectionThreshold = 3
EnemyAI.isAlert = false

function EnemyAI:listen(noise)
    if noise >= self.detectionThreshold then
        self.isAlert = true
    else
        self.isAlert = false
    end
end

return EnemyAI
