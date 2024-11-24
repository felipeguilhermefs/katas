local function max(a, b)
	if a > b then
		return a
	end
	return b
end

local function min(a, b)
	if a < b then
		return a
	end
	return b
end

local function minBuses(routes, source, target)
	if source == target then
		return 0
	end

	local maxStop = -1
	for _, route in pairs(routes) do
		for _, stop in pairs(route) do
			maxStop = max(maxStop, stop)
		end
	end

	if target > maxStop or source > maxStop then
		return -1
	end

	local infinity = #routes + 1

	local minToStop = {}
	for i = 1, maxStop do
		minToStop[#minToStop + 1] = infinity
	end

	minToStop[source] = 0
	local hadChanges = true
	while hadChanges do
		hadChanges = false
		for _, route in pairs(routes) do
			local leastBuses = infinity
			for _, stop in pairs(route) do
				leastBuses = min(leastBuses, minToStop[stop])
			end

			leastBuses = leastBuses + 1

			for _, stop in pairs(route) do
				if minToStop[stop] > leastBuses then
					minToStop[stop] = leastBuses
					hadChanges = true
				end
			end
		end
	end

	local result = minToStop[target]
	if result < infinity then
		return result
	end
	return -1
end

return minBuses
