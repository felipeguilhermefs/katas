local roman = require "roman"

assert(roman(1) == "I", "should convert with symbol I")
assert(roman(2) == "II", "should convert with symbol I")
assert(roman(3) == "III", "should convert with symbol I")

assert(roman(4) == "IV", "should convert with symbol V")
assert(roman(5) == "V", "should convert with symbol V")
assert(roman(6) == "VI", "should convert with symbol V")
assert(roman(8) == "VIII", "should convert with symbol V")

assert(roman(9) == "IX", "should convert with symbol X")
assert(roman(10) == "X", "should convert with symbol X")
assert(roman(14) == "XIV", "should convert with symbol X")
assert(roman(28) == "XXVIII", "should convert with symbol X")
assert(roman(39) == "XXXIX", "should convert with symbol X")

assert(roman(43) == "XLIII", "should convert with symbol L")
assert(roman(50) == "L", "should convert with symbol L")
assert(roman(75) == "LXXV", "should convert with symbol L")

assert(roman(93) == "XCIII", "should convert with symbol C")
assert(roman(100) == "C", "should convert with symbol C")
assert(roman(255) == "CCLV", "should convert with symbol C")
assert(roman(399) == "CCCXCIX", "should convert with symbol C")

assert(roman(403) == "CDIII", "should convert with symbol D")
assert(roman(500) == "D", "should convert with symbol D")
assert(roman(701) == "DCCI", "should convert with symbol D")

assert(roman(903) == "CMIII", "should convert with symbol M")
assert(roman(1000) == "M", "should convert with symbol M")
assert(roman(2601) == "MMDCI", "should convert with symbol M")
assert(roman(3856) == "MMMDCCCLVI", "should convert with symbol M")
assert(roman(4000) == "MMMM", "should convert with symbol M")

assert(roman(0) == "", "should be empty when less than 1")
assert(roman(-1) == "", "should be empty when less than 1")
assert(roman(-35) == "", "should be empty when less than 1")
