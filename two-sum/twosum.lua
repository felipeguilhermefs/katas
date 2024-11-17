local function twosum(nums, target)
	if #nums == 0 then
		return {}
	end

	local comp = {}
	for index, num in pairs(nums) do
		local diff = target - num
		local prev = comp[diff]
		if prev ~= nil then
			return { prev, index }
		end
		comp[num] = index
	end

	return {}
end

return twosum
