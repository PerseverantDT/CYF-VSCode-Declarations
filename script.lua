--- @meta

--- @class Script
--- @field scriptname string (Readonly) The filename of the script
local script = {}

--- Sets a variable in a script object that you can retrieve with `GetVar()`.
---
--- @param yourVariableName string
--- @param value any
local function SetVar(yourVariableName, value) end
script.SetVar = SetVar

--- Gets a variable in a script object that you previously set with `SetVar()`.
---
--- @param yourVariableName string
--- @return any value
local function GetVar(yourVariableName) end
script.GetVar = GetVar

--- Runs `function_name` from within the target script
---
--- @param function_name string
local function Call(function_name) end
--- Runs `function_name` from within the target script, passing one argument
---
--- @param function_name string
--- @param argument any
local function Call(function_name, argument) end
--- Runs `function_name` from within the target script, passing all elements in `arguments`
--- as arguments.
---
--- @param function_name string
--- @param arguments any[]
---
--- @overload fun(function_name: string, argument: any)
--- @overload fun(function_name: string)
local function Call(function_name, arguments) end
script.Call = Call