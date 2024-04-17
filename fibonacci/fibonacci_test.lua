local fibonacci = require "fibonacci"

assert(fibonacci(0) == 1, "Fib 0 should be 1")
assert(fibonacci(1) == 1, "Fib 1 should be 1")
assert(fibonacci(2) == 2, "Fib 2 should be 2")
assert(fibonacci(3) == 3, "Fib 3 should be 3")
assert(fibonacci(4) == 5, "Fib 4 should be 5")
assert(fibonacci(5) == 8, "Fib 5 should be 8")
assert(fibonacci(6) == 13, "Fib 6 should be 13")
assert(fibonacci(7) == 21, "Fib 7 should be 21")
assert(fibonacci(40) == 165580141, "Fib 40 should be 165580141")
