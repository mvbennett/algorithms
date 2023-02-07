# frozen_string_literal: true

# 311 - Graph is a Tree ..?
# Given an undirected graph in an adjacency list format (a map of every vertex to a list of all its neighboring vertices), determine whether or not said graph is a tree.

# Input: Undirected Graph as an Adjacency List (Map<int, int[]>)
# Output: Boolean
# Example
# Input:
#  {
#    0 : [1, 2, 3],
#    1 : [0],
#    2 : [0],
#    3 : [0, 4],
#    4 : [3]
#  }

# => TRUE

# Input:
#  {
#    0 : [1, 2, 3],
#    1 : [0, 2],
#    2 : [0, 1],
#    3 : [0, 4],
#    4 : [3]
#  }
#  => False

#  Diagram:

#  visited = []

# 1-------0-------3
#       /        |
#     /          |
#   2            4

#   1-------0-------3
#   |    /          |
#   |  /            |
#   2               4

# DFS
# Pseudocode:

# vertex = first key
# visited = []
# function traverse(vertex, parent):
#   if vertex in visited:
#     return false

#   vertex.edges.each(edge):
#     if !parent:
#       traverse(edge, vertex)

#   return

# Vertex class
class Vertex
  attr_reader :value
  attr_accessor :edges

  def initialize(value)
    @value = value
    @edges = []
  end
end

# Graph class
class Graph
  attr_accessor :verticies

  def initialize
    @verticies = []
  end
end

def check_tree(graph, visited = [], result: true)
  root = graph.keys.first

  traverse = lambda do |vertex, parent|
    return result = false if visited.include?(vertex)

    visited << vertex

    graph[vertex].each do |edge|
      traverse.call(edge.to_sym, vertex) unless edge == parent.to_s
    end
  end
  traverse.call(root, '')
  result
end

# puts 'expect: true'
# p check_tree(
#   {
#     '0': ['1', '2', '3'],
#     '1': ['0'],
#     '2': ['0'],
#     '3': ['0', '4'],
#     '4': ['3']
#   }
# )

# puts 'expect: false'
# p check_tree(
#   {
#     '0': ['1', '2', '3'],
#     '1': ['0', '2'],
#     '2': ['0', '1'],
#     '3': ['0', '4'],
#     '4': ['3']
#   }
# )

true_one = {
  '0': ['1', '2', '3'],
  '1': ['0'],
  '2': ['0'],
  '3': ['0', '4'],
  '4': ['3']
}

false_one = {
  '0': ['1', '2', '3'],
  '1': ['0', '2'],
  '2': ['0', '1'],
  '3': ['0', '4'],
  '4': ['3']
}

describe check_tree(true_one) do
  context 'when given a correct tree' do
    it 'should return true' do
      expect(check_tree(true_one)).to be_truthy
    end
  end
end

describe check_tree(false_one) do
  context 'when given an incorrect tree' do
    it 'should return false' do
      expect(check_tree(false_one)).to be_falsy
    end
  end
end

# Thanks!!! :)
# oh, looks like it didn't work, I'll try after class
#  yup your method is in the right way, check the solution on github.
# the only feedback i have is that i have noticed that you say too many sorry(s) and it might make the interviwer get the first impression you might not be able to slove the solution before they see your coding ability.
# I see, thanks so much! Yeah I know that habit is really bad to have in the corporate world
