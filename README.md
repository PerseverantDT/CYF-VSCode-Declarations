# Create Your Frisk Declarations

This repository contains declarations of built-in functions and objects in Create Your Frisk for code auto-completion.

## Usage

- Requires [sumneko's Lua VSCode extension](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)

Simply copy the files into a folder and add the following configs to your workspace.

```json
{
  ... // omitted for brevity
  
    "Lua.workspace.library": [
        ...
        "{folder_where_the_files_are}/allScriptFunctions.lua",
        "{folder_where_the_files_are}/encounterScriptFunctions.lua",
        "{folder_where_the_files_are}/monsterScriptFunctions.lua",
        "{folder_where_the_files_are}/waveScriptFunctions.lua",
        "{folder_where_the_files_are}/spriteAndAnimationFunctions.lua",
        "{folder_where_the_files_are}/projectileFunctions.lua",
        "{folder_where_the_files_are}/arena.lua",
        "{folder_where_the_files_are}/player.lua",
        "{folder_where_the_files_are}/script.lua",
        "{folder_where_the_files_are}/audio.lua",
        "{folder_where_the_files_are}/spriteAndAnimation.lua",
        "{folder_where_the_files_are}/projectile.lua",
        "{folder_where_the_files_are}/input.lua",
        "{folder_where_the_files_are}/text.lua",
        "{folder_where_the_files_are}/time.lua",
        "{folder_where_the_files_are}/misc.lua",
        "{folder_where_the_files_are}/file.lua",
        "{folder_where_the_files_are}/newAudio.lua"
        ...
    ],
    "Lua.workspace.ignoreDir": [
        ...
        "{folder_where_the_files_are}"
        ...
    ],
    ...
}
```
