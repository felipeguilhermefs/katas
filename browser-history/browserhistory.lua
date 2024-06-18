local function Page(url, prev, next)
	return {
		url = url,
		prev = prev,
		next = next,
	}
end

local function BrowserHistory(homepage)
	local bh = {
		page = Page(homepage),
	}

	bh.current = function()
		return bh.page.url
	end

	bh.visit = function(url)
		local newPage = Page(url, bh.page)
		bh.page.next = newPage
		bh.page = newPage
	end

	bh.back = function(steps)
		steps = steps or 1
		for _ = 1, steps do
			if bh.page.prev then
				bh.page = bh.page.prev
			else
				return
			end
		end
	end

	bh.forward = function(steps)
		steps = steps or 1
		for _ = 1, steps do
			if bh.page.next then
				bh.page = bh.page.next
			else
				return
			end
		end
	end

	return bh
end

return BrowserHistory
