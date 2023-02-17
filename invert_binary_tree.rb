=begin
 Invert a Binary Tree
Given a binary tree root node, invert the binary tree (mirror) and return back the root node.

Input: Node in a Binary Tree
Output: Node in a Binary Tree

Input:
              (1)
            /     \
          (2)      (3)
                 /     \
                (4)    (5)


Output:
              (1)
            /     \
          (3)      (2)
         /     \
       (5)    (4)

Diagram:

placeholder: (2)----------|
                          v
              (1) c
            /     \
          (2)  <-----(3)
                 /     \
                (4)    (5)
                nil---------

swap
left
right



Pseudocode:
function helper(node):
  return if node == nil

  swap(node.left, node.right)
  helper(node.left)
  helper(node.right)


return root node
=end

# Node
class Node
  attr_accessor :value, :left, :right

  def initialize(value = nil)
    @value = value
    @left = nil
    @right = nil
  end
end

# Tree
class Tree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def invert
    traverse = lambda do |node|
      return if node.nil?

      placeholder = node.left
      node.left = node.right
      node.right = placeholder

      traverse.call(node.left)
      traverse.call(node.right)
    end
    traverse.call(@root)

    @root
  end

  def print
    print = lambda do |node|
      return if node.nil?

      puts node.value

      print.call(node.left)
      print.call(node.right)
    end
    print.call(@root)
  end
end

root = Node.new(1)
tree = Tree.new(root)
tree.root.left = Node.new(2)
tree.root.right = Node.new(3)
tree.root.right.right = Node.new(5)
tree.root.right.left = Node.new(4)

tree.print
tree.invert
puts
tree.print
