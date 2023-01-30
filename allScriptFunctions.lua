--- @meta

--- Write text to the debug console (toggleable with F9). It will appear
--- automatically the first time you write text to it. You can use this to check
--- values in your code, or make sure some pieces of code are actually running.
---
--- @param string string
function DEBUG(string) end

--- Forcefully allows and disallows the showing of the debugger. If you enter `false`,
--- the debugger will be immediately hidden if it is open, and will no longer show
--- itself for any reason. If you then enter `true`, the debugger will not appear again
--- immediately, but can be re-opened if the user presses F9.
---
--- @param bool boolean
function EnableDebugger(bool) end

--- An alternative to setting variables in the Encounter script to be accessed from
--- anywhere.
---
--- Sets a global variable. After setting, you can retrieve it from all your scripts at
--- any time with `GetGlobal(variable_name)`.
---
--- @param your_variable_name string
--- @param value any
function SetGlobal(your_variable_name, value) end

--- An alternative to setting variables in the Encounter script to be accessed from
--- anywhere.
---
--- Gets a Global Variable that you previously set using `SetGlobal()`.
---
--- @param your_variable_name string
--- @return any value
function GetGlobal(your_variable_name) end

--- Sets a Global variable that is accessible even in the overworld. After setting it, you
--- can retrieve it from all of your scripts at any time with `GetRealGlobal()`.
---
--- Persists through battles, but not between sessions. These variables can be saved using
--- the overworld save system.
---
--- Note: "Complex" variables (such as tables, functions and userdata) can not be saved as
--- Real or AlMighty globals.
---
--- Also note: as Real and AlMighty Globals persist across mods, it is possible for mods
--- to read each others' globals. Be careful when choosing global names.
---
--- Can be used in the overworld.
---
--- @param your_variable_name string
--- @param value string|number|boolean
function SetRealGlobal(your_variable_name, value) end

--- Gets a Global that you previously set using `SetRealGlobal()`.
---
--- Can be used in the overworld.
---
--- @param your_variable_name string
--- @return string|number|boolean value
function GetRealGlobal(your_variable_name) end

--- AlMighty Globals are globals that are instantly saved into a file when set: these
--- globals persist through sessions.
---
--- However, you can use the Remove AlMighty Globals button in modDev to remove them.
---
--- Note: "Complex" variables (such as tables, functions and userdata) can not be saved as
--- Real or AlMighty globals.
---
--- Also note: as Real and AlMighty Globals persist across mods, it is possible for mods to
--- read each others' globals. Be careful when choosing global names.
---
--- Can be used in the overworld.
---
--- @param your_variable_name string
--- @param value string|number|boolean
function SetAlMightyGlobal(your_variable_name, value) end

--- Gets an AlMighty Global that you previously set using `SetAlMightyGlobal()`.
---
--- Can be used in the overworld.
---
--- @param your_variable_name string
--- @return string|number|boolean value
function GetAlMightyGlobal(your_variable_name) end

--- Set to `true` if you want frame-based player movement (2px/frame) instead of time
--- based player movement (120px/s). Set it to `false` if you already are in frame-based
--- movement and you want to go back to the time based movement.
---
--- By default, time-based movement is used (same as if `SetFrameBasedMovement(false)` were called).
--- Note that this function only controls the player's movement with the default control
--- scheme (see `Player.SetControlOverride`).
--- @param bool boolean
function SetFrameBasedMovement(bool) end

--- Used alongside State("ENEMYSELECT") (or `EnteringState()` when entering the same state) to
--- force the player to choose FIGHT or ACT. This controls whether you'll see the enemy's
--- health bar in the menu and whether the next state upon pressing Z is ATTACKING or ACTMENU.
---
--- If used in the state ACTIONSELECT, this function will move the player over the specified button.
---
--- @param action "FIGHT"|"ACT"|"ITEM"|"MERCY"
function SetAction(action) end

--- If the given value is true, all damage that the player will take will be reduced - like in
--- Undertale - by 1 point for each 5 defense, with the player's defense at LV1 not
--- affecting the damage.
---
--- Damage taken can not be fully blocked and will always be at least 1.
---
--- `False` by default.
---
--- @param bool boolean
function AllowPlayerDef(bool) end

--- Setting this to true will force all bullets that don't have a specified collision type
--- to use the Pixel-Perfect collision system.
---
--- `False` by default.
---
--- @param bool boolean
function SetPPCollision(bool) end

