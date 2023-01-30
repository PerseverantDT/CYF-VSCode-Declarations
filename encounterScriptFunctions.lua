--- @meta

--- Select a random monster from the encounter, then get a random entry from
--- the comments table there. You'll want to use this to replicate default
--- encounter behaviour.
---
--- @return string encounter_text
function RandomEncounterText() end

--- Changes the layer of the FIGHT, ACT, ITEM and MERCY buttons and the Player's name, lv and hp.
--- The usable layers are created sprite layers and these base layers:
---
--- Enter `"default"` to reset the Buttons and UI.
---
--- @param layer SpriteLayer
function SetButtonLayer(layer) end

--- This function creates an enemy script using the script `scriptName` in the `Lua/Monsters` folder
--- of your mod, which will act as a new enemy in battle, and returns a reference to it.
---
--- It will move the enemy so that it is centered just above the arena, with 1 pixel of space
--- inbetween, and will move the enemy's sprite by `x` pixels horizontally and `y` pixels vertically.
---
--- Be aware that creating an enemy this way will NOT add it to the Encounter script's `enemies`
--- table, so you have to manage the table yourself by adding this new enemy script to it.
---
--- @param scriptName string
--- @param x number
--- @param y number
--- @return Script enemyScript
---
--- @nodiscard Since this function creates an instance of Script, discarding the return value is most likely a mistake
function CreateEnemy(scriptName, x, y) end

--- @alias SpriteLayer
--- | "Bottom" # Under everything, even the background
--- | "BelowUI" # Above the background
--- | "BelowArena" # Above the background and the UI
--- | "BelowPlayer" # Above the background, the UI, and the Arena
--- | "BelowBullet" # Above the background, the UI, the Arena, and the Player
--- | "Top" # Above everything
--- | string # Names of sprite layers created by the modder
