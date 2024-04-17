local function get(cache, args)
  local node = cache
  for i=1, #args do
    node = node.children and node.children[args[i]]
    if not node then
      return nil
    end
  end
  return node.value
end

local function put(cache, args, value)
  local node = cache
  for i=1, #args do
    local arg = args[i]
    node.children = node.children or {}
    node.children[arg] = node.children[arg] or {}
    node = node.children[arg]
  end
  node.value = value
end

function memoize(fn, cache)
  if type(fn) ~= 'function' then
    error("Expected a function")
  end

  cache = cache or {}

  return function (...)
    local args = {...}
    local value = get(cache, args)
    if not value then
      value = fn(...)
      put(cache, args, value)
    end

    return value
  end
end

return memoize
