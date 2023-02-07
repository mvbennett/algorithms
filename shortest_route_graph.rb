#
#
# Pseudocode:
# result = 0
# visited = {}
# function calculate_route(vertex, distance):
#   if vertex == nil:
#     return
#
#   if vertex == destination:
#     return max(distance, result)
#
#   vertex.edges.each:
#     if !visited[edge]:
#       calculate_route(edge)
#
#   visited.delete(vertex)

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

def shortest_route(_graph, start, destination)
  visited = []
  queue = [start]
  layer = 0

  until queue.nil?
    current = queue.shift
    return if current == destination

    visited << current
    current.edges.each do |edge|
      queue << egde unless visited.include?(edge)
    end
    layer += 1
  end
  layer
end
