-- NPCDetection.lua
-- Handles NPC awareness based on perceived sounds

local NPCDetection = {}
NPCDetection.__index = NPCDetection

NPCDetection.states = {
    Idle = 0,
    Suspicious = 1,
    Searching = 2,
    Alert = 3
}

function NPCDetection.new()
    local self = setmetatable({}, NPCDetection)
    self.state = NPCDetection.states.Idle
    self.timer = 0
    return self
end

-- Update NPC state based on noise level
function NPCDetection:processSound(volume)
    if volume >= 3 then
        self.state = NPCDetection.states.Alert
    elseif volume >= 1.5 then
        self.state = NPCDetection.states.Searching
    elseif volume > 0 then
        self.state = NPCDetection.states.Suspicious
    else
        self.state = NPCDetection.states.Idle
    end
    self.timer = 0
end

-- Call every frame to decay state over time
function NPCDetection:update(dt)
    self.timer += dt
    if self.state ~= NPCDetection.states.Idle and self.timer > 5 then
        self.state = NPCDetection.states.Idle
    end
end

return NPCDetection
