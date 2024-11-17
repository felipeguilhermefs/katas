local lu = require("luaunit")
local twosum = require("twosum")

function TestCase1()
	lu.assertEquals({ 1, 2 }, twosum({ 2, 7, 11, 15 }, 9))
end

function TestCase2()
	lu.assertEquals({ 2, 3 }, twosum({ 3, 2, 4 }, 6))
end

function TestCase3()
	lu.assertEquals({ 1, 2 }, twosum({ 3, 3 }, 6))
end

function TestCase4()
	lu.assertEquals({}, twosum({}, 2))
end

os.exit(lu.LuaUnit.run())
