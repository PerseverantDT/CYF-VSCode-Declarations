--- @meta

--- @class Sprite
--- @field spritename string (Readonly) Returns the path of the image used by this sprite, starting from the `Sprites/` folder.
--- @field x number Horizontal position of sprite relative to the bottom left corner of the screen, measured from its pivot/anchor point (center by default). If parented, x position is relative to the parent.
--- @field y number Vertical position of sprite relative to the bottom left corner of the screen, measured from its pivot/anchor point (center by default). If parented, y position is relative to the parent.
--- @field z number Layering position of sprite in the Overworld only. A negative number brings it forward (closer to the camera), a positive number sends it backwards (farther into the background). If parented, z position is relative to the parent.
--- @field absx number Horizontal position of sprite relative to the bottom left corner of the screen, ignoring its pivot/anchor point and all parents.
--- @field absy number Vertical position of sprite relative to the bottom left corner of the screen, ignoring its pivot/anchor point and all parents.
--- @field absz number Layering position of sprite in the Overworld only. A negative number brings it forward (closer to the camera), a positive number sends it backwards (farther into the background). Same as `z`, except that if this sprite has a parent, `absz` will not be relative to the z value of the parent.
--- @field xscale number Horizontal scaling of sprite (1.0 by default). 2.0 is twice as large, 0.5 is half as large.
--- @field yscale number Vertical scaling of sprite (1.0 by default). 2.0 is twice as large, 0.5 is half as large.
--- @field isactive boolean (Readonly) Returns `true` (Unitale/retromode) / `false` (CYF) if the sprite has been removed and `false` (Unitale/retromode) / `true` (CYF) otherwise.
--- @field width number (Readonly) Gives the width of the sprite object's active image in pixels. Does not take `xscale` into account.
--- @field height number (Readonly) Gives the height of the sprite object's active image in pixels. Does not take `yscale` into account.
--- @field xpivot number Horizontal pivot point of the sprite. `0` is the left side, and `1` is the right side. Can be any number inside or outside of this range. `0.5` by default
--- @field ypivot number Vertical pivot point of the sprite. `0` is the bottom side, and `1` is the top side. Can be any number inside or outside of this range. `0.5` by default
--- @field animcomplete boolean (Readonly) If a sprite has started an animation, this tells you if the animation is complete. If a sprite does not have an active animation, if the animation's loop mode is LOOP, or if the animation isn't finished yet, this will be `false`. Otherwise, it will be `true`.
--- @field currentframe integer If a sprite has an active animation running, this represents the index of the active frame in the animation. Otherwise, this will return `0`.
--- @field currenttime number If a sprite has an active animation running, this represents its current play time, in seconds. Can both be read and set.
--- @field totaltime number (Readonly) If a sprite has an active animation running, this represents the total amount of time its animation will last for. ote that this is based on the speed the animation runs at, and will always be equal to (`animationspeed` * the number of frames in a sprite's animation).
--- @field animationspeed number If a sprite has an active animation running, this represents the amount of seconds each frame will be displayed for. Can both be read and set. Must be `> 0`.
--- @field animationpaused boolean If a sprite has an active animation running, you can set this to `true` to pause it, or `false` to resume it.
--- @field loopmode "LOOP"|"ONESHOT"|"ONESHOTEMPTY" Gets the loop mode of a sprite's current animation, or sets the loop mode of a sprite's next animation.
--- @field color number[] Gets or sets the coloration of a sprite, as a table of 3 or 4 values from 0 to 1.
--- @field color32 integer[] Gets or sets the coloration of a sprite, as a table of 3 or 4 values from 0 to 255.
--- @field alpha number Gets or sets a sprite's transparency, as a value from 0 to 1.
--- @field alpha32 integer Gets or sets a sprite's transparency, as a value from 0 to 255.
--- @field rotation number Gets or sets a sprite's rotation, in degrees. Clamped between 0 and 360
--- @field layer string Gets or sets the current layer a sprite is on. Does nothing if you set it to a layer that doesn't exist.
--- @field shader unknown The shader object linked to this sprite object.
local sprite = {}

--- Change a sprite's current image. It retains its scaling and rotation. If you have an animation running with `SetAnimation`, the animation will override your sprite change.
---
--- @param newSprite string
sprite.Set = function(newSprite) end

--- Parents `sprite` to `otherSpriteObject`.
---
--- This will make the original sprite move along with the object it's parented to.
---
--- @param otherSpriteObject Sprite
sprite.SetParent = function(otherSpriteObject) end

--- Sets the masking mode of this sprite object. Does not function for Overworld Event sprites or Text Object letter sprites!
---
--- Available modes:
---
--- `off`: The default mode. Has no special properties.  
--- `box`: Any objects parented to this sprite are restricted to the bounding box of the sprite.
--- Recommended for masking bullets to the Arena and such things. Unfortunately doesn't seem
--- to work well with rotated sprites, but this is still the recommended mode for performance.  
--- `sprite`: Any objects parented to this sprite will be "cookie cuttered" to the current image of the sprite.  
--- `stencil`: Same as `sprite`, except that the parent sprite itself is not visible.  
--- `invertedsprite`: The reverse of `sprite`; while the sprite itself is visible, any
--- of its children will only display when not inside the bounds of the sprite.  
--- `invertedstencil`: Identical to `invertedsprite` except that the parent sprite is not shown.
---
--- @param mode "off"|"box"|"sprite"|"stencil"|"invertedsprite"|"invertedstencil
sprite.Mask = function(mode) end

--- Changes the point a sprite rotates and scales around.
---
--- @param x number
--- @param y number
sprite.SetPivot = function(x, y) end

--- Changes the point a sprite anchors to when moving.
---
--- @param x number
--- @param y number
sprite.SetAnchor = function(x, y) end

--- Moves the sprite `x` pixels right, and `y` pixels up.
---
--- @param x number
--- @param y number
sprite.Move = function(x, y) end

--- Same as setting `x` and `y` simultaneously.
sprite.MoveTo = function(x, y) end

--- Moves a sprite to an absolute screen position, regardless of its parent settings.
---
--- @param x number
--- @param y number
sprite.MoveToAbs = function(x, y) end

--- Same as setting xscale and yscale simultaneously.
---
---@param x number
---@param y number
sprite.Scale = function(x, y) end

--- Performs frame-by-frame animation with your own time between frames, in seconds.
--- It's the same as changing the sprite object's image with `sprite.Set` on a set timer.
--- If `timePerFrame` is `1`, it takes 1 second to move to the next sprite.
---
--- @param spriteTable string[]
--- @param timePerFrame number `1/30` by default
--- @param prefix string An optional string providing the path to a folder contained within your Sprites folder. This path will be automatically added to the beginning of every sprite's name. `""` by default
---
--- @overload fun(spriteTable: string[])
--- @overload fun(spriteTable: string[], timePerFrame: number)
sprite.SetAnimation = function(spriteTable, timePerFrame, prefix) end

--- Stops a frame-by-frame animation if it was running. Does NOT reset your sprite's
--- image back to its previous one! Instead, use `Set()` just after this function.
sprite.StopAnimation = function() end

--- Sends this sprite to the top of its layer's hierarchy. If a sprite has 5
--- children, for instance, you can use this to rearrange them internally. However,
--- child sprites will always appear on top of their parents, regardless of this function being called.
sprite.SendToTop = function() end

--- Sends this sprite to the bottom of its layer's hierarchy. Similar rules apply as with `SendToTop()`.
sprite.SendToBottom  = function() end

--- If both sprites have the same parent, this will move the calling sprite just below the other sprite.
---
--- @param otherSpriteObject Sprite
sprite.MoveBelow = function(otherSpriteObject) end

--- If both sprites have the same parent, this will move the calling sprite just above the other sprite.
---
--- @param otherSpriteObject Sprite
sprite.MoveAbove = function(otherSpriteObject) end

--- Removes a sprite object. Calling anything other than isactive after this will
--- give you an error. Removing a sprite object will also remove all children of the sprite object
sprite.Remove = function() end

--- Sets a variable in a sprite object that you can retrieve with `GetVar()`.
---
--- @param yourVariableName string
--- @param value any
sprite.SetVar = function(yourVariableName, value) end

--- Gets a variable in a sprite object that you previously set with `SetVar()`.
---
--- @param yourVariableName string
--- @return any value
sprite.GetVar = function(yourVariableName) end

--- Turns a sprite into dust, just like what happens in Undertale when an enemy is killed.
---
--- @param playSound boolean If `false`, deactivates the dust sound. `true` by default
--- @param removeObject boolean If `true`, removes the sprite. `false` by default
---
--- @overload fun()
--- @overload fun(playSound: boolean)
sprite.Dust = function(playSound, removeObject) end
