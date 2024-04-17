lu = require "luaunit"
assertEquals = lu.assertEquals

fibonacci = require "fibonacci"

function test_when0_return1()
  assertEquals(fibonacci(0), 1)
end

function test_when1_return1()
  assertEquals(fibonacci(1), 1)
end

function test_when2_return2()
  assertEquals(fibonacci(2), 2)
end

function test_when3_return3()
  assertEquals(fibonacci(3), 3)
end

function test_when4_return5()
  assertEquals(fibonacci(4), 5)
end

function test_when5_return8()
  assertEquals(fibonacci(5), 8)
end

function test_when7_return21()
  assertEquals(fibonacci(7), 21)
end

function test_when100_return1298777728820984005()
  assertEquals(fibonacci(100), 1298777728820984005)
end

os.exit(lu.LuaUnit.run())
