local au = require("au")

local encoded = "\x2e\x73\x6e\x64\x00\x00\x00\x18\x00\x00\x25\x80\x00\x00\x00\x03\x00\x00\xbb\x80\x00\x00\x00\x01"

local output = au.decode(encoded)
assert(output.offset == 24)
assert(output.size == 9600)
assert(output.encoding == 3)
assert(output.rate == 48000)
assert(output.channels == 1)

local header = au.encode(output)
assert(header == encoded)
