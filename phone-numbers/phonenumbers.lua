local head = require "head"
local tail = require "tail"
local empty = require "empty"
local getinsert = require "getinsert"

local tree = {}

function tree.new(value)
  return {
    value = value,
    branches = {},
    is_word = false
  }
end


local walker = {}

function walker.new()
  local w = { trees = {} }

  w.is_consistent = function (current, text)
    if current.is_word then
      return false
    end

    if empty(text) then
      current.is_word = true
      return empty(current.branches)
    end

    local digit = head(text)
    local branch = getinsert(current.branches, digit, tree.new)

    return w.is_consistent(branch, tail(text))
  end

  return w
end


local phonenumbers = {}

function phonenumbers.is_consistent(phone_numbers)
  local w = walker.new()
  for _, phone_number in pairs(phone_numbers) do
    local root = head(phone_number)
    local tree = getinsert(w.trees, root, tree.new)

    if not w.is_consistent(tree, tail(phone_number)) then
      return false
    end
  end

  return true
end

return phonenumbers
