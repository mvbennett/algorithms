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

    return 0 if t.negative? || (t != 0 && c.empty?)

    return 1 if c.empty? && t.zero?

    left = find_ways.call(c, t - c[c.length - 1])
    popped = c.pop
    right = find_ways.call(c, t)
    c << popped

    cache[key] = left + right
    left + right
  end

  find_ways.call(coins, total)
end

# p coin_sum([2, 5, 3, 6], 10)
# p coin_sum([1, 2, 3], 4)

describe coin_sum([2, 5, 3, 6], 10) do
  context 'when given the correct coins' do
    it 'should return 5' do
      expect(coin_sum([2, 5, 3, 6], 10)).to eq(5)
    end
  end
end

describe coin_sum([1, 2, 3], 4) do
  context 'when given the correct coins' do
    it 'should return 4' do
      expect(coin_sum([1, 2, 3], 4)).to eq(4)
    end
  end
end
