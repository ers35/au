-- The author disclaims copyright to this source code.

--[[=
# au

Encode and decode the [Au](https://en.wikipedia.org/wiki/Au_file_format) audio file 
format.

## Install
`luarocks install ers35/au`
--]]

local au = {}

--[[=
## Usage
--]]

--[[=
### au.headersize

The minimum size in bytes of an Au header.
--]]
au.headersize = 6 * 4

local format = "c4>I4>I4>I4>I4>I4"

--[[=
### au.decode(header)

Decode an Au file header.

```lua
local encoded = io.open("sample.au", "r"):read("*all")
local decoded = au.decode(encoded)
```
--]]
function au.decode(input)
	if #input < au.headersize then
		return nil, "short header"
	end
	local magic, offset, size, encoding, rate, channels 
		= (format):unpack(input)
	if magic ~= ".snd" then
		return nil, "invalid magic"
	end
	if offset < au.headersize then
		return nil, "offset too short"
	end
	if offset % 8 ~= 0 then
		return nil, "offset not divisible by 8"
	end
	
	local output = {
		offset = offset,
		size = size,
		encoding = encoding,
		rate = rate,
		channels = channels,
	}
	return output
end

--[[=
### au.encode(table)

Encode an Au file header.

```lua
local encoded = au.encode({
	-- Optional.
	size = 32768,
	encoding = 3,
	rate = 48000,
	channels = 1,
})
```
--]]
function au.encode(input)
	local header = (format):pack(
		".snd", 
		au.headersize, 
		input.size or 0xffffffff, 
		input.encoding, 
		input.rate,
		input.channels
	)
	return header
end

return au
