local lu = require("luaunit")

local sort = require("merge")

function testEmpty()
	local empty = {}
	sort(empty)
	lu.assertEquals(empty, {})
end

function testOrdered()
	local ordered = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }
	sort(ordered)
	lu.assertEquals(ordered, { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 })
end

function testReversed()
	local reversed = { 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 }
	sort(reversed)
	lu.assertEquals(reversed, { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 })
end

function testUnordered()
	local unordered = { 1, 5, 3, 7, 6, 0, 9, 2, 8, 4 }
	sort(unordered)
	lu.assertEquals(unordered, { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 })
end

os.exit(lu.LuaUnit.run())
