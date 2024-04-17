local function highest_combination(base, comparable)
  local base_index = 0
  local base_char = ""

  local comp_index = 0
  local comp_char = ""

  while true do
    if base_index < #base then
      base_index = base_index + 1
      base_char = base:sub(base_index, base_index)
    end

    if comp_index < #comparable then
      comp_index = comp_index + 1
      comp_char = comparable:sub(comp_index, comp_index)
    end

    if base_char < comp_char then
      return false
    end

    if base_char > comp_char then
      return true
    end

    if base_index == #base and comp_index == #comparable then
      return false
    end
  end

end

local combinednumbers = {}

function combinednumbers.greatest(numbers)
  local nums = {}
  for _, number in ipairs(numbers) do
    table.insert(nums, tostring(number))
  end

  table.sort(nums, highest_combination)

  local result = ""
  for _, num in ipairs(nums) do
    result = result .. num
  end
  print(result)
  return result
end

return combinednumbers
