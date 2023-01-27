--- @meta

--- @class Time
--- @field time number (Readonly) Time (in seconds) since the game application started.
--- @field dt number (Readonly) Delta time (in seconds). This is the time it took for the last game update to complete.
--- @field mult number (Readonly) Multiplier to ensure equal movement across all framerates (this is essentially `deltatime`*`framerate`)
--- @field wave number (Readonly) Returns the elapsed time (in seconds) of the current waves while in DEFENDING. -1 outside of DEFENDING.
--- @field frameCount integer (Readonly) The total number of frames since the start of the encounter or overworld.
Time = {}