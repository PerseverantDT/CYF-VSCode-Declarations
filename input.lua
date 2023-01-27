--- @meta

--- @class Input
--- @field MousePosX number (Readonly) Returns the X position of the mouse relative to the bottom left corner of the screen. (from `0` to `639`)
--- @field MousePosY number (Readonly) Returns the Y position of the mouse relative to the bottom left corner of the screen. (from `0` to `479`)
--- @field IsMouseInWindow boolean (Readonly) Returns `true` if the mouse is in the window, `false` otherwise.
--- @field MouseScroll number (Readonly) Returns a number representing the change in the user's scroll wheel position (or movement supplied by the trackpad when using a Mac). `0` represents no movement, while a positive number means the user is scrolling up, and a negative number means the user is scrolling down.
Input = {}

--- Get the state of the given key.
---
--- @param keyName string
--- @return integer state `0` when not pressed, `1` on the first frame the key is pressed, `2` while it's being held, and `-1` on the first frame it's released.
Input.GetKey = function(keyName) end