package main

import "testing"

func TestMultipleOf3(t *testing.T) {
	values := [6]int{3, 6, 9, 12, 21, 99}
	for _, val := range values {
		res := FizzBuzz(val)
		if "Fizz" != res {
			t.Fatalf("Should be Fizz and was %s", res)
		}
	}
}

func TestMultipleOf5(t *testing.T) {
	values := [6]int{5, 10, 20, 25, 65, 100}
	for _, val := range values {
		res := FizzBuzz(val)
		if "Buzz" != res {
			t.Fatalf("Should be Buzz and was %s", res)
		}
	}
}

func TestMultipleOf3And5(t *testing.T) {
	values := [6]int{15, 30, 45, 60, 120, 150}
	for _, val := range values {
		res := FizzBuzz(val)
		if "FizzBuzz" != res {
			t.Fatalf("Should be FizzBuzz and was %s", res)
		}
	}
}

func TestNonMultiplOf3Or5(t *testing.T) {
	values := [6]int{1, 2, 7, 13, 26, 76}
	expected := [6]string{"1", "2", "7", "13", "26", "76"}
	for i, val := range values {
		res := FizzBuzz(val)
		exp := expected[i]
		if exp != res {
			t.Fatalf("Should be %s and was %s", exp, res)
		}
	}
}
