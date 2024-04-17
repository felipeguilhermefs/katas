lu = require "luaunit"
assertEquals = lu.assertEquals

fizzbuzz = require "fizzbuzz"

function test_multipleOf3_Fizz()
  assertEquals(fizzbuzz(3), "Fizz")
  assertEquals(fizzbuzz(6), "Fizz")
  assertEquals(fizzbuzz(12), "Fizz")
end

function test_multipleOf5_Buzz()
  assertEquals(fizzbuzz(5), "Buzz")
  assertEquals(fizzbuzz(10), "Buzz")
  assertEquals(fizzbuzz(25), "Buzz")
end

function test_multipleOf3And5_FizzBuzz()
  assertEquals(fizzbuzz(15), "FizzBuzz")
  assertEquals(fizzbuzz(30), "FizzBuzz")
  assertEquals(fizzbuzz(45), "FizzBuzz")
end

function test_notMultipleOf3Or5_Num()
  assertEquals(fizzbuzz(1), "1")
  assertEquals(fizzbuzz(7), "7")
  assertEquals(fizzbuzz(38), "38")
end

os.exit(lu.LuaUnit.run())
