local lu = require("luaunit")
local minBus = require("busroutes")

function Test_Case1()
	lu.assertEquals(2, minBus({ { 1, 2, 7 }, { 3, 6, 7 } }, 1, 6))
end

function Test_Case2()
	lu.assertEquals(-1, minBus({ { 7, 12 }, { 4, 5, 15 }, { 6 }, { 15, 19 }, { 9, 12, 13 } }, 15, 12))
end

function Test_Case3()
	lu.assertEquals(0, minBus({ { 1, 7 }, { 3, 5 } }, 5, 5))
end

function Test_Case4()
	lu.assertEquals(-1, minBus({ { 1, 2, 7 }, { 3, 6, 7 } }, 8, 6))
end

os.exit(lu.LuaUnit.run())
