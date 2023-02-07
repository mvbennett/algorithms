=begin

313 - Find 1’s in Boolean Matrix
Given a matrix with N rows and M columns where elements in the matrix can be either 1 or 0 and each row and column are sorted in ascending order, find the number of 1s.

Input: Matrix of elements with values either 0 or 1
Output: An integer which is the count of all 1’s in the matrix
Example
Input: [
        [0, 0, 0, 1],
		    [0, 0, 1, 1],
		    [0, 1, 1, 1],
		    [0, 1, 1, 1]]

Output: 9

Diagram:


       [[0, 0, 0, 1], |
		    [0, 0, 1, 1], |
		    [0, 1, 1, 1], |
		    [0, 1, 1, 1]] y
         x---------x

Input = [[]]
Output = 0

Pseudocode:
y = matrix.length - 1
x = matrix[y].length - 1
count = 0

while y >= 0:
  while x >= 0 and matrix[y][x] == 1:
    count += 1
    x -= 1

  x = matrix[0].length - 1
  y -= 1

return count
=end

# avg =
# worst n+m

def find_ones(matrix)
  y = matrix.length - 1
  x = matrix.first.length - 1
  count = 0

  while y >= 0
    while x >= 0 && matrix[y][x] == 1
      count += 1
      x -= 1
    end
      x = matrix.first.length - 1
    y -= 1
  end
  count
end

puts "expect 9:"
p find_ones([[0, 0, 0, 1],
            [0, 0, 1, 1],
            [0, 1, 1, 1],
            [0, 1, 1, 1]])

puts "expect 8:"
p find_ones([[0, 0, 0, 1],
            [0, 0, 1, 1],
            [0, 0, 1, 1],
            [0, 1, 1, 1]])
