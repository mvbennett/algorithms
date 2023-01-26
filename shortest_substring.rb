#
# Given a string, return the shortest substring that has at least 3 unique characters, or false if there is no such string
#
# shortest string
# 3 unique chars
#
#
# Input: String
# Output: String or Boolean
# Example
# Input: aabaca => Output: bac
# Input: abaacc => Output: baac
# Input: abc => Output: abc
# Input: aabb => Output: False
#
#
# Diagram:
# dict = {a:0,b:0,c:0 }
# result = [0, inf]
#
#  l        decrement from dict and update result til a value reaches 0
#       r        until 3 unique chars
# abaaccbsfsdhfsfsmsf
#
# Pseudocode:
# dict = {a:3,b:1,c:1 }
# result = [0, inf]
#
# make left and right and dict and result variables
# while r is less than the string length r will increment
#   add to dict
#
#
#   when dict values are all positive and size > 3:
#       update result
#
#     decrement current value from dict
#     increment left
#
#

def shortest_substring(string)
  left = 0
  right = 0
  dict = Hash.new(0)
  result = [0, string.length + 1]
  distinct = 0

  while right < string.length
    distinct += 1 if dict[right].zero?
    dict[right] += 1

    p "right: #{right}"

    while distinct < 3
      result = [right, left] if left - right < result[1] - result[0]

      dict[left] -= 1
      distinct -= 1 if dict[left].zero?

      p "left: #{left}"
      left += 1 unless left == right
    end
    right += 1
  end
  string.slice(result[0]...result[1])
end

p shortest_substring('abaacc')
