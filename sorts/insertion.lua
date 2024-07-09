local function insertionsort(arr)
	for i = 1, #arr do
		local j = i
		while j > 1 do
			if arr[j] > arr[j - 1] then
				break
			end

			local tmp = arr[j]
			arr[j] = arr[j - 1]
			arr[j - 1] = tmp

			j = j - 1
		end
	end
end

return insertionsort
