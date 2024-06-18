local lu = require("luaunit")
local BrowserHistory = require("browserhistory")

function Test_shouldStartAtHome()
	local bh = BrowserHistory("https://google.com")
	lu.assertEquals("https://google.com", bh.current())
end

function Test_shouldKeepLastPageVisitedAsCurrent()
	local bh = BrowserHistory("https://google.com")

	bh.visit("https://github.com")
	bh.visit("https://leetcode.io")

	lu.assertEquals("https://leetcode.io", bh.current())
end

function Test_shouldGoBackInHistory()
	local bh = BrowserHistory("https://google.com")

	bh.visit("https://github.com")
	bh.visit("https://leetcode.io")
	bh.visit("https://gmail.com")
	bh.visit("https://trello.com")

	bh.back()
	lu.assertEquals("https://gmail.com", bh.current())

	bh.back(2)
	lu.assertEquals("https://github.com", bh.current())

	bh.back(2)
	lu.assertEquals("https://google.com", bh.current())
end

function Test_shouldGoForwardInHistory()
	local bh = BrowserHistory("https://google.com")

	bh.visit("https://github.com")
	bh.visit("https://leetcode.io")
	bh.visit("https://gmail.com")
	bh.visit("https://trello.com")
	bh.back(4)

	bh.forward()
	lu.assertEquals("https://github.com", bh.current())

	bh.forward(2)
	lu.assertEquals("https://gmail.com", bh.current())

	bh.forward(2)
	lu.assertEquals("https://trello.com", bh.current())
end

function Test_shouldDropForwardHistoryAfterNewVisit()
	local bh = BrowserHistory("https://google.com")

	bh.visit("https://github.com")
	bh.visit("https://leetcode.io")
	bh.back(2)

	bh.visit("https://trello.com")
	lu.assertEquals("https://trello.com", bh.current())

	bh.forward()
	lu.assertEquals("https://trello.com", bh.current())
end

os.exit(lu.LuaUnit.run())
