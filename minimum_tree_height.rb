# fronzen_string_literal: true

# Given an undirected graph with N vertices and is a tree-like (meaning there are no cycles, no disconnected vertices or disjoined sets).
#
# If a vertex in the given graph is selected as a root node of a tree, there is an associated height. (The height of a tree is defined as the largest number of nodes in the path from the root to a leaf)
#
# Find the values of vertices, where the associated tree’s height would be a minimum height. If there are ties for minimum, height, return all the values.
#
# There are N vertices, and vertices have values ranging from 0 to N-1
#
# Input:   Integer N denoting number of vertices
#        Array of Two-Item Integers representing edges
#
# Output: Array of Integers representing vertices with minimum height
#
# https://github.com/OutcoSF/outco-class-173/blob/main/whiteboarding/w3_d1_graphs/410_minimum_height_trees_HARD.md
#
# Time Complexity: O(V+E)
# Auxiliary Space Complexity: O(V+E)
#
# Diagram:
#
# lengths = [3,3,3,2]
#
#       (0) c, 1
#        |
#       (3)  c, 2
#      /   \
#     (1)  (2)  c, 3
#
#       (3) c, 1
#      / | \
#   (0) (1) (2) c, 2
#
# Pseudocode:
# lengths = []
# visited = []
#
# function find_length(vertex, length):
#   if vertex in visited:
#     push length - 1 to lengths
#     return
#
#   for edge in vertex:
#     if !vertex in visited:
#       find_length(edge, length + 1)
#
# for vertex in verticies:
#   find_length(vertex, 1)
#
# minimum = min(lengths)
# lengths.filter(minimum)

class Vertex
  attr_reader :value
  attr_accessor :edges

  def initialize(value)
    @value = value
    @edges = []
  end
end

class Graph
  attr_accessor :verticies

  def initialize
    @verticies = []
  end
end

def minimum_height(_n, verticies_array)
  lengths = []
  visited = []

  get_length = lambda do |vertex, length|
    return lengths << length - 1 if visited.include?(vertex)

    visited << vertex
    vertex.edges.each do |edge|
      get_length.call(edge, length + 1) unless visited.include?(edge)
    end

    visited.delete(vertex)
  end
  verticies.each do |vertex|
    get_length.call(vertex, 1)
  end
  minimum = lengths.min
  minimums = lenghts.select { |length| length == minimum }
  return minimums if minimums.length > 1

  minimum
end

p minimum_height(4, [[0, 3], [1, 3], [2, 3]])
