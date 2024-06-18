local lu = require("luaunit")
local bb = require("balancedbraces")

function Test_singleOpenAndClose_isBalanced()
	lu.assertTrue(bb.is_balanced("()"))
	lu.assertTrue(bb.is_balanced("[]"))
	lu.assertTrue(bb.is_balanced("{}"))
end

function Test_nestedOpenAndCloseSameChar_isBalanced()
	lu.assertTrue(bb.is_balanced("(())"))
	lu.assertTrue(bb.is_balanced("[[]]"))
	lu.assertTrue(bb.is_balanced("{{}}"))
end

function Test_nestedOpenAndClose_isBalanced()
	lu.assertTrue(bb.is_balanced("({[]})"))
	lu.assertTrue(bb.is_balanced("[{()}]"))
	lu.assertTrue(bb.is_balanced("{([])}"))
end

function Test_openAndCloseWithWeirdChar_isBalanced()
	lu.assertTrue(bb.is_balanced("(a)"))
	lu.assertTrue(bb.is_balanced("b[]"))
	lu.assertTrue(bb.is_balanced("{}c"))
end

function Test_multipleNestedOpenAndClose_isBalanced()
	lu.assertTrue(bb.is_balanced("{()}[[{}]]"))
end

function Test_noOpenOrClose_isBalanced()
	lu.assertTrue(bb.is_balanced(""))
	lu.assertTrue(bb.is_balanced("a"))
	lu.assertTrue(bb.is_balanced("<>"))
end

function Test_singleChar_notBalanced()
	lu.assertFalse(bb.is_balanced("["))
	lu.assertFalse(bb.is_balanced("{"))
	lu.assertFalse(bb.is_balanced("("))
	lu.assertFalse(bb.is_balanced("]"))
	lu.assertFalse(bb.is_balanced("}"))
	lu.assertFalse(bb.is_balanced(")"))
end

function Test_doubleClose_notBalanced()
	lu.assertFalse(bb.is_balanced("))"))
	lu.assertFalse(bb.is_balanced("]]"))
	lu.assertFalse(bb.is_balanced("}}"))
end

function Test_doubleOpen_notBalanced()
	lu.assertFalse(bb.is_balanced("(("))
	lu.assertFalse(bb.is_balanced("[["))
	lu.assertFalse(bb.is_balanced("{{"))
end

function Test_openAndCloseWithDifferentSymbols_notBalanced()
	lu.assertFalse(bb.is_balanced("[}"))
	lu.assertFalse(bb.is_balanced("(]"))
	lu.assertFalse(bb.is_balanced("{)"))
	lu.assertFalse(bb.is_balanced("[{]}"))
	lu.assertFalse(bb.is_balanced("{(])"))
end

os.exit(lu.LuaUnit.run())
