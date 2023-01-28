--- @meta

--- @class Arena
--- @field width number (Readonly) The width of the arena in pixels, after resizing.
--- @field height number (Readonly) The height of the arena in pixels, after resizing.
--- @field x number (Readonly) The x position of the center of the Arena, after moving.
--- @field y number (Readonly) The y position of the bottom of the outside (white part) of the Arena, after moving.
--- @field currentwidth number (Readonly) The current width of the arena in pixels. Differs from `width` in that it will accurately reflect the arena size in the middle of resizing, too.
--- @field currentheight number (Readonly) The current height of the arena in pixels. Differs from `height` in that it will accurately reflect the arena size in the middle of resizing, too.
--- @field currentx number (Readonly) The current x position of the center of the Arena. Differs from `x` in that it will accurately reflect the arena size in the middle of moving, too.
--- @field currenty number (Readonly) The current y position of the bottom of the inside (black part) of the Arena. Differs from `y` in that it will accurately reflect the arena size in the middle of moving, too.
--- @field isResizing boolean (Readonly) Tells you if the Arena is currently being resized.
--- @field isMoving boolean (Readonly) Tells you if the Arena is currently being moved.
--- @field isModifying boolean (Readonly) Returns `true` if the Arena is being moved or resized, `false` otherwise.
Arena = {}

--- Resizes the arena to the new size.
---
--- @param width number
--- @param height number
Arena.Resize = function(width, height) end

--- Resizes the arena immediately, without the animation.
---
--- @param width number
--- @param height number
Arena.ResizeImmediate = function(width, height) end

--- Moves the Arena based on its current position. Set `movePlayer` to `true` if you
--- want the Player to move with the Arena and set `immediate` to `true` if you want
--- to move the Arena immediately.
---
--- @param x number
--- @param y number
--- @param movePlayer boolean `true` by default
--- @param immediate boolean `false` by default
---
--- @overload fun(x: number, y: number)
--- @overload fun(x: number, y: number, movePlayer: boolean)
Arena.Move = function(x, y, movePlayer, immediate) end

--- Moves the Arena based on the bottom-left corner of the window. Set `movePlayer`
--- to `true` if you want the Player to move with the Arena and set `immediate`
--- to `true` if you want to move the Arena immediately.
---
--- @param x number
--- @param y number
--- @param movePlayer boolean `true` by default
--- @param immediate boolean `false` by default
---
--- @overload fun(x: number, y: number)
--- @overload fun(x: number, y: number, movePlayer: boolean)
Arena.MoveTo = function(x, y, movePlayer, immediate) end

--- Moves the Arena based on its current position and resizes it at the same
--- time. Set `movePlayer` to `true` if you want the Player to move with the Arena
--- and set `immediate` to `true` if you want to move the Arena immediately.
---
--- @param x number
--- @param y number
--- @param width number
--- @param height number
--- @param movePlayer boolean `true` by default
--- @param immediate boolean `false` by default
---
--- @overload fun(x: number, y: number, width: number, height: number)
--- @overload fun(x: number, y: number, width: number, height: number, movePlayer: boolean)
Arena.MoveAndResize = function(x, y, width, height, movePlayer, immediate) end

--- Moves the Arena based on the bottom-left corner of the window and resizes it at the same
--- time. Set `movePlayer` to `true` if you want the Player to move with the Arena
--- and set `immediate` to `true` if you want to move the Arena immediately.
---
--- @param x number
--- @param y number
--- @param width number
--- @param height number
--- @param movePlayer boolean `true` by default
--- @param immediate boolean `false` by default
---
--- @overload fun(x: number, y: number, width: number, height: number)
--- @overload fun(x: number, y: number, width: number, height: number, movePlayer: boolean)
Arena.MoveToAndResize = function(x, y, width, height, movePlayer, immediate) end

--- Makes the Arena invisible, but it will stay active.
Arena.Hide = function() end

--- Makes the Arena visible after using Arena.Hide. This is also called automatically whenever a wave ends!
Arena.Show = function() end
