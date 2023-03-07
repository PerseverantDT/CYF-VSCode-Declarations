--- @meta

--- @class Player
--- @field public x number (Readonly) Gets the X position of the player's center relative to the arena's center.
--- @field public y number (Readonly) Gets the Y position of the player's center relative to the arena's center.
--- @field public absx number (Readonly) Gets the X position of the player's center relative to the bottom-left corner of the screen.
--- @field public absy number (Readonly) Gets the Y position of the player's center relative to the bottom-left corner of the screen.
--- @field public sprite Sprite The player's soul sprite component
--- @field public hp number Get or set the player's current HP. Can't exceed max HP. If set to 0, game over triggers.
--- @field public maxhp number Returns the player's Max HP value. As of CYF v0.6.4, this is settable. Setting this is the same as calling `Player.SetMaxHPShift(<value>, 0, true, false, false)`. Max HP is not a float, but regular HP is.
--- @field public maxhpshift number (Readonly) Returns the difference between the player's current Max HP and their normal, unmodified Max HP.
--- @field public atk number Base attack of the player. Depends on the player's level. Changing `Player.lv` or ending the battle will reset this to its intended value.
--- @field public weapon string (Readonly) Name of the player's current weapon
--- @field public weaponatk number (Readonly) Attack value of the player's current weapon
--- @field public def number Base defense of the player. Depends on the player's level. Changing `Player.lv` or ending the battle will reset this to its intended value.
--- @field public armor string (Readonly) Name of the player's current armor
--- @field public armordef number (Readonly) Defense value of the player's current armor
--- @field public name string Get or set the player's current name. 6 (Unitale) / 9 (CYF) letters max
--- @field public lv integer Use this to get or set the player's current LV. It can be from 1 to 20 (Unitale) / 99 (CYF).
--- @field public lastenemychosen integer (Readonly) Gets the id of the last chosen enemy in the ACT/FIGHT menus. -1 at the beginning of a fight. This is NOT the same as the enemy's position in the `enemies` table. This is the position of the enemies in the menu in-game.
--- @field public lasthitmultiplier number (Readonly) Gets the accuracy value from the last time the player was in ATTACKING. Normally, it will be between 0 and 2. It will be -1 if the player missed the attack (and at the beginning of the battle) and 2.2 if the attack was perfectly precise.
--- @field public ishurting boolean (Readonly) `true` if the player's currently blinking due to being hurt, `false` otherwise.
--- @field public ismoving boolean (Readonly) `true` if the player is currently moving in battle, `false` otherwise. Will always be `false` while not in a wave script. This only will change with the default control scheme (see `Player.SetControlOverride()`).
Player = {}

--- Deals damage to the player, and makes them invincible for `invul_time`
--- seconds. Cannot hurt the player again if they are already hurting (flashing).
---
--- @param damage number
--- @param invul_time number (Optional, defaults to `1.7`) The amount of invulnerability time the player gets when damaged
--- @param ignoreDef boolean (Optional, defaults to `false`) If `true` and the encounter variable `allowPlayerDef` is true, damage dealt here will ignore the player's defense
--- @param playSound boolean (Optional, defaults to `true`) Whether a sound will be played upon taking damage
---
--- @overload fun(damage: number)
--- @overload fun(damage: number, invul_time: number)
--- @overload fun(damage: number, invul_time: number, ignoreDef: boolean)
Player.Hurt = function(damage, invul_time, ignoreDef, playSound) end

--- Heals the player for this amount. This is exactly the same as `Player.Hurt(-value, 0)`.
--- It also plays the healing sound.
---
--- @param amount number
Player.Heal = function(amount) end

--- Either `true` or `false`. Only useable in waves. If `true`, this will prevent the
--- player soul from doing its regular movement/keyboard control for the rest of
--- the wave (in other words, it disables the red soul functionality).
---
--- Use this if you want to implement your own controls in a wave (i.e. a custom soul
--- mode, like the blue or purple soul).
---
--- @param boolean boolean
Player.SetControlOverride = function(boolean) end

--- Moves the player soul based on its last position. If ignoreWalls is `false`, it will
--- make sure the player doesn't go outside of the arena; otherwise, it ignores the
--- arena's boundaries. If you want to move the player out of bounds in a wave,
--- you'll have to call `Player.SetControlOverride(true)`, as the player's default
--- movement keeps the soul inside the arena otherwise.
---
--- @param x number
--- @param y number
--- @param ignoreWalls boolean (Optional, defaults to `false`)
---
--- @overload fun(x: number, y: number)
Player.Move = function(x, y, ignoreWalls) end

--- Moves the player soul to this position relative to the arena's center. If ignoreWalls is `false`, it will
--- make sure the player doesn't go outside of the arena; otherwise, it ignores the
--- arena's boundaries. If you want to move the player out of bounds in a wave,
--- you'll have to call `Player.SetControlOverride(true)`, as the player's default
--- movement keeps the soul inside the arena otherwise.
---
--- @param x number
--- @param y number
--- @param ignoreWalls boolean (Optional, defaults to `false`)
---
--- @overload fun(x: number, y: number)
Player.MoveTo = function(x, y, ignoreWalls) end

