--- @meta

--- The `NewAudio` object allows you to create sound channels and has overall
--- better music management than the Audio object.
---
--- Audio Channels can play up to one sound at a time, and will stop any currently
--- playing sounds if you add a new sound to the channel.
---
--- The default audio channel used by the Audio object (not this one) is called
--- `src`. It exists at the start of the encounter, and, by default, all music and
--- sounds will be played there. You may use it as the argument `name` in all of
--- the `NewAudio` functions.
--- @class NewAudio
NewAudio = {}

--- Creates an audio channel with the given name
---
--- @param name string The name of the audio channel
function NewAudio.CreateChannel(name) end

--- Destroys the audio channel with the given name
---
--- @param name string The name of the audio channel
function NewAudio.DestroyChannel(name) end

--- Checks if an audio channel with the given name exists
---
--- @param name string The name of the audio channel
--- @return boolean exists Whether the audio channel exists
function NewAudio.Exists(name) end

--- Gets the name and type of the audio clip currently playing in the specified channel
---
--- @param name string The name of the audio channel
--- @param withPrefix boolean (Optional, defaults to true) If `true`, the return value of this function will begin with `"music:"` for music clips, `"sound:"` for sound clips, and `"voice:"` for voice clips.
--- @return string audioName If no audio is playing, `"empty"` will be returned.
---
--- @overload fun(name: string): audioName: string
function NewAudio.GetAudioName(name, withPrefix) end

--- Gets the length of time in seconds that the specified channel's most recently played audio lasts for.
---
--- @param name string The name of the audio channel
--- @return number totalTime
function NewAudio.GetTotalTime(name) end

--- Get the current play position of the current audio of the specified channel in seconds.
---
--- @param name string The name of the audio channel
--- @return number playTime
function NewAudio.GetPlayTime(name) end

--- Get the current play position of the current audio of the specified channel in seconds.
---
--- @param name string The name of the audio channel
--- @return number playTime
function NewAudio.GetCurrentTime(name) end

--- Plays the provided music file on the specified channel.
---
--- @param name string The name of the audio channel
--- @param music string The name of the music file to play. These are loaded from your mod's `Audio` folder, as `.ogg` or `.wav` files. Don't include the file extension.
--- @param loop? boolean (Optional, defaults to `false`) Whether the engine should loop the music or not
--- @param volume? number (Optional, defaults to `1`) The volume of the music
---
--- @overload fun(name: string, music: string)
--- @overload fun(name: string, music: string, loop: boolean)
function NewAudio.PlayMusic(name, music, loop, volume) end

--- Plays the provided sound clip on the specified channel.
---
--- @param name string The name of the audio channel
--- @param sound string The name of the sound clip to play. These are loaded from your mod's `Sounds` folder, as `.ogg` or `.wav` files. Don't include the file extension.
--- @param loop? boolean (Optional, defaults to `false`) Whether the engine should loop the sound clip or not
--- @param volume number (Optional, defaults to `0.65`) The volume of the sound clip
---
--- @overload fun(name: string, sound: string)
--- @overload fun(name: string, sound: string, loop: boolean)
function NewAudio.PlaySound(name, sound, loop, volume) end

--- Plays the provided voice bit on the specified channel.
---
--- @param name string The name of the audio channel
--- @param voice string The name of the voice bit to play. These are loaded from your mod's `Sounds/Voices` folder, as `.ogg` or `.wav` files. Don't include the file extension.
--- @param loop? boolean (Optional, defaults to `false`) Whether the engine should loop the voice bit or not
--- @param volume? number (Optional, defaults to `0.65`) The volume of the voice bit
---
--- @overload fun(name: string, voice: string)
--- @overload fun(name: string, voice: string, loop: boolean)
function NewAudio.PlayVoice(name, voice, loop, volume) end

--- Sets the pitch (and speed) of the specified channel
---
--- @param name string The name of the audio channel
--- @param value number The new pitch of the channel; `1.0` is normal pitch/speed
function NewAudio.SetPitch(name, value) end

--- Gets the pitch of the specified channel
---
--- @param name string The name of the audio channel
--- @return number pitch The pitch of the channel
function NewAudio.GetPitch(name) end

--- Sets the volume of the specified channel
---
--- @param name string The name of the audio channel
--- @param value number The new volume of the channel; `0.75` is the default volume
function NewAudio.SetVolume(name, value) end

--- Gets the volume of the specified channel
---
--- @param name string The name of the audio channel
--- @return number volume The volume of the channel
function NewAudio.GetVolume(name) end

--- Play the last sound played in the specified channel
---
--- @param name string The name of the audio channel
function NewAudio.Play(name) end

--- Stops the audio in the specified channel
---
--- @param name string The name of the audio channel
function NewAudio.Stop(name) end

--- Pauses the audio in the specified channel
---
--- @param name string The name of the audio channel
function NewAudio.Pause(name) end

--- Unpauses the audio in the specified channel
---
--- @param name string The name of the audio channel
function NewAudio.Unpause(name) end

--- Sets the track position of the specified channel's audio
---
--- @param name string The name of the audio channel
--- @param value number The new position of the channel's audio, in seconds
function NewAudio.SetPlayTime(name, value) end

--- Checks if the specified channel's audio is stopped
---
--- @param name string The name of the audio channel
--- @return boolean isStopped
function NewAudio.isStopped(name) end

--- Stops all channels' audio
function NewAudio.StopAll() end

--- Pauses all channels' audio
function NewAudio.PauseAll() end

--- Unpauses all channels' audio
function NewAudio.UnpauseAll() end
