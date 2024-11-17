local lu = require("luaunit")
local closest = require("closestkelements")

function Test_ArrayEmptyOrNil_returnsEmpty()
	lu.assertEquals({}, closest({}, 3, 1))
	lu.assertEquals({}, closest(nil, 3, 1))
end

function Test_KIsNegativeOrZero_returnsEmpty()
	lu.assertEquals({}, closest({ 1, 2, 3 }, -3, 1))
	lu.assertEquals({}, closest({ 1, 2, 3 }, 0, 1))
end

function Test_SingleElement_returnsElement()
	lu.assertEquals({ 1 }, closest({ 1 }, 1, 1))
end

function Test_TargetExistsInMiddle()
	lu.assertEquals({ 1, 2, 3, 4 }, closest({ 1, 2, 3, 4, 5 }, 4, 3))
end

function Test_TargetNegativeAndAbsent()
	lu.assertEquals({ 1, 1, 2, 3 }, closest({ 1, 1, 2, 3, 4, 5 }, 4, -1))
end

function Test_TargetAbsentWithMultipleDuplicates()
	lu.assertEquals({ 3, 3, 4 }, closest({ 0, 0, 1, 2, 3, 3, 4, 7, 7, 8 }, 3, 5))
end

os.exit(lu.LuaUnit.run())
