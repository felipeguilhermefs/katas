lu = require "luaunit"
assertTrue = lu.assertTrue
assertFalse = lu.assertFalse

pn = require "phonenumbers"
is_consistent = pn.is_consistent

function test_empty_isConsistent()
  assertTrue(is_consistent({}))
end

function test_singleEntry_isConsistent()
  assertTrue(is_consistent({
    ["Bob"] = "91198766"
  }))
end

function test_entryPrefixesAnother_notConsistent()
  assertFalse(is_consistent({
    ["Bob"] = "91198766",
    ["Pizza"] = "876",
    ["Emergency"] = "911",
  }))
end

function test_entryIsContainedByAnother_isConsistent()
  assertTrue(is_consistent({
    ["Bob"] = "91198766",
    ["Pizza"] = "876",
  }))
end

function test_entryDuplicatesAnother_notConsistent()
  assertFalse(is_consistent({
    ["Bob"] = "91198766",
    ["Tob"] = "91198766",
  }))
end

function test_entriesHavePartiallySamePrefix_isConsistent()
  assertTrue(is_consistent({
    ["Bob"] = "91198766",
    ["Tob"] = "91198765",
  }))
end

os.exit(lu.LuaUnit.run())
