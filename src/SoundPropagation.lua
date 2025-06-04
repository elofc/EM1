-- SoundPropagation.lua
-- Basic sound propagation using raycasts for occlusion

local SoundPropagation = {}

-- Raycast function to determine occlusion
local function isOccluded(origin, target)
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Static
    local result = workspace:Raycast(origin, target - origin, raycastParams)
    return result ~= nil
end

-- Propagate sound to a listener and return perceived volume
function SoundPropagation:propagate(soundEvent, listener)
    if isOccluded(soundEvent.position, listener.Character.Head.Position) then
        return soundEvent.volume * 0.3
    else
        return soundEvent.volume
    end
end

return SoundPropagation
