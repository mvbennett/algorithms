# Write an efficient algorithm that searches for a value in an M x N matrix. This matrix has the following properties:
#
# * Integers in each row are sorted from left to right
# * The first integer of each row is greater than the last integer of the previous row.
#
# ```
# Input: Matrix of Integers, Target Integer
# Output: Boolean
# ```
#
# Example
#
#### Example 1:
#
# **Input**:
#
# ```
# matrix = [
#   [1,   3,  5,  7],
#   [10, 11, 16, 20],
#   [23, 30, 34, 50]
# ]
#
# target = 3
# ```
#
# **Output**: True
#
#### Example 2:
#
# **Input**:
#
# ```
# matrix = [
#   [1,   3,  5,  7],
#   [10, 11, 16, 20],
#   [23, 30, 34, 50]
# ]
#
# target = 13
# ```
#
# **Output**: False
#

def search(matrix, target)
  # array = matrix.flatten
  # search_result = array.bsearch { |x| target <=> x }
  # search_result == target

  matrix.each do |row|
    return true unless row.bsearch { |x| target <=> x }.nil?
  end
  false
end

# puts 'expect true:'
# p search(
#   [[1, 3, 5, 7],
#    [10, 11, 16, 20],
#    [23, 30, 34, 50]], 3
# )

# puts 'expect false:'
# p search(
#   [
#     [1, 3, 5, 7],
#     [10, 11, 16, 20],
#     [23, 30, 34, 50]
#   ], 13
# )

case_one = [[1, 3, 5, 7],
            [10, 11, 16, 20],
            [23, 30, 34, 50]]

describe search(case_one, 3) do
  context 'when given a matrix with the target' do
    it 'should return true' do
      expect(search(case_one, 3)).to be_truthy
    end
  end
end

describe search(case_one, 13) do
  context 'when given a matrix that doesn`t contain the target' do
    it 'should return false' do
      expect(search(case_one, 13)).to be_falsy
    end
  end
end