--- This makes the list of strings you give to the function appear in the UI dialog box.
--- After skipping through them, you will automatically go to the monster dialogue step
--- by default.
---
--- As of CYF v0.6.4, if you end up with 4 or more lines of battle dialog displayed at once,
--- the text will move up (9 pixels, one time) to compensate and try to fit your text inside the box.
---
--- *You can use `\n` to create a new line with a star (\*), and `\r` to create a new line without a star.*
---
--- @param list_of_strings string[]
function BattleDialogue(list_of_strings) end

--- This makes the list of strings you give to the function appear in the UI dialog box.
--- After skipping through them, you will automatically go to the monster dialogue step
--- by default.
---
--- As of CYF v0.6.4, if you end up with 4 or more lines of battle dialog displayed at once,
--- the text will move up (9 pixels, one time) to compensate and try to fit your text inside the box.
---
--- *You can use `\n` to create a new line with a star (\*), and `\r` to create a new line without a star.*
---
--- @param list_of_strings string[]
function BattleDialog(list_of_strings) end

--- A powerful function that immediately skips the battle to the specified state, rather than
--- following the default conventions. Below is a list of valid strings you can pass to it,
--- what state you'll be going to and what that state entails. The states you pass to it are
--- case-invariant, but uppercase is recommended for readability.
---
--- @param state_to_go_to State
function State(state_to_go_to) end

--- Returns the name of the current state.
---
--- @return State state
function GetCurrentState() end

--- @alias State
--- | "ACTIONSELECT" # While in this state, you can select FIGHT/ACT/ITEM/MERCY.
--- | "ENEMYDIALOGUE" # When starting this state, `currentdialogue` gets read from the Encounter script for every monster and their dialogue is displayed. If that doesn't exist, it'll return something at random from the randomdialogue list.
--- | "DEFENDING" # When starting this state, nextwaves is read out from the Encounter script and all scripts in the Waves folder with matching names will be part of this defense step. wavetimer is also read from the Encounter script at this time.
--- | "ATTACKING" # Starting this state will put you in the screen where you either deal damage to an enemy by pressing "Z" at the right time, or you wait and miss entirely. The enemy this affects is the same as the last enemy selected in the states ENEMYSELECT or ACTMENU. After this state ends, the encounter moves on to the ENEMYDIALOGUE state by default.
--- | "ENEMYSELECT" # This state displays a list of all active enemies in the encounter. This state gets entered automatically after choosing FIGHT or ACT. If the Player got here from choosing FIGHT, the state loaded from pressing "Z" is ATTACKING, if they got here from choosing ACT, that state will be ACTMENU, but if they got here from calling State and press "Z", nothing will happen.
--- | "ACTMENU" # This state displays all of the options from the enemy's commands in order. If the enemy has cancheck set to true, then a "Check" option will be displayed here - which will follow the syntax seen in the description for commands as seen in Basic Setup. Having more than 6 ACT commands may cause glitchiness, though, so watch out! (Additional note: the enemy chosen will always be the same as the last enemy chosen in ENEMYSELECT.)
--- | "ITEMMENU" # This state shows all of the player's available items.
--- | "MERCYMENU" # This state lets you choose from either "Spare" or "Flee". If at least one active enemy has canspare set to true, then "Spare" will be yellow - and selecting it will spare that enemy.
--- | "DIALOGRESULT" # This is the state that is entered whenever BattleDialog is called, when the victory message displays, when the player fails to flee, or when an item is used. When all text is done and the player presses "Z", the state ENEMYDIALOGUE is entered next. The soul is forcibly invisible during this state.
--- | "DONE" # Changing state to DONE will instantly end the current battle. Normally, this will force the player to the mod selection screen.
--- | "NONE" # This state does nothing. It is entered for the first frame of the encounter, but entering it manually will completely freeze your encounter. It might be useful if you want to disable all of Unitale/CYF's basic functionality.
--- | "RESETTING" # DEPRECATED, DO NOT USE. Only listed for completion purposes. It only exists in Unitale 0.2.1a, so trying to use it in CYF won't work. It was removed in the Github release of Unitale 0.2.1a, and seemed to be only for testing.
--- | "PAUSE" # As of CYF v0.6.2.1, calling `State("PAUSE")` will perfectly "pause" an encounter. The last active state will remain active, but in a frozen state, until you call State again. Only the Update function of the Encounter script will remain active here. To unfreeze a state, you must use State to switch to another state, preferably the last active state. GetCurrentState() will tell you the name of the frozen state.