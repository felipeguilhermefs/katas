local min = require("ff.min")
local max = require("ff.max")

local function bucketsort(arr)
	if #arr == 0 then
		return
	end

	local low = min(table.unpack(arr))
	local high = max(table.unpack(arr))

	local counter = {}
	for i = 1, #arr do
		counter[arr[i]] = (counter[arr[i]] or 0) + 1
	end

	local j = 1
	for i = low, high do
		while (counter[i] or 0) > 0 do
			arr[j] = i
			j = j + 1
			counter[i] = counter[i] - 1
		end
	end
end

return bucketsort
