#
#
#
# You are given the root of a binary tree containing digits from 0 to 9 only.
#
# Each root-to-leaf path in the tree represents a number.
#
# For example, the root-to-leaf path 1 -> 2 -> 3 represents the number 123.
# Return the total sum of all root-to-leaf numbers. Test cases are generated so that the answer will fit in a 32-bit integer.
#
#
#
#
# Ex:
#           1
#         2   3
#
# Input: root = [1,2,3]
# Output: 25
# The root-to-leaf path 1->2 represents the number 12.
# The root-to-leaf path 1->3 represents the number 13.
# Therefore, sum = 12 + 13 = 25.
#
#
# Ex2:
#             4
#           9    0
#         5   1
# Input: root = [4,9,0,5,1]
# Output: 1026
#
# The root-to-leaf path 4->9->5 represents the number 495.
# The root-to-leaf path 4->9->1 represents the number 491.
# The root-to-leaf path 4->0 represents the number 40.
# Therefore, sum = 495 + 491 + 40 = 1026.
#
# Diagram:
#
# action (add number to string)
# left
# right
#
# total = 0
#
# nnumber_string = '495'
#             4 ((4), '4')
#           9 ((9), '49')
#         5 ((5), '495')
#       nil '495' -> 495 + total
#
# Pseudocode:
# total = 0
# make helper function(node, string)
# if node is nil, change string to number and add to total
#
# call left node
# call right node
#
# return total
#
# def sum_paths(root)
#   total = 0
#
#   make_string = lambda do |node, string|
#     return string.to_i += total if node.nil?
#
#     string += node.value.to_s
#     make_string.call(node.left, string)
#     make_string.call(node.right, string)
#   end
#   make_string.call(root, '')
# end
#
#
# def sum_numbers(root)
#     return 0 if root.nil?
#
#     @sum = 0
#     build_number("", root)
#     @sum
# end
#
# def build_number(current, root)
#     current_number = "#{current}#{root.val}"
#
#     if root.left.nil? && root.right.nil?
#         @sum += current_number.to_i
#         return
#     end
#
#     build_number(current_number, root.left) if root.left
#     build_number(current_number, root.right) if root.right
# end

class Node
  attr_accessor :value, :left, :right
  def initialize(value = nil)
    @value = value
    @left = nil
    @right = nil
  end
end

def sum_paths(root)
  total = 0

  make_string = lambda do |node, string|
    return total += string.to_i if node.nil?

    string += node.value.to_s
    make_string.call(node.left, string)
    make_string.call(node.right, string)
  end
  make_string.call(root, '')
  total / 2
end

# tests
root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.right.right = Node.new(5)
root.right.left = Node.new(4)

p sum_paths(root)
