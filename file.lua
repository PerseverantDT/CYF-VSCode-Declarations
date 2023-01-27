--- @meta

--- @class File
--- @field openMode string (Readonly) Returns the file mode being used by this File object.
--- @field linecount integer (Readonly) The number of lines in the file.
--- @field filePath string (Readonly) The full file path to the opened file.
local file = {}

--- @class FileReader
local fileReader = {}

--- @class FileWriter
local fileWriter = {}

--- @class ReadableFile: File, FileReader
local readableFile = {}

--- @class WritableFile: File, FileWriter
local writableFile = {}

--- @class ReadableWritableFile: File, FileReader, FileWriter
local readWriteFile = {}

--- Moves the opened file to the path `new_path`. Can be used to rename a file.
---
--- @param new_path string
file.Move = function(new_path) end

--- Copies the opened file to the path `new_path`.
---
--- @param new_path string
--- @param overwrite boolean If `true`, a file at the target path that already exists will be replaced with the opened file.
file.Copy = function(new_path, overwrite) end

--- Returns the contents of line #`line` as a string.
---
--- May only be used on files opened with `r` or `rw`.
---
--- @param line integer
--- @return string lineContents
fileReader.ReadLine = function(line) end

--- Returns every line in the file as a separate string, all within one table. Same as
--- using `File.ReadLine()` on every line.
---
--- May only be used on files opened with `r` or `rw`.
---
--- @return string[] allLines
fileReader.ReadLines = function() end

--- Returns a table containing every individual byte in the file, start to finish, represented as a number.
---
--- Be prepared for a lag spike as soon as you use this function. Depending on the
--- size of the file, the resulting table can be very large.
---
--- May only be used on files opened with `r` or `rw`.
---
--- @return integer[] allBytes
fileReader.ReadBytes = function() end

--- Writes the text in `data` to the file. Supports `\n`. Creates the file if it doesn't exist.
---
--- @param data string
--- @param append boolean If true, the new text will be added to the end of the file (without a new line). Otherwise, the entire file will be replaced by data.
fileWriter.Write = function(data, append) end

--- Sets the contents of line #`line` in the file to `data`. Supports `\n`.
---
--- @param line integer
--- @param data string
fileWriter.ReplaceLine = function (line, data) end

--- Removes line #`line` from the file. The line that came after it previously is now line #`line`.
---
--- @param line integer
fileWriter.DeleteLine = function(line) end

--- Writes a series of bytes to a file. This will replace all contents of the file.
---
--- @param data integer[]
fileWriter.WriteBytes = function(data) end

--- Deletes the file. If using `w` or `rw` mode, you can use `Write()` to create the file again.
fileWriter.Delete = function() end
