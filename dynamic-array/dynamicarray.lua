local function dynamicArray(capacity)
	local a = {
		storage = {},
		capacity = capacity,
		size = 0,
	}

	a.get = function(index)
		return a.storage[index]
	end

	a.set = function(index, value)
		a.storage[index] = value
	end

	a.getSize = function()
		return a.size
	end

	a.getCapacity = function()
		return a.capacity
	end

	a.resize = function()
		a.capacity = a.capacity * 2

		local newStorage = {}
		for i = 1, a.size do
			newStorage[i] = a.storage[i]
		end

		a.storage = newStorage
	end

	a.pushBack = function(value)
		if a.size == a.capacity then
			a.resize()
		end

		a.storage[a.size] = value
		a.size = a.size + 1
	end

	a.popBack = function()
		if a.size > 0 then
			a.size = a.size - 1
		end

		return a.storage[a.size]
	end

	return a
end

return dynamicArray
