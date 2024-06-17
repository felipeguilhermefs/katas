local memoize = require("ff.memoize")

local fibonacci

fibonacci = memoize(function(num)
	if num == 0 or num == 1 then
		return 1
	end

	return fibonacci(num - 2) + fibonacci(num - 1)
end)

return fibonacci