--- Moves the player soul to this position relative to the bottom left of the screen. If ignoreWalls is `false`, it will
--- make sure the player doesn't go outside of the arena; otherwise, it ignores the
--- arena's boundaries. If you want to move the player out of bounds in a wave,
--- you'll have to call `Player.SetControlOverride(true)`, as the player's default
--- movement keeps the soul inside the arena otherwise.
---
--- @param x number
--- @param y number
--- @param ignoreWalls boolean (Optional, defaults to `false`)
---
--- @overload fun(x: number, y: number)
Player.MoveToAbs = function(x, y, ignoreWalls) end

--- Lets you set the player's HP to a number above the player's Max HP. The REAL
--- maximum is 1.5 times the player's Max HP.
---
--- @param amount number
Player.ForceHp = function(amount) end

--- Lets you set the Player's MaxHP, relative to their normal MaxHP. If the total
--- MaxHP is negative or nil, it causes a GameOver.
---
--- Formula: Player's MaxHP = Base MaxHP + MaxHP Shift
---
--- @param shift number The value that will be added to the Max HP. If `set` is `true`, this will be the player's new Max HP.
--- @param invulnerabilitySeconds number (Optional, defaults to `1.7`) The time for which the player will be invulnerable after this operation.
--- @param set boolean (Optional, defaults to `false`) `true` if you want to set the Player's MaxHP directly.
--- @param canHeal boolean (Optional, defaults to `false`) `true` if the player will automatically gain any health added by this function as normal (yellow) health. Does not apply for losing health.
--- @param playSound boolean (Optional, defaults to `true`) `true` if you want to play the heal/hurt sound when the operation is done.
---
--- @overload fun(shift: number)
--- @overload fun(shift: number, invulnerabilitySeconds: number)
--- @overload fun(shift: number, invulnerabilitySeconds: number, set: boolean)
--- @overload fun(shift: number, invulnerabilitySeconds: number, set: boolean, canHeal: boolean)
Player.SetMaxHPShift = function(shift, invulnerabilitySeconds, set, canHeal, playSound) end

--- Resets the player's Max HP, ATK and/or DEF to their original values based on the player's LV.
---
--- @param resetMHP boolean (Optional, defaults to `true`) If `true`, the player's Max HP will be set back to what it should be based on the player's LV.
--- @param resetATK boolean (Optional, defaults to `true`) If `true`, the player's ATK will be set back to what it should be based on the player's LV.
--- @param resetDEF boolean (Optional, defaults to `false`) If `true`, the player's DEF will be set back to what it should be based on the player's LV.
---
--- @overload fun()
--- @overload fun(resetMHP: boolean)
--- @overload fun(resetMHP: boolean, resetATK: boolean)
Player.ResetStats = function(resetMHP, resetATK, resetDEF) end

--- Sets the animation used when attacking an enemy. Use it like sprite.SetAnimation().
---
--- @param anim string[]
--- @param frequency number
--- @param prefix string
Player.SetAttackAnim = function(anim, frequency, prefix) end

--- Resets the animation of the player's attack to the default slashing animation.
Player.ResetAttackAnim = function() end

--- Changes the target of the Player's attack while in `ATTACKING`. Does nothing
--- outside of the state `ATTACKING`. It should be used in `BeforeDamageCalculation()`
--- or `BeforeDamageValues()`.
---
--- @param targetNumber integer
Player.ChangeTarget = function(targetNumber) end

--- Forces an attack towards the enemy number `enemyID`. If you want to, you
--- can choose the attack's damage, too - but otherwise, damage will be calculated normally.
---
--- If you want enemies to be able to die this way, you MUST check with `Player.CheckDeath()`!
---
--- @param enemyID integer
--- @param damage number (Optional) Can be omitted to use regular damage calculations
---
--- @overload fun(enemyID: integer)
Player.ForceAttack = function(enemyID, damage) end

--- The next attack the player executes will attack the enemies contained in `targetIDs`
--- and deal `damage` damage. If you want to, you can choose the attack's damage, too - but
--- otherwise, damage will be calculated normally. If you put nothing as a parameter, this
--- will attack all enemies with the normal damage calculations.
---
--- Each target needs to have one damage value if you use a table of numbers for the
--- damage value, or all targets can share the same damage value if the damage value is a
--- simple number.
---
--- @param targetIDs integer[] (Optional) Can be omitted to target all enemies
--- @param damage number|number[] (Optional) Can be omitted to use regular damage calculation
---
--- @overload fun()
--- @overload fun(targetIDs: integer[])
--- @overload fun(damage: number)
Player.MultiTarget = function(targetIDs, damage) end

--- Forces an attack towards the enemies contained in `targetIDs` and deals `damage` damage.
--- If you want to, you can choose the attack's damage, too - but otherwise, damage will
--- be calculated normally. If you put nothing as a parameter, this will attack all
--- enemies with the normal damage calculations.
---
--- Each target needs to have one damage value if you use a table of numbers for the damage
--- value, or all targets can share the same damage value if the damage value is a simple number.
---
--- If you want enemies to be able to die this way, you MUST check with `Player.CheckDeath()`!
---
--- @param targetIDs integer[] (Optional) Can be omitted to target all
--- @param damage number|number[] (Optional) Can be omitted to use regular damage calculation
---
--- @overload fun()
--- @overload fun(targetIDs: integer[])
--- @overload fun(damage: number)
Player.ForceMultiAttack = function(targetIDs, damage) end

--- Checks if the enemies are dead after a forced attack.
Player.CheckDeath = function() end
