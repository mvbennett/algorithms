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

  def depth
    queue = []
    queue << @root
    depth = 1
    until queue.empty?
      node = queue.pop
      depth += 1 unless node.left.nil? && node.right.nil?
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    depth
  end

  def print_normal
    print = lambda do |node|
      return if node.nil?

      string = node.value.to_s

      string += ">left: #{print.call(node.left)}" unless node.left.nil?
      string += ">right: #{print.call(node.right)}" unless node.right.nil?

      return string
    end
    print print.call(@root)
  end

  def print_better
    print = lambda do |node|
      return if node.nil?

      string = "     (#{node.value})     "
      if !node.left.nil? && !node.right.nil?
        string += "\n"
        string += print.call(node.left)
        string += print.call(node.right)
      elsif !node.left.nil?
        string += "\n"
        string += print.call(node.left)
      elsif !node.right.nil?
        string += "\n"
        string += print.call(node.right)
      end

      return string
    end
    print print.call(@root)
  end
end

root = Node.new(1)
tree = Tree.new(root)
tree.root.left = Node.new(2)
tree.root.right = Node.new(3)
tree.root.right.right = Node.new(5)
tree.root.right.left = Node.new(4)

tree.print_normal
puts
p tree.depth
tree.invert
puts
tree.print_normal
