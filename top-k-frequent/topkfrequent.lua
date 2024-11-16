local Comparator = require("ff.func.comparator")
local HashMap = require("ff.collections.hashmap")
local Heap = require("ff.collections.heap")

local function priorityQueue()
	local function max(a, b)
		if a.priority < b.priority then
			return Comparator.greater
		end

		if a.priority > b.priority then
			return Comparator.less
		end

		if a.value < b.value then
			return Comparator.less
		end

		if a.value > b.value then
			return Comparator.greater
		end

		return Comparator.equal
	end

	return Heap.new(max)
end

local function topkfrequent(arr, k)
	if arr == nil or #arr == 0 or k <= 0 then
		return {}
	end

	local counter = HashMap.new()
	for _, num in ipairs(arr) do
		counter:put(num, counter:get(num, 0) + 1)
	end

	local heap = priorityQueue()
	for num, count in pairs(counter._entries) do
		heap:push({ priority = count, value = num })
	end

	local res = {}
	for _ = 1, k do
		local item = heap:pop()
		if item ~= nil then
			res[#res + 1] = item.value
		end
	end
	return res
end

return topkfrequent
