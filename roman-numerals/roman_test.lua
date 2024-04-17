lu = require "luaunit"
assertEquals = lu.assertEquals

roman = require "roman"

function test_shouldConvertWithSymbol_I()
  assertEquals(roman(1), "I")
  assertEquals(roman(2), "II")
  assertEquals(roman(3), "III")
end

function test_shouldConvertWithSymbol_V()
  assertEquals(roman(4), "IV")
  assertEquals(roman(5), "V")
  assertEquals(roman(6), "VI")
  assertEquals(roman(8), "VIII")
end

function test_shouldConvertWithSymbol_X()
  assertEquals(roman(9), "IX")
  assertEquals(roman(10), "X")
  assertEquals(roman(14), "XIV")
  assertEquals(roman(28), "XXVIII")
  assertEquals(roman(39), "XXXIX")
end

function test_shouldConvertWithSymbol_L()
  assertEquals(roman(43), "XLIII")
  assertEquals(roman(50), "L")
  assertEquals(roman(75), "LXXV")
end

function test_shouldConvertWithSymbol_C()
  assertEquals(roman(93), "XCIII")
  assertEquals(roman(100), "C")
  assertEquals(roman(255), "CCLV")
  assertEquals(roman(399), "CCCXCIX")
end

function test_shouldConvertWithSymbol_D()
  assertEquals(roman(403), "CDIII")
  assertEquals(roman(500), "D")
  assertEquals(roman(701), "DCCI")
end

function test_shouldConvertWithSymbol_M()
  assertEquals(roman(903), "CMIII")
  assertEquals(roman(1000), "M")
  assertEquals(roman(2601), "MMDCI")
  assertEquals(roman(3856), "MMMDCCCLVI")
  assertEquals(roman(4000), "MMMM")
end

function test_when0OrNegative_shouldBeEmpty()
  assertEquals(roman(0), "")
  assertEquals(roman(-1), "")
  assertEquals(roman(-35), "")
end

os.exit(lu.LuaUnit.run())
