# au

Encode and decode the [Au](https://en.wikipedia.org/wiki/Au_file_format) audio file 
format.

## Install
`luarocks install ers35/au`

## Usage

### au.headersize

The minimum size in bytes of an Au header.

### au.decode(header)

Decode an Au file header.

```lua
local encoded = io.open("sample.au", "r"):read("*all")
local decoded = au.decode(encoded)
```

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

