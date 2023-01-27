--- @meta

--- Sets the monster's sprite from the Sprites folder to `filename.png`. Can be
--- used with `[func]` to change sprites mid-dialogue.
---
--- @param fileName string
function SetSprite(fileName) end

--- Either `true` or `false`. If `false`, this monster will stay on screen but will not
--- show up in menus, do its dialogue or run any of its events. You can use this
--- to introduce monsters to an encounter at a later point. The battle will
--- end when a monster is killed or spared and there are no active monsters left.
--- Having no active monsters at all will likely cause a bunch of errors right now.
---
--- @param active boolean
function SetActive(active) end

--- Set the amount of damage the monster will take the next time it is attacked. Can be negative.
--- Set amount to the amount of damage the monster will take, or 0 to make the attack miss.
---
--- This function can only be used within the Game Event `BeforeDamageCalculation`, or just before
--- using the function `Player.ChangeTarget()`.
--- You also don't want to use it with a monster who's been disabled with `SetActive(false)`.
---
--- @param amount number
function SetDamage(amount) end

--- Kills the monster immediately. If this was the last monster, the battle ends.
---
--- Does NOT call the Game Event `OnDeath`.
function Kill() end

--- Spares the monster immediately. Similar to `Kill()`, if this was the last monster, the battle ends.
---
--- Does NOT call the Game Event `OnDeath`.
function Spare() end

--- Moves the enemy's sprite relative to its current position.
---
--- @param x number
--- @param y number
function Move(x, y) end

--- Moves the enemy's sprite relative to the bottom left corner of the screen.
--- This is effectively the same as setting enemypositions again, except `x` is 320px left
--- and `y` is 231px down.
function MoveTo(x, y) end

--- @overload fun(bind: boolean)
--- Controls whether the enemy's sprite will follow the Arena's movements.
---
--- If bind is `true`, the enemy will be parented to the Arena and follow all of its
--- movements. Otherwise, it will be either behind or in front of the arena, depending
--- on the value of `isUnderArena`.
---
--- @param bind boolean
--- @param isUnderArena boolean `false` by default
function BindToArena(bind, isUnderArena) end

--- Makes the enemy's dialogue bubble appear `x` pixels horizontally and `y` pixels
--- vertically relative to its original position.
---
--- @param x number
--- @param y number
function SetBubbleOffset(x, y) end

--- Changes the offset of the enemy's damage UI (the enemy's health bar and the
--- red numbers). Note that the damage UI is on a layer above that of the arena.
---
--- @param x number
--- @param y number
function SetDamageUIOffset(x, y) end

--- Changes the offset of the attack animation (the red slice by default) for
--- when the player attacks this monster.
---
--- @param x number
--- @param y number
function SetSliceAnimOffset(x, y) end

--- This function immediately removes this enemy from the encounter, including
--- the script it's been called from.

--- Be aware that removing an enemy this way will NOT remove it from the
--- Encounter script's enemies table, so you have to manage the table yourself by
--- removing this enemy script from it before running this function, because any
--- reference to it will be invalid.
function Remove() end
