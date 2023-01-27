--- @meta

--- @class Audio
--- @field playtime number Get or set the current play position of the current music in seconds.
--- @field totaltime number Get the total length of the current music in seconds.
--- @field isPlaying boolean (Readonly) Returns `true` if the music is playing, or `false` if the music is stopped or paused.
Audio = {}

--- Play the currently loaded music. Done automatically at the beginning of a fight.
local function Play() end
Audio.Play = Play

--- Stops the music. If you want a battle not to have music, call this in `EncounterStarting()`.
local function Stop() end
Audio.Stop = Stop

--- Pause the music.
local function Pause() end
Audio.Pause = Pause

--- Unpause the music if you previously paused it
local function Unpause() end
Audio.Unpause = Unpause

--- Set music to given volume. value should be between `0.0` (muted) and `1.0` (full volume). `0.75` by default.
---
--- @param value number
local function Volume(value) end
Audio.Volume = Volume

--- Set music pitch to given value. 1.0 is default, 2.0 is twice the regular speed.
--- Negative values play the music backwards. value may be between -3.0 and 3.0.
---
--- @param value number
local function Pitch(value) end
Audio.Pitch = Pitch

--- Load music from the Audio folder titled `filename.ogg` or `filename.wav` and play it immediately.
--- If you don't want immediate playback, call `Audio.Stop()` after this. Don't include the file extension.
---
--- @param filename string
local function LoadFile(filename) end
Audio.LoadFile = LoadFile

--- Play the sound from the Sounds folder titled `filename.ogg` or `filename.wav`. Don't include the file extension.
---
--- @param filename string
--- @param volume number `0.65` by default
---
--- @overload fun(filename: string)
local function PlaySound(filename, volume) end
Audio.PlaySound = PlaySound

--- Stops all playing audio
local function StopAll() end
Audio.StopAll = StopAll

--- Pauses all the audio sources
local function PauseAll() end
Audio.PauseAll = PauseAll

--- Unpauses all the audio sources
local function UnpauseAll() end
Audio.UnpauseAll = UnpauseAll

--- Adds a sound to the sound dictionary. Doing so allows you to change
--- the name of the sounds played by the engine - like, for example, hurtsound or menumove.
---
--- @param key string
--- @param value string
local function SetSoundDictionary(key, value) end
Audio.SetSoundDictionary = SetSoundDictionary

--- Returns the index of the sound in the sound dictionary. Returns the
--- key itself if the key isn't in the dictionary.
---
--- @param key string
--- @return string|integer keyOrIndex
local function GetSoundDictionary(key) end
Audio.GetSoundDictionary = GetSoundDictionary