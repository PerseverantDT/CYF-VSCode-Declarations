--- A value - `true` by default - that indicates that if you're on CYF. `nil` if not on CYF.
--- @type true|nil
isCYF = nil

--- A value which is `true` whenever CYF's retrocompatibility mode is active and
--- `false` when it isn't.
--- @type boolean
isRetro = nil

--- `true` if CYF's safe mode is enabled, `false` otherwise.
--- @type boolean
safe = nil

--- `true` if the user is on Windows, `false` otherwise.
--- @type boolean
windows = nil

--- Returns a string based on the version of CYF you are using.
---
--- Versions before v0.6: Previous version's number (e.g.: `"0.5.4"` in CYF v0.5.5)  
--- Versions between v0.6 and v0.6.1.2: Always `"1.0"`  
--- Versions after v0.6.1.2: Current version's number (e.g.: `"0.6.2"` in CYF v0.6.2)
---
--- **TIP: Lua has a very useful built-in string comparing function.**
--- @type string
CYFversion = nil


