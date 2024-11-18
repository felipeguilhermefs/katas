local function threesum(nums)
	if #nums == 0 then
		return {}
	end

	table.sort(nums)
	local res = {}

	for i = 1, #nums do
		-- no duplicates
		if i > 1 and nums[i] == nums[i - 1] then
			goto continue
		end

		local target = -nums[i]
		local low, high = i + 1, #nums
		while low < high do
			local sum = nums[low] + nums[high]
			if sum == target then
				res[#res + 1] = { nums[i], nums[low], nums[high] }

				low = low + 1

				-- no duplicates
				while low < high and nums[low] == nums[low - 1] do
					low = low + 1
				end
			elseif sum < target then
				low = low + 1
			else
				high = high - 1
			end
		end
		::continue::
	end

	return res
end

return threesum
