local minstack = require("minstack")

local function testCase()
	local stack = minstack()

	stack.push(1)
	stack.push(2)
	stack.push(0)

	assert(0, stack.min())

	stack.pop()
	assert(2, stack.top())
	assert(1, stack.min())
end

testCase()
