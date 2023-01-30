--- @meta

--- Creates a layer named name that sprites can be placed in. To create your
--- new sprite layer, you'll need to choose a pre-existing layer.
---
--- @param name string
--- @param position SpriteLayer `"BelowArena"` by default
--- @param below boolean If `true`, the new layer will be created below the layer given in `position`. Otherwise, it will be above it. `false` by default
--- @return boolean wasCreated `true` if the layer was created, `false` otherwise
---
--- @overload fun(name: string): boolean
--- @overload fun(name: string, position: string): boolean
function CreateLayer(name, position, below) end

--- Creates a sprite at the center of the screen (at 320, 240) that you can modify in many ways.
---
--- @param spriteName string
--- @param layer SpriteLayer `"BelowArena"` (or "Default" in the overworld) by default
--- @param childNumber number `-1` by default
--- @return Sprite sprite
---
--- @overload fun(spriteName: string): Sprite
--- @overload fun(spriteName: string, layer: string): Sprite
--- @overload fun(spriteName: string, childNumber: number): Sprite
---
--- @nodiscard As this creates an instance of a sprite, ignoring its result is most likely a mistake.
function CreateSprite(spriteName, layer, childNumber) end