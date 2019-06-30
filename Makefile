default: test readme.md

test:
	lua5.3 test.lua

readme.md: au.lua
	doc $< $@
