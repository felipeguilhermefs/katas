local lu = require("luaunit")
local threesum = require("threesum")

function TestCase1()
	lu.assertEquals({ { -4, 1, 3 } }, threesum({ -2, 3, 1, 7, -4, 9 }))
end

function TestCase2()
	lu.assertEquals({ { -1, -1, 2 }, { -1, 0, 1 } }, threesum({ -1, 0, 1, 2, -1, -4 }))
end

function TestCase3()
	lu.assertEquals({}, threesum({ 1, 2, 7, 12 }))
end

function TestCase4()
	lu.assertEquals({ { -7, 0, 7 } }, threesum({ 7, 4, -7, 0 }))
end

function TestCase5()
	lu.assertEquals({}, threesum({}))
end

os.exit(lu.LuaUnit.run())
