local function is_divided(num, divisor)
  return num % divisor == 0
end

local function fizzbuzz(num)
  if is_divided(num, 15) then
    return "FizzBuzz"
  end

  if is_divided(num, 3) then
    return "Fizz"
  end

  if is_divided(num, 5) then
    return "Buzz"
  end

  return tostring(num)
end

return fizzbuzz

