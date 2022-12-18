# make a method that puts all checked numbers into an array to return the indexes quickly
def two_sum(nums, target)
  checked = {}
  nums.each_with_index do |num, index|
    # We'll want the diff to quickly find the second number
      diff = target - num
      if checked[diff]
        # checked diff will go first because that was something we already found
          return [checked[diff], index]
      else
        # else we'll add the number we checked to the hash
          checked[num] = index
      end
  end
end
