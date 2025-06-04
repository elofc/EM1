# Stealth System Overview

This document describes the modules included in this project and how they work together to create a simple stealth prototype.

## Modules

- **PlayerStealth** – Generates noise values when the player moves or crouches.
- **SoundEvent** – Represents a single sound emitted in the world.
- **SoundPropagation** – Uses Roblox raycasts to check if the sound is occluded before it reaches an NPC.
- **NPCDetection** – Maintains NPC awareness states: Idle, Suspicious, Searching, and Alert.
- **StealthGame** – Example controller that feeds player noise into the system.

## Usage

1. Attach `PlayerStealth` to the player character and update its noise values based on movement.
2. When a noise occurs, create a `SoundEvent` and pass it to `SoundPropagation`.
3. The resulting volume is fed into `NPCDetection` to update NPC state.
4. NPCs can respond to state changes (for example, entering the Searching or Alert states).

This setup provides a lightweight starting point for more advanced stealth mechanics.
