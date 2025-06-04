-- SoundManager.lua
-- Demonstrates simple sound occlusion using raycasting

local SoundManager = {}

-- Check if there's an obstacle between two points
local function isOccluded(origin, target)
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Static
    local result = workspace:Raycast(origin, target - origin, raycastParams)
    return result ~= nil
end

function SoundManager:playSound(sound, origin, listener)
    if isOccluded(origin, listener.Character.Head.Position) then
        -- If occluded, lower volume
        sound.Volume = 0.3
    else
        sound.Volume = 1
    end
    sound:Play()
end

return SoundManager
