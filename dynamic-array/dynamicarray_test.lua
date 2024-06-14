local dynamicArray = require("dynamicarray")

local function assertEquals(expected, va)
	assert(expected == va, "Expected " .. expected .. "but received" .. va)
end

local function testCase1()
	local arr = dynamicArray(1)

	assertEquals(0, arr.getSize())
	assertEquals(1, arr.getCapacity())
end

local function testCase2()
	local arr = dynamicArray(1)

	arr.pushBack(1)
	assertEquals(1, arr.getSize())
	assertEquals(1, arr.getCapacity())

	arr.pushBack(2)
	assertEquals(2, arr.getSize())
	assertEquals(2, arr.getCapacity())
end

local function testCase3()
	local arr = dynamicArray(1)

	arr.pushBack(1)
	arr.pushBack(2)

	assertEquals(2, arr.get(1))

	arr.set(1, 3)
	assertEquals(3, arr.get(1))

	assertEquals(3, arr.popBack())

	assertEquals(1, arr.getSize())
	assertEquals(2, arr.getCapacity())
end

testCase1()
testCase2()
testCase3()
