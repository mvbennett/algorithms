def coin_sum(coins, total)
  # table = Array.new(coins.length){0}
  # table[0] = 1

  # coins.each_with_index do |_coin, index|
  #   i = index
  #   while i < coins.length do
  #     table[i] = table[i] + table[i - index]
  #     i += 1
  #   end
  # end

  # return table[total]
  cache = {}
  find_ways = lambda do |c, t|
      key = "#{t}_#{c}"
      return cache[key] unless cache[key].nil?

      return 0 if t < 0 || (t != 0 && c.empty?)

      return 1 if c.empty? && t == 0

      left = find_ways.call(c, t - c[c.length - 1])
      popped = c.pop
      right = find_ways.call(c, t)
      c << popped

      cache[key] = left + right
      left + right
  end

  return find_ways.call(coins, total)
end

p coin_sum([2,5,3,6], 10)
p coin_sum([1,2,3], 4)
