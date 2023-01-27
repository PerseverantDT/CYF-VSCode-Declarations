--- @meta

--- @class Misc
--- @field MachineType string (Readonly) Returns the name of the player's session.
--- @field OSType string (Readonly) Returns `Windows`, `Mac` or `Linux`.
--- @field ScreenShader unknown A shader object that affects the entire screen, instead of a single sprite.
--- @field cameraX number Gets or sets the current x position of the bottom-left corner of the camera.
--- @field cameraY number Gets or sets the current y position of the bottom-left corner of the camera.
--- @field FullScreen boolean Gets or sets whether the user is in fullscreen mode.
--- @field WindowWidth number Returns the width of the game window when running in windowed mode (even in fullscreen). If set, it will set the width of CYF's window in pixels.
--- @field WindowHeight number Returns the height of the game window when running in windowed mode (even in fullscreen). If set, it will set the height of CYF's window in pixels.
--- @field ScreenWidth number (Readonly) Returns the width of the user's screen in windowed mode, or the number of displayed pixel columns when in fullscreen.
--- @field ScreenHeight number (Readonly) Returns the height of the user's screen in windowed mode, or the number of displayed pixel rows when in fullscreen.
--- @field MonitorWidth number (Readonly) Returns the width of the user's monitor, regardless of the user's settings or if `SetWideFullscreen()` has been used.
--- @field MonitorHeight number (Readonly) Returns the height of the user's monitor, regardless of the user's settings or if `SetWideFullscreen()` has been used.
--- @field debuggerX number Change the debugger's x position relative to the camera's position.
--- @field debuggerY number Change the debugger's y position relative to the camera's position.
--- @field debuggerAbsX number Change the debugger's x position relative to the encounter's bottom-left corner, or the map's bottom-left corner if used in the overworld.
--- @field debuggerAbsY number Change the debugger's y position relative to the encounter's bottom-left corner, or the map's bottom-left corner if used in the overworld.
--- @field isDebuggerAttachedToCamera boolean Whether or not the camera should move the debugger along with it when it moves. `true` by default.
--- @field WindowName string (Windows-only) Gets or sets the name of the window.
--- @field WindowX number (Windows-only) Gets or sets the X position of the bottom left corner of the window.
--- @field WindowY number (Windows-only) Gets or sets the Y position of the bottom left corner of the window.
Misc = {}

--- Shakes the screen for `durationInFrames` frames, with a maximum of `intensity` pixels
--- away from the normal position.
---
--- @param durationInFrames integer
--- @param intensity number `3` by default
--- @param isIntensityDecreasing boolean `false` by default
---
--- @overload fun(durationInFrames: integer)
--- @overload fun(durationInFrames: integer, intensity: number)
Misc.ShakeScreen = function(durationInFrames, intensity, isIntensityDecreasing) end

--- Stops a previous `ShakeScreen` call, does nothing otherwise.
Misc.StopShake = function() end

--- Resets the position of the camera. Same as calling `MoveCameraTo(0, 0)` in battle -
--- in the Overworld, this instead resets the camera to the Player's position.
Misc.ResetCamera = function() end

--- Resizes CYF's window to the given width and height, in pixels. The parameters
--- width and height must both be positive, and the function will return true if
--- the window was successfully resized, false otherwise. The window will not be
--- resized if the requested width or height are bigger than the player's screen's
--- respective width or height.
---
--- @param width number
--- @param height number
--- @return boolean isResized
Misc.ResizeWindow = function(width, height) end

--- If the user is playing with an aspect ratio wider than 4:3, this function will
--- expand the view in fullscreen to show the space to the left and right of the
--- 640x480 screen space.
---
--- It will only take effect when in fullscreen, and will automatically resize the view if already in fullscreen. If the user's aspect ratio is 4:3 or thinner, nothing will change.
---
--- Note that object positions, such as projectiles and sprites, will remain the same.
---
--- Only allowed during battles.
---
--- @param wide boolean
Misc.SetWideFullscreen = function(wide) end

--- Closes the window instantly.
Misc.DestroyWindow = function() end

--- Move the debugger relative to its current position.
---
--- @param x number
--- @param y number
Misc.MoveDebugger = function(x, y) end

--- Move the debugger relative to the camera's current position.
---
--- @param x number
--- @param y number
Misc.MoveDebuggerTo = function(x, y) end

--- Move the debugger relative to the encounter's bottom-left corner, or the
--- map's bottom-left corner if used in the overworld.
---
--- @param x number
--- @param y number
Misc.MoveDebuggerToAbs = function(x, y) end

--- (Windows-only) Moves the window X pixels horizontally and Y pixels vertically.
---
--- @param x number
--- @param y number
Misc.MoveWindow = function(x, y) end

--- (Windows-only) Moves the bottom left corner of the window to the given coordinates.
---
--- @param x number
--- @param y number
Misc.MoveWindowTo = function(x, y) end

--- Use this function to check if a file in your Mod folder ONLY exists. Using `../` to go up a folder is NOT allowed.
---
--- @param path string Path to the file to open, relative to your Mod folder. Can enter subfolders such as `Lua`.
--- @return boolean fileExists
Misc.FileExists = function(path) end

--- This function returns a list of either files or folders in your Mod folder ONLY. Using `../` to go up a folder is NOT allowed.
---
--- @param path string Path to the file to open, relative to your Mod folder. Can enter subfolders such as `Lua`.
--- @param getFolders boolean If `true`, this function will return the names of all Folders in path. Otherwise, this function will return the names of all Files in path. `false` by default
--- @return string[] childrenFilesOrFolders
---
--- @overload fun(path: string)
Misc.ListDir = function(path, getFolders) end

--- Use this function to check if a folder in your Mod folder ONLY exists. Using `../` to go up a folder is NOT allowed.
---
--- @param path string Path to the folder to open, relative to your Mod folder. Can enter subfolders such as `Lua`.
--- @return boolean dirExists
Misc.DirExists = function(path) end

--- Attempts to create a folder with the path `path` relative to your Mod folder. Using `../` to go up a folder is NOT allowed.
---
--- @param path string
--- @return boolean successful `true` if the operation was successful. `false` otherwise.
Misc.CreateDir = function(path) end

--- Attempts to move a folder with the path `path` relative to your Mod folder to a new location `newPath` also relative to your mod folder. Using `../` to go up a folder is NOT allowed.
---
--- @param path string
--- @param newPath string
--- @return boolean successful `true` if the operation was successful. `false` otherwise.
Misc.MoveDir = function(path, newPath) end

--- Attempts to delete a folder with the path `path` relative to your mod folder. Using `../` to go up a folder is NOT allowed.
---
--- @param path string
--- @param force boolean If `true`, this function will forcefully remove a folder. Otherwise, a folder will only be removed if it is empty. `false` by default
--- @return boolean successful `true` if the operation was successful. `false` otherwise.
---
--- @overload fun(path: string)
Misc.RemoveDir = function(path, force) end

--- This function opens a file in your Mod folder ONLY, for reading and writing. Using `../` to go up a folder is NOT allowed.
---
--- @param path string Path to the file to open, relative to your Mod folder. Can enter subfolders such as `Lua`
--- @param mode "rw" Determines how the file should be opened: `r`: The file can only be read from; `w` The file can only be written to; `rw` The file can be read from AND written to.
--- @return ReadableWritableFile file
---
--- @overload fun(path: string, mode: 'r'): ReadableFile
--- @overload fun(path: string, mode: 'w'): WritableFile
Misc.OpenFile = function(path, mode) end
