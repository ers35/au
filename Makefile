default: test readme.md

test:
	lua5.3 test.lua

readme.md: au.lua Makefile
	lua -e 'for match in io.read("*all"):gmatch("--%[%[%[%s?(.-)--%]%]") do print(match) end' < "$<" > "$@"
