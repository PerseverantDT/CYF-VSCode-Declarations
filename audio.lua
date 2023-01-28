--- @meta

--- @class Audio
--- @field playtime number Get or set the current play position of the current music in seconds.
--- @field totaltime number Get the total length of the current music in seconds.
--- @field isPlaying boolean (Readonly) Returns `true` if the music is playing, or `false` if the music is stopped or paused.
Audio = {}

--- Play the currently loaded music. Done automatically at the beginning of a fight.
Audio.Play = function() end

--- Stops the music. If you want a battle not to have music, call this in `EncounterStarting()`.
Audio.Stop = function() end

--- Pause the music.
Audio.Pause = function() end

--- Unpause the music if you previously paused it
Audio.Unpause = function() end

--- Set music to given volume. value should be between `0.0` (muted) and `1.0` (full volume). `0.75` by default.
---
--- @param value number
Audio.Volume = function(value) end

--- Set music pitch to given value. 1.0 is default, 2.0 is twice the regular speed.
--- Negative values play the music backwards. value may be between -3.0 and 3.0.
---
--- @param value number
Audio.Pitch = function(value) end

--- Load music from the Audio folder titled `filename.ogg` or `filename.wav` and play it immediately.
--- If you don't want immediate playback, call `Audio.Stop()` after this. Don't include the file extension.
---
--- @param filename string
Audio.LoadFile = function(filename) end

--- Play the sound from the Sounds folder titled `filename.ogg` or `filename.wav`. Don't include the file extension.
---
--- @param filename string
--- @param volume number `0.65` by default
---
--- @overload fun(filename: string)
Audio.PlaySound = function(filename, volume) end

--- Stops all playing audio
Audio.StopAll = function() end

--- Pauses all the audio sources
Audio.PauseAll = function() end

--- Unpauses all the audio sources
Audio.UnpauseAll = function() end

--- Adds a sound to the sound dictionary. Doing so allows you to change
--- the name of the sounds played by the engine - like, for example, hurtsound or menumove.
---
--- @param key string
--- @param value string
Audio.SetSoundDictionary = function(key, value) end

--- Returns the index of the sound in the sound dictionary. Returns the
--- key itself if the key isn't in the dictionary.
---
--- @param key string
--- @return string|integer keyOrIndex
Audio.GetSoundDictionary = function(key) end