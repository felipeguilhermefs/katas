local symbols = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"}
local weights = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1}

local function roman(num)
  local result = ""

  for i, symbol in ipairs(symbols) do
    local weight = weights[i]
    while (num >= weight) do
      result = result .. symbol
      num = num - weight
    end
  end

  return result
end

return roman
