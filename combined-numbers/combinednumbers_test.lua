local cn = require "combinednumbers"
local greatest = cn.greatest

assert(greatest({1}) == "1", "single element should return itself")

assert(greatest({8, 2, 1, 9}) == "9821", "multiple elements with single digit")

assert(greatest({53, 2, 10, 9}) == "953210", "multiple elements 1 or 2 digits")

assert(greatest({50, 5, 56}) == "56550", "multiple elements 2 digits")

assert(greatest({420, 42, 423, 4}) == "442342420", "multiple elements multiple digits")

assert(greatest({6, 6, 6}) == "666", "repeated elements")

assert(greatest({7, 77, 777}) == "777777", "multiple elements same digit")
