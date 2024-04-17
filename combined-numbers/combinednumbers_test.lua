lu = require "luaunit"
assertEquals = lu.assertEquals

cn = require "combinednumbers"
greatest = cn.greatest

function test_singleElement()
  assertEquals(greatest({1}), "1")
end

function test_multipleElementsWithSingleDigit()
  assertEquals(greatest({8, 2, 1, 9}), "9821")
end

function test_multipleElementsWith1Or2Digits()
  assertEquals(greatest({53, 2, 10, 9}), "953210")
end

function test_multipleElements2Digits()
  assertEquals(greatest({50, 5, 56}), "56550")
end

function test_multipleElementsMultipleDigits()
  assertEquals(greatest({420, 42, 423, 4}), "442342420")
end

function test_repeatedElements()
  assertEquals(greatest({6, 6, 6}), "666")
end

function test_multipleElementsSameDigit()
  assertEquals(greatest({7, 77, 777}), "777777")
end

os.exit(lu.LuaUnit.run())
