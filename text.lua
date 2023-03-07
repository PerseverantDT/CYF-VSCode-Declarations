--- @meta

--- @class Text
--- @field isactive boolean (Readonly) Tells you if a text object is active.
--- @field x number The local x position of the object, measured from the position of the text object's parent. This value depends on the object's pivot.
--- @field y number The local y position of the object, measured from the position of the text object's parent. This value depends on the object's pivot.
--- @field absx number The absolute x position of the object, measured from the bottom left corner of the screen. This value depends on the object's pivot.
--- @field absy number The absolute y position of the object, measured from the bottom left corner of the screen. This value depends on the object's pivot.
--- @field textMaxWidth number Get or set the maximum width of the text. If the value is lower than 16, it'll be set back to 16.
--- @field bubbleHeight number Get or set the height of the bubble. If the value is lower than 40, it'll be set back to 40.
--- @field layer string The sprite layer of the Text Object. If it doesn't exist, it returns an error. This is "BelowPlayer" by default.
--- @field color number[] Get or set the color of the text, as a table of 3 or 4 values from 0 to 1.
--- @field color32 integer[] Get or set the color of the text, as a table of 3 or 4 values from 0 to 255.
--- @field alpha number Get or set the text's transparency, as a value between 0 and 1.
--- @field alpha32 integer Get or set the text's transparency, as a value between 0 and 255.
--- @field currentLine integer Returns the number of the line (page) that the text is currently on, starting from 0.
local text = {}

--- This value is used to set the progression mode of the text to one of the following values:
---
--- `"auto"`: Makes the text start a new line after a given number of frames set in `Text.SetAutoWaitTimeBetweenTexts().`  
--- `"manual"`: Makes the text require the player to press the Confirm button at the end of each line.  
--- `"none"`: With this option, you will need to manually display the next line in-code using `Text.NextLine()`.
---
--- @type "auto"|"manual"|"none"
text.progressmode = nil

--- Returns a number representing the total number of visible characters currently shown in the
--- text object's text. It also works the same if your text is slowed down or sped up.
---
--- Any text commands that you have in your active line of text will be ignored by this number,
--- as it only counts the visible characters, and not the length of the string you put into the text object.
---
--- @type integer
text.currentReferenceCharacter = nil

--- Shortcut to `Text.DestroyText()`
text.Remove = function() end

--- This function destroys a text object. Trying to get, set or call almost anything
--- besides `Text.isactive` on a destroyed text object will error.
---
--- Note that this happens automatically if a text object closes itself, either by
--- having the player close it or by closing automatically if progressmode is `"auto"`.
text.DestroyText = function() end

--- Resets any previous set of the variable `Text.color` or `Text.color32`, resetting
--- the text's default color to the font's default color.
---
--- This function will not reset the color's alpha if it was set in any way unless resetAlpha is set to true.
text.ResetColor = function() end

--- Resets the text object's alpha value, whether it was set through `Text.alpha`,
--- `Text.color` or `Text.Textcolor32`, resetting the text's default alpha to the font's default alpha.
text.ResetAlpha = function() end

--- Returns a table containing sprite objects representing every letter to be
--- displayed in the text object's current line of text. Note that even if a
--- text object has not finished typing yet, all characters it will type are still
--- accessible this way.
---
--- Accessing this table generates the table anew every time. To save on resources,
--- store this table to a local variable before doing any operations on it. Even
--- code such as `for i = 1, #Text.GetLetters()` do is a bad idea.
---
--- @return Sprite[] letterSprites Letter sprite objects can not have their layer changed, can not run `Sprite.Mask`, and can only be parented to other letter sprites. They cannot be deleted or dusted (using `Sprite.Dust()`) as well.
text.GetLetters = function() end

--- Skip to the end of the text object's current text, as if using the text command
--- `[instant]`. If playerskipdocommand is true, this function will behave the same as a player skip.
text.SkipLine = function() end

--- READONLY
---
--- `true` if the current line (page) of text is fully displayed, `false` otherwise.
---
--- @type boolean
text.lineComplete = nil

--- READONLY
---
--- `true` if the current line of text is fully displayed *and* if this
--- is the last line the test object will show, `false` otherwise.
---
--- @type boolean
text.allLinesComplete = nil

--- Returns the total number of lines/pages of text set to the text object,
--- regardless of whether they've been shown yet.
---
--- @return integer lineCount
text.lineCount = function() end

--- Shows the next line (dialogue) of the text instantly, regardless of if the
--- current one is finished or what progress mode the object has.
---
--- If you run this function while this is this text object's last line, it will
--- have the same effect as the function `Text.DestroyText`.
text.NextLine = function() end

--- Shortcut to `Text.SetAutoWaitTimeBetweenTexts`.
---
--- @param time number
text.SetWaitTime = function(time) end

--- Sets the number of frames to wait before automatically going to the next line
--- of text. Only applies to the `"auto"` progress mode.
---
--- @param time number
text.SetAutoWaitTimeBetweenTexts = function(time) end

--- Sets the text object's parent. The text object will follow around the parent object as it moves.
---
--- NOTE: If you are in the Overworld, you can NOT use this to parent text objects to Event objects' sprites.
---
--- @param parent Sprite
text.SetParent = function(parent) end

