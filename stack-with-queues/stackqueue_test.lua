local lu = require("luaunit")
local Stack = require("stackqueue")

function TestEmpty()
	local s = Stack()
	lu.assertTrue(s.empty())
	lu.assertNil(s.pop())
end

function TestSingleItem()
	local s = Stack()
	s.push(1)

	lu.assertFalse(s.empty())
	lu.assertEquals(s.pop(), 1)
	lu.assertTrue(s.empty())
end

function TestMultipleItems()
	local s = Stack()
	s.push(1)
	s.push(true)
	s.push("abc")
	s.push({ 4, 5, 6 })

	lu.assertFalse(s.empty())
	lu.assertEquals(s.pop(), { 4, 5, 6 })
	lu.assertEquals(s.pop(), "abc")
	lu.assertEquals(s.pop(), true)
	lu.assertEquals(s.pop(), 1)
	lu.assertTrue(s.empty())
end

function TestGeneral()
	local s = Stack()
	s.push(1)
	s.push(2)

	lu.assertEquals(2, s.pop())
	lu.assertFalse(s.empty())

	s.push(3)
	s.push(4)

	lu.assertEquals(4, s.pop())
	lu.assertEquals(3, s.pop())
	lu.assertEquals(1, s.pop())
	lu.assertNil(s.pop())
	lu.assertTrue(s.empty())

	s.push(5)
	lu.assertEquals(5, s.pop())
	lu.assertTrue(s.empty())
end

os.exit(lu.LuaUnit.run())
