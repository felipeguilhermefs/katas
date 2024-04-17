local bb = require "balancedbraces"
local is_balanced = bb.is_balanced

assert(is_balanced("()"), "Single open and close should be balanced")
assert(is_balanced("[]"), "Single open and close should be balanced")
assert(is_balanced("{}"), "Single open and close should be balanced")

assert(is_balanced("(())"), "Nested open and close, same char, should be balanced")
assert(is_balanced("[[]]"), "Nested open and close, same char, should be balanced")
assert(is_balanced("{{}}"), "Nested open and close, same char, should be balanced")

assert(is_balanced("({[]})"), "Nested open and close should be balanced")
assert(is_balanced("[{()}]"), "Nested open and close should be balanced")
assert(is_balanced("{([])}"), "Nested open and close should be balanced")

assert(is_balanced("(a)"), "Open and close with weird character should be balanced")
assert(is_balanced("b[]"), "Open and close with weird character should be balanced")
assert(is_balanced("{}c"), "Open and close with weird character should be balanced")

assert(is_balanced("{()}[[{}]]"), "Multiple nested open and close should be balanced")

assert(is_balanced(""), "No open and close should be balanced")
assert(is_balanced("a"), "No open and close should be balanced")
assert(is_balanced("<>"), "No open and close should be balanced")

assert(not is_balanced("["), "Single character should not be balanced")
assert(not is_balanced("{"), "Single character should not be balanced")
assert(not is_balanced("("), "Single character should not be balanced")
assert(not is_balanced("]"), "Single character should not be balanced")
assert(not is_balanced("}"), "Single character should not be balanced")
assert(not is_balanced(")"), "Single character should not be balanced")

assert(not is_balanced("))"), "Double close should not be balanced")
assert(not is_balanced("]]"), "Double close should not be balanced")
assert(not is_balanced("}}"), "Double close should not be balanced")

assert(not is_balanced("(("), "Double open should not be balanced")
assert(not is_balanced("[["), "Double open should not be balanced")
assert(not is_balanced("{{"), "Double open should not be balanced")

assert(not is_balanced("[}"), "Open and close with different symbol should not be balanced")
assert(not is_balanced("(]"), "Open and close with different symbol should not be balanced")
assert(not is_balanced("{)"), "Open and close with different symbol should not be balanced")
assert(not is_balanced("[{]}"), "Open and close with different symbol should not be balanced")
assert(not is_balanced("{(])"), "Open and close with different symbol should not be balanced")

