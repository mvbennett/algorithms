# CACHE = {}

# def min_steps_to_one(num)
#   return 0 if num == 1

#   return CACHE[num].to_i if CACHE[num]

#   steps = min_steps_to_one(num - 1)

#   if num % 2 == 0
#     div_by_2 = min_steps_to_one(num / 2)
#     steps = (steps..div_by_2).min
#   end

#   if num % 3 == 0
#     div_by_3 = min_steps_to_one(num / 3)
#     steps = (steps..div_by_3).min
#   end

#   result = 1 + steps.to_i

#   CACHE[num] = result

#   return result
# end

# puts min_steps_to_one(100)
def min_steps_to_one(n)
  tab = Array.new(n + 1)

  tab[1] = 0

  i = 2

  while i <= n
    steps = tab[i-1].to_i

    if i % 2 == 0
      div_by_2 = tab[i / 2]
      steps = (steps.to_i..div_by_2.to_i).min
    end

    if i % 3 == 0
      div_by_3 = tab[i / 3]
      steps = (steps.to_i..div_by_3.to_i).min
    end

    result = steps.to_i + 1

    tab[i] = result
    i += 1
  end

  p tab[n]
end
