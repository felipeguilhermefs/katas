local Stack = require("ff.collections.stack")

local function minstack()
	local ms = {
		items = Stack.new(),
		mins = Stack.new(),
	}

	ms.push = function(val)
		ms.items:push(val)

		local min = ms.mins:top()
		if min and min < val then
			ms.mins:push(min)
		else
			ms.mins:push(val)
		end
	end

	ms.pop = function()
		ms.items:pop()
		ms.mins:pop()
	end

	ms.top = function()
		return ms.items:top()
	end

	ms.min = function()
		return ms.mins:top()
	end

	return ms
end

return minstack
