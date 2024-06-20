local Queue = require("ff.queue")

local function Stack()
	local s = {
		pivot = Queue(),
		backup = Queue(),
	}

	s.empty = function()
		return s.pivot.empty()
	end

	s.push = function(value)
		s.backup.enqueue(value)
		while not s.pivot.empty() do
			s.backup.enqueue(s.pivot.dequeue())
		end

		local swap = s.pivot
		s.pivot = s.backup
		s.backup = swap
	end

	s.pop = function()
		return s.pivot.dequeue()
	end

	return s
end

return Stack
