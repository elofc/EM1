# Sound Geometry

This documentation explains how the `SoundManager` script approximates sound occlusion using Roblox's `Raycast` API. The concept is similar to the ray tracing geometry described in the [Wwise ray tracing guide](https://www.audiokinetic.com/en/library/edge/?source=SDK&id=raytracing_geometry_guide.html).

When `SoundManager:playSound` is called, the script casts a ray from the sound's origin to the player's head. If the ray hits an obstacle, the sound volume is reduced to simulate occlusion. You can expand this logic to use Wwise's advanced features if you integrate the Wwise SDK.

