-- SoundEvent.lua
-- Represents a single sound event in the world

local SoundEvent = {}
SoundEvent.__index = SoundEvent

-- Create a new sound event
-- @param position Vector3 - where the sound originated
-- @param volume number - base loudness of the sound
function SoundEvent.new(position, volume)
    local self = setmetatable({}, SoundEvent)
    self.position = position
    self.volume = volume or 1
    self.age = 0
    return self
end

-- Update the sound event's age
function SoundEvent:update(dt)
    self.age += dt
end

return SoundEvent
