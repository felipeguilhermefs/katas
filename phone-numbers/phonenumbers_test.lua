local pn = require "phonenumbers"
local is_consistent = pn.is_consistent

assert(is_consistent({}), "empty should be consistent")

assert(is_consistent({
  ["Bob"] = "91198766"
}), "single entry should be consistent")


assert(not is_consistent({
  ["Bob"] = "91198766",
  ["Pizza"] = "876",
  ["Emergency"] = "911",
}), "when entry prefixes another should be inconsistent")

assert(is_consistent({
  ["Bob"] = "91198766",
  ["Pizza"] = "876",
}), "when entry is contained by another should be consistent")

assert(not is_consistent({
  ["Bob"] = "91198766",
  ["Tob"] = "91198766",
}), "when entry duplicates another should be inconsistent")

assert(is_consistent({
  ["Bob"] = "91198766",
  ["Tob"] = "91198765",
}), "when entries have have partially the same prefix should be consistent")
