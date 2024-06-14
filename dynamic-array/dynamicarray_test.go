package main

import "testing"

func checkSizeAndCapacity(
	t *testing.T,
	arr *DynamicArray,
	expectedSize int,
	expectedCapacity int,
) {
	size := arr.GetSize()
	if size != expectedSize {
		t.Fatalf("Size was %d but %d is expected", size, expectedSize)
	}

	capacity := arr.GetCapacity()
	if capacity != expectedCapacity {
		t.Fatalf("Capacity was %d but %d is expected", capacity, expectedCapacity)
	}

}
func TestCase1(t *testing.T) {
	arr := NewDynamicArray(1)

	checkSizeAndCapacity(t, arr, 0, 1)
}

func TestCase2(t *testing.T) {
	arr := NewDynamicArray(1)

	arr.PushBack(1)
	checkSizeAndCapacity(t, arr, 1, 1)

	arr.PushBack(2)
	checkSizeAndCapacity(t, arr, 2, 2)
}

//"popback", "getSize", "getCapacity"]

func TestCase3(t *testing.T) {
	arr := NewDynamicArray(1)

	arr.PushBack(1)
	arr.PushBack(2)

	value := arr.Get(1)
	if value != 2 {
		t.Fatalf("Value was %d but %d was expected", value, 2)
	}

	arr.Set(1, 3)
	value = arr.Get(1)
	if value != 3 {
		t.Fatalf("Value was %d but %d was expected", value, 3)
	}

	value = arr.PopBack()
	if value != 3 {
		t.Fatalf("Value was %d but %d was expected", value, 3)
	}

	checkSizeAndCapacity(t, arr, 1, 2)
}
