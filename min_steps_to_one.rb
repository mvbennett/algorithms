CACHE = {}

def min_steps_to_one(num)
  return 0 if num == 1

  return CACHE[num].to_i if CACHE[num]

  steps = min_steps_to_one(num - 1)

  if num % 2 == 0
    div_by_2 = min_steps_to_one(num / 2)
    steps = (steps..div_by_2).min
  end

  if num % 3 == 0
    div_by_3 = min_steps_to_one(num / 3)
    steps = (steps..div_by_3).min
  end

  result = 1 + steps.to_i

  CACHE[num] = result

  return result
end

puts min_steps_to_one(100)