--- If this text object has a parent set via `Text.SetParent()`, this will control
--- its anchor point (the relative point on the parent sprite that the text object
--- will follow if the parent sprite gets scaled).
---
--- `x` and `y` should usually both be between `0` and `1`. However, you are free to
--- use numbers outside of this range as well.
---
--- @param x number
--- @param y number
text.SetAnchor = function(x, y) end

--- Allows you to stretch and squish text objects, similarly to sprite objects.
---
--- This works at any point: while the text has not yet started to type, is in the
--- middle of typing, is paused, between lines, even if it's done typing.
---
--- @type number
text.xscale = nil

--- Allows you to stretch and squish text objects, similarly to sprite objects.
---
--- This works at any point: while the text has not yet started to type, is in the
--- middle of typing, is paused, between lines, even if it's done typing.
---
--- @type number
text.yscale = nil

--- Same as setting `Text.xscale` and `Text.yscale` at the same time.
---
--- @param x number
--- @param y number
text.Scale = function(x, y) end

--- Moves a text object below another text object. They must both be on the same layer.
---
--- @param otherTextObject Text
text.MoveBelow = function(otherTextObject) end

--- Moves a text object above another text object. They must both be on the same layer.
---
--- @param otherTextObject Text
text.MoveAbove = function(otherTextObject) end

--- Adds the given text to the object's text table. Acts like `Text.SetText()` if all the text is already done.
---
--- @param text string|string[]
text.AddText = function(text) end

--- Sets the text in the Text Object. If the text object is inactive when this is called,
--- the object will reactive itself.
---
--- @param text string|string[]
text.SetText = function(text) end

--- Pauses the text object's typing, in the same way as `[waitfor:key]`, except that it
--- doesn't resume until you use this function again. However, while paused, text can
--- still be skipped, unless `[noskip]` is applied to the text first.
---
--- @param pause boolean
text.SetPause = function(pause) end

--- Tells you whether text has been paused with `Text.SetPause()`. It does not
--- count if the text object was paused by other means, such as `[waitfor:key]`.
---
--- @return boolean isPaused
text.isPaused = function() end

--- Sets the voice of the text object. Functionally same as the text command `[voice]`.
---
--- @param voiceName string
text.SetVoice = function(voiceName) end

--- Sets the font of the text. Same as the text command `[font]`.
---
--- @param fontName string
text.SetFont = function(fontName) end

--- Sets the effect of the text. Same as the text command `[effect]`.
---
--- @param effect TextEffect
--- @param intensity number (Optional, defaults to `-1`)
---
--- @overload fun(effect: TextEffect)
text.SetEffect = function(effect, intensity) end

--- Adds a bubble to the text. You can also set the side and the position of the tail (a.k.a. speech thing) if you want to.
---
--- @param side string|nil (Optional, defaults to `nil`)
--- @param position number|string|nil (Optional, defaults to `nil`)
---
--- @overload fun()
--- @overload fun(side: string|nil)
text.ShowBubble = function(side, position) end

--- Shortcut to `Text.SetSpeechThingPositionAndSide`.
---
--- @param side BubbleSide
--- @param position number|string (Optional, defaults to `"50%"`)
---
--- @overload fun(side: string)
text.SetTail = function(side, position) end

--- Sets the size and position of the dialogue bubble's tail (a.k.a speech thing).
---
--- @param side BubbleSide
--- @param position number|string (Optional, defaults to `"50%"`)
text.SetSpeechThingPositionAndSide = function(side, position) end

--- Hides the bubble
text.HideBubble = function() end

--- Moves the text to a new position, relative to the text object's parent's position.
---
--- @param x number
--- @param y number
text.MoveTo = function(x, y) end

--- Moves the text to a new position, relative to the bottom left corner of the window.
---
--- @param x number
--- @param y number
text.MoveToAbs = function(x, y) end

--- Returns the width of the currently set text in pixels. Will give the same
--- result even if the text isn't finished typing. Also ignores `Text.xscale`.
text.GetTextWidth = function() end

--- Returns the height of the curently set text in pixels. Will give the same
--- result even if the text isn't finished typing. Also ignores `Text.yscale`.
---
--- Note: This function is not 100% accurate.
text.GetTextHeight = function() end

--- Creates a Text Object and returns it.
---
--- To allow for using properties such as Text.SetFont and Text.color on the same frame as
--- creating the text object, a one-frame delay is implemented by default: The text object
--- will not create its letters or start typing until one frame after you call CreateText.
--- As a consequence, expect a few properties such as Text.color and Text.Getletters to run
--- into issues if you run them on the same frame you use CreateText.
---
--- @param text string|string[] The text to display.
--- @param position number[] Two numbers: The x and y positions of the center of the object.
--- @param textMaxWidth number
--- @param layer string (Optional, defaults to `"BelowPlayer"`) The sprite layer of the Text Object.
--- @param bubbleHeight number (Optional, defaults to `-1`) If set to `-1`, autocomputes the height of the bubble.
--- @return Text text
---
--- @nodiscard Since this function creates an instance of Text, discarding the return value is most likely a mistake
function CreateText(text, position, textMaxWidth, layer, bubbleHeight) end

--- @alias TextEffect
--- | "none"
--- | "twitch"
--- | "shake"
--- | "rotate"
--- @alias BubbleSide
--- | "left"
--- | "right"
--- | "up"
--- | "down"
--- | "none"