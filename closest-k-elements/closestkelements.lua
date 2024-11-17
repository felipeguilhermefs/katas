local function min(a, b)
	if a < b then
		return a
	end
	return b
end

local function max(a, b)
	if a > b then
		return a
	end
	return b
end

local function abs(n)
	if n < 0 then
		return n * -1
	end
	return n
end

local function closestK(arr, k, target)
	if arr == nil or k <= 0 then
		return {}
	end

	if #arr <= k then
		return arr
	end

	local high = #arr
	local low = 1

	while low < high do
		local mid = low + (high - low) // 2

		if arr[mid] == target then
			low = mid
			break
		end

		if arr[mid] < target then
			low = mid + 1
		else
			high = mid - 1
		end
	end

	high = min(low + k, #arr)
	low = max(low - k, 1)

	while high - low > k do
		if abs(arr[low] - target) <= abs(arr[high] - target) then
			high = high - 1
		else
			low = low + 1
		end
	end

	local res = {}
	for i = low, high - 1 do
		res[#res + 1] = arr[i]
	end
	return res
end

return closestK
