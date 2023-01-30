--- @meta

--- @class Script
--- @field scriptname string (Readonly) The filename of the script
local script = {}

--- Sets a variable in a script object that you can retrieve with `GetVar()`.
---
--- @param yourVariableName string
--- @param value any
script.SetVar = function(yourVariableName, value) end

--- Gets a variable in a script object that you previously set with `SetVar()`.
---
--- @param yourVariableName string
--- @return any BeforeDamageValues
script.GetVar = function(yourVariableName) end

--- Runs `function_name` from within the target script. If a second argument is
--- passed, it will be used as the argument for the function. For functions with
--- multiple parameters, pass a table as the second argument.
---
--- @param function_name string
--- @param arguments any[]
---
--- @overload fun(function_name: string, argument: any)
--- @overload fun(function_name: string)
script.Call = function(function_name, arguments) end

--- This is only accessible outside of the encounter file
--- @class EncounterScript: Script
--- @field enemies Script[] Filled after the encounter starts
--- @field Waves Script[] Filled when entering the `DEFENDING` state
Encounter = {}