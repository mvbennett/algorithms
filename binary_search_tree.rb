=begin
# Given a binary tree root node, check if the tree is a valid binary search tree.
#
# Input: Node in a Binary Tree
# Output: Boolean
#
#   5
#  / \
# 2    7
#     /  \
#     4   9
#
#
# Output False
#
# Diagram:
# values = [2, 5, 4, 7, 9]
#
#     5 c
#    / \
#   2 c   7c
#       /  \
#       4 c  9
#
# in order DFS
#
# values != values.sort
#
# Pseudocode:
# make array values
# make function helper(node)
#   if node == nil:
#     return
#
#   helper(node.left)
#   push node value to Array
#   helper(node.right)
#
# return values == values.sort
#
#

Diagram 2:
helper(node, min, max)
#     5 c
#    / \
#   2 c   7c
#       /  \
#       4 c  9


# Pseudocode:
# make array values
# make function helper(node)
#   if node == nil:
#     return
#
#   if helper(node.left) > Node:
      return false
#   if helper(node.right) < node:
      return false
#   return node.value
#


=end
class Node
  attr_accessor :value, :left, :right
  def initialize(value = nil)
    @value = value
    @left = nil
    @right = nil
  end
end

def check_tree(root)
  values = []
  traverse = lambda do |node|
    return if node.nil?

    traverse.call(node.left)
    values << node.value
    traverse.call(node.right)
  end
  traverse.call(root)

  values == values.sort
end

root = Node.new(5)
root.left = Node.new(2)
root.right = Node.new(7)
root.right.right = Node.new(9)
root.right.left = Node.new(4)

puts "expect: false"

p check_tree(root)

root_two = Node.new(5)
root_two.left = Node.new(2)
root_two.right = Node.new(7)
root_two.right.right = Node.new(9)
root_two.right.left = Node.new(6)

puts "expect: true"
p check_tree(root_two)

# class BinaryTree
#   def initialize
#     @root = nil
#     @size = 0
#   end

# end
