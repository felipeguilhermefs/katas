local function merge(arr, low, mid, high)
	if arr[mid] <= arr[mid + 1] then
		return
	end

	local left = low
	local right = mid + 1
	while left <= mid and right <= high do
		if arr[left] > arr[right] then
			local tmp = arr[right]

			local index = right
			while index > left do
				arr[index] = arr[index - 1]
				index = index - 1
			end

			arr[left] = tmp
			right = right + 1
			mid = mid + 1
		end
		left = left + 1
	end
end

local function mergesort(arr, low, high)
	low = low or 1
	high = high or #arr

	if high - low + 1 <= 1 then
		return
	end

	local mid = (high + low) // 2
	mergesort(arr, low, mid)
	mergesort(arr, mid + 1, high)

	merge(arr, low, mid, high)
end

return mergesort
