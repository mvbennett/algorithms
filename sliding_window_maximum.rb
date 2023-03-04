=begin
Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
Output: [3,3,5,5,6,7]
Explanation:
Window position                Max
---------------               -----
[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7




=end

def max_sliding_window(nums, k)
  start = 0
  maxes = []
  while (start + k) <= nums.length
    maxes << nums.slice(start, k).max
    start += 1
  end
  maxes
end


describe 'Max Sliding Window' do
  context 'When given an array and a smaller k value' do
    it 'should return an array of maximum values' do
      expect(max_sliding_window([1,3,-1,-3,5,3,6,7], 3)).to eq([3,3,5,5,6,7])
    end
  end
end
