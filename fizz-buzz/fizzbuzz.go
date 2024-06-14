package main

import "strconv"

func isDivisible(value, divisor int) bool {
	return value%divisor == 0
}

func FizzBuzz(value int) string {
	if isDivisible(value, 15) {
		return "FizzBuzz"
	}
	if isDivisible(value, 5) {
		return "Buzz"
	}
	if isDivisible(value, 3) {
		return "Fizz"
	}
	return strconv.Itoa(value)
}
