--- @meta

--- Creates a layer named `name` that projectiles can be placed in. To create
--- your new projectile layer, you'll need to choose a pre-existing layer.
---
--- @param name string
--- @param position string `""` by default
--- @param below boolean `false` by default
---
--- @overload fun(name: string)
--- @overload fun(name: string, position: string)
function CreateProjectileLayer(name, position, below) end

--- Creates a bullet that you can store and modify, with its spawn position relative
--- to the center of the arena. The hitbox of the bullet is a rectangle around the
--- sprite, unless you use CYF's PP mode.
---
--- @param spriteName string
--- @param initial_x number
--- @param initial_y number
--- @param layer string `""` by default
--- @return Bullet projectile
---
--- @overload fun(spriteName: string, initial_x: number, initial_y: number): Bullet
---
--- @nodiscard Since this returns an instance of a Bullet, discarding the result is most likely a mistake.
function CreateProjectile(spriteName, initial_x, initial_y, layer) end

--- Same as `CreateProjectile()`, but the bullet's spawn position is relative to
--- the bottom left of the screen instead of the arena's center. The hitbox of
--- the bullet is a rectangle around the sprite, unless you use CYF's PP mode.
---
--- @param spriteName string
--- @param initial_x number
--- @param initial_y number
--- @param layer string `""` by default
--- @return Bullet projectile
---
--- @overload fun(spriteName: string, initial_x: number, initial_y: number): Bullet
---
--- @nodiscard Since this returns an instance of a Bullet, discarding the result is most likely a mistake.
function CreateProjectileAbs(spriteName, initial_x, initial_y, layer) end