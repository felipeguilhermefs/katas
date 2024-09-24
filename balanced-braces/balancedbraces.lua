local Stack = require("ff.stack")

local symbols = {
	["("] = ")",
	["["] = "]",
	["{"] = "}",
}

symbols.to_closing = function(char)
	return symbols[char]
end

symbols.is_close = function(char)
	for _, c in pairs(symbols) do
		if char == c then
			return true
		end
	end
	return false
end

local balancedbraces = {}

function balancedbraces.is_balanced(input)
	local expected = Stack.new()

	for char in input:gmatch(".") do
		local closing = symbols.to_closing(char)
		if closing then
			expected:push(closing)
		end

		if symbols.is_close(char) then
			if expected:pop() ~= char then
				return false
			end
		end
	end

	return expected:empty()
end

return balancedbraces
