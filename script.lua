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

local function Call(function_name, argument) end
--- Runs `function_name` from within the target script, passing all elements in `arguments`
--- as arguments.
---
--- @param function_name string
--- @param arguments any[]
---
--- @overload fun(function_name: string, argument: any)
--- @overload fun(function_name: string)
script.Call = function(function_name, arguments) end