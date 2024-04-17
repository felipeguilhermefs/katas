lu = require "luaunit"
assertTrue = lu.assertTrue
assertFalse = lu.assertFalse

bb = require "balancedbraces"
is_balanced = bb.is_balanced

function test_singleOpenAndClose_isBalanced()
  assertTrue(is_balanced("()"))
  assertTrue(is_balanced("[]"))
  assertTrue(is_balanced("{}"))
end

function test_nestedOpenAndCloseSameChar_isBalanced()
  assertTrue(is_balanced("(())"))
  assertTrue(is_balanced("[[]]"))
  assertTrue(is_balanced("{{}}"))
end

function test_nestedOpenAndClose_isBalanced()
  assertTrue(is_balanced("({[]})"))
  assertTrue(is_balanced("[{()}]"))
  assertTrue(is_balanced("{([])}"))
end

function test_openAndCloseWithWeirdChar_isBalanced()
  assertTrue(is_balanced("(a)"))
  assertTrue(is_balanced("b[]"))
  assertTrue(is_balanced("{}c"))
end

function test_multipleNestedOpenAndClose_isBalanced()
  assertTrue(is_balanced("{()}[[{}]]"))
end

function test_noOpenOrClose_isBalanced()
  assertTrue(is_balanced(""))
  assertTrue(is_balanced("a"))
  assertTrue(is_balanced("<>"))
end

function test_singleChar_notBalanced()
  assertFalse(is_balanced("["))
  assertFalse(is_balanced("{"))
  assertFalse(is_balanced("("))
  assertFalse(is_balanced("]"))
  assertFalse(is_balanced("}"))
  assertFalse(is_balanced(")"))
end

function test_doubleClose_notBalanced()
  assertFalse(is_balanced("))"))
  assertFalse(is_balanced("]]"))
  assertFalse(is_balanced("}}"))
end

function test_doubleOpen_notBalanced()
  assertFalse(is_balanced("(("))
  assertFalse(is_balanced("[["))
  assertFalse(is_balanced("{{"))
end

function test_openAndCloseWithDifferentSymbols_notBalanced()
  assertFalse(is_balanced("[}"))
  assertFalse(is_balanced("(]"))
  assertFalse(is_balanced("{)"))
  assertFalse(is_balanced("[{]}"))
  assertFalse(is_balanced("{(])"))
end

os.exit(lu.LuaUnit.run())

