package main

type DynamicArray struct {
	size     int
	capacity int
	storage  []int
}

func (da *DynamicArray) Get(index int) int {
	return da.storage[index]
}

func (da *DynamicArray) Set(index, value int) {
	da.storage[index] = value
}

func (da *DynamicArray) GetSize() int {
	return da.size
}

func (da *DynamicArray) GetCapacity() int {
	return da.capacity
}

func (da *DynamicArray) PushBack(value int) {
	if da.size == da.capacity {
		da.Resize()
	}
	da.storage[da.size] = value
	da.size++
}

func (da *DynamicArray) PopBack() int {
	if da.size > 0 {
		da.size--
	}
	return da.storage[da.size]
}

func (da *DynamicArray) Resize() {
	da.capacity *= 2
	newStorage := make([]int, da.capacity)

	for i := 0; i < da.size; i++ {
		newStorage = append(newStorage, da.storage[i])
	}

	da.storage = newStorage
}

func NewDynamicArray(capacity int) *DynamicArray {
	return &DynamicArray{
		size:     0,
		capacity: capacity,
		storage:  make([]int, capacity),
	}
}
