local lu = require("luaunit")
local freq = require("topkfrequent")

function Test_ArrayEmptyOrNil_returnsEmpty()
	lu.assertEquals({}, freq({}, 3))
	lu.assertEquals({}, freq(nil, 3))
end

function Test_KIsLargerThanNumberOfDistinctElements_returnsAllDistinctElements()
	lu.assertEquals({ 2, 1 }, freq({ 1, 1, 2, 2, 2 }, 3))
end

function Test_KIsNegativeOrZero_returnsEmpty()
	lu.assertEquals({}, freq({ 1, 1, 2, 2, 2 }, -3))
	lu.assertEquals({}, freq({ 1, 1, 2, 2, 2 }, 0))
end

function Test_SingleElement_returnsElement()
	lu.assertEquals({ 1 }, freq({ 1 }, 1))
end

function Test_SimpleCase()
	lu.assertEquals({ 1, 2 }, freq({ 1, 1, 1, 2, 2, 3 }, 2))
end

function Test_SameFrequency_returnsSmallerElements()
	lu.assertEquals({ 2, 3 }, freq({ 1, 2, 2, 2, 3, 3, 4, 4 }, 2))
end

os.exit(lu.LuaUnit.run())
