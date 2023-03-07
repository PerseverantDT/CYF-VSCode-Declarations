--- @meta

--- Creates a layer named name that sprites can be placed in. To create your
--- new sprite layer, you'll need to choose a pre-existing layer.
---
--- @param name string
--- @param position SpriteLayer (Optional, defaults to `"BelowArena"`) The name of the layer the new layer will anchor to
--- @param below boolean (Optional, defaults to `false`) Whether the new layer will be created below the layer in `position`
--- @return boolean wasCreated Whether the layer was created
---
--- @overload fun(name: string): wasCreated: boolean
--- @overload fun(name: string, position: string): wasCreated: boolean
function CreateLayer(name, position, below) end

--- Creates a sprite at the center of the screen (at 320, 240) that you can modify in many ways.
---
--- @param spriteName string
--- @param layer SpriteLayer (Optional, defaults to `"BelowArena"` or, if in the overworld, `"Default"`)
--- @param childNumber number (Optional, defaults to `-1`)
--- @return Sprite sprite
---
--- @overload fun(spriteName: string): sprite: Sprite
--- @overload fun(spriteName: string, layer: string): sprite: Sprite
--- @overload fun(spriteName: string, childNumber: number): sprite: Sprite
---
--- @nodiscard As this creates an instance of a sprite, ignoring its result is most likely a mistake.
function CreateSprite(spriteName, layer, childNumber) end