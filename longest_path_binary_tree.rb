=begin

Longest Path of a Binary Tree
Given a binary tree node, return the number of nodes in the longest path between the root and a leaf node

Input: Node in a Binary Tree
Output: Integer



             (1)
          /       \
        (2)       (3)
                     \
                    (4)


result = 3
             (1),1
          /       \
        (2),2      (3),2
        /   \         \
       nil   nil       (4),3
                       / \
                     nil nil

Output: 3

             (1)
          /       \
        (2)       (3)
      /             \
     (6)             (4)


Pseudocode:
create a result variable with value of 0
create a recursive helper lambda to traverse tree
check the root node's children and traverse left if possible
when both children are nil result will update to most recent depth if it's more than the previous greatest depth


result = 0
function helper(node, depth):

  if no children and depth > result:
    result = depth

  helper(node.left_child, depth + 1) if node.left_child != nil
  helper(node.right_child, depth + 1) if node.right_child != nil


return result
=end


class Node
  attr_accessor :value, :left, :right
  def initialize(value = nil)
    @value = value
    @left = nil
    @right = nil
  end
end

def longest_path(root)
  result = 0

  traverse = lambda do |node, depth|
    return result = depth if node.left.nil? && node.right.nil? && depth > result

    traverse.call(node.left, depth + 1) unless node.left.nil?
    traverse.call(node.right, depth + 1) unless node.right.nil?
  end
  traverse.call(root, 1)

  result
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.right.right = Node.new(4)
root.right.right.right = Node.new(5)

p longest_path(root)

# class BinaryTree
#   def initialize
#     @root = nil
#     @size = 0
#   end


# end
