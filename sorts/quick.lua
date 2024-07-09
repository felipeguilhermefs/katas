local function quicksort(arr, low, high)
	low = low or 1
	high = high or #arr

	if high - low + 1 <= 1 then
		return
	end

	local pivot = arr[high]
	local left = low
	local i = low
	while i < high do
		if arr[i] < pivot then
			local tmp = arr[left]
			arr[left] = arr[i]
			arr[i] = tmp
			left = left + 1
		end
		i = i + 1
	end

	arr[high] = arr[left]
	arr[left] = pivot

	quicksort(arr, low, left - 1)
	quicksort(arr, left + 1, high)
end

return quicksort
