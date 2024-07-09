local function bucketsort(arr)
	if #arr == 0 then
		return
	end

	local counter = {}
	local min
	local max
	for i = 1, #arr do
		if not min or arr[i] < min then
			min = arr[i]
		end

		if not max or arr[i] > max then
			max = arr[i]
		end

		counter[arr[i]] = (counter[arr[i]] or 0) + 1
	end

	local j = 1
	for i = min, max do
		while (counter[i] or 0) > 0 do
			arr[j] = i
			j = j + 1
			counter[i] = counter[i] - 1
		end
	end
end

return bucketsort
