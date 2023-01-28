--- @meta

--- @class Bullet
--- @field sprite Sprite The bullet's sprite component.
--- @field x number The X position of this bullet, relative to the arena's center.
--- @field y number The Y position of this bullet, relative to the arena's center.
--- @field absx number The X position of this bullet, relative to the bottom-left corner of the screen.
--- @field absy number The Y position of this bullet, relative to the bottom-left corner of the screen.
--- @field ppcollision boolean If this is true, the bullet will use the Pixel-Perfect Collision system. By default, this is the encounter's default collision system. Manually setting this will set `ppchanged` to true.
--- @field ppchanged boolean (Readonly) Tells you if the bullet's collision system has been changed by manually changing `ppcollision`. Will be false after you call `ResetCollisionSystem()`, or if you haven't changed `ppcollision`.
--- @field layer string The bullet layer that the bullet is on.
--- @field isactive boolean (Readonly) Used to check if the bullet is still active. If the bullet has been removed, this will be false; otherwise true.
--- @field isPersistent boolean Set this to `true` and, if you're not in retrocompatibility mode, this will make the bullet stay loaded even after the wave ends.
local bullet = {}

--- Resets the collision system of the bullet to the encounter's default collision system.
bullet.ResetCollisionSystem = function() end

--- Move this bullet `x` pixels to the right and `y` pixels up.
---
--- @param x number
--- @param y number
bullet.Move = function(x, y) end

--- Move this bullet to this position immediately, relative to the arena's center.
---
--- @param x number
--- @param y number
bullet.MoveTo = function(x, y) end

--- Move this bullet to this position immediately, relative to the bottom-left corner of the screen.
---
--- @param x number
--- @param y number
bullet.MoveToAbs = function(x, y) end

--- Destroys this bullet. You can continue retrieving its `Bullet.x`, `Bullet.y`, `Bullet.absx`
--- and `Bullet.absy` properties. Trying to move a removed bullet will give you a Lua error.
--- If you're not sure if your bullet still exists, check `Bullet.isactive` first.
bullet.Remove = function() end

--- Sets a variable on this bullet that you can retrieve with `Bullet.GetVar()`.
---
--- @param your_variable_name string
--- @param value any
bullet.SetVar = function(your_variable_name, value) end

--- Gets a variable that you previously set using `SetVar`.
---
--- @param your_variable_name string
--- @return any value
bullet.GetVar = function(your_variable_name) end

--- Moves this bullet on top of all currently existing projectiles.
---
--- Note that newly spawned projectiles are always on top by default;
--- this function is mostly to move existing bullets to the top
bullet.SendToTop = function() end

--- Moves this bullet below all currently existing projectiles.
bullet.SendToBottom = function() end

--- Returns `true` if the player is colliding with the bullet. Will use PPCollision (pixel-perfect collisions) if the bullet has PP enabled.
---
--- @return boolean isColliding
bullet.isColliding = function() end
