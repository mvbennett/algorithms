# frozen_string_literal: true

def distance(x, y)
  Math.sqrt(x**2 + y**2)
end

def calculate_distances(coordinates)
  distances = {}
  coordinates.each_index do |index|
    distances[index] = distance(coordinates[index][0], coordinates[index][1])
  end
  distances
end

def sort_keys_by_values(distances)
  sorted = distances.sort_by do |_index, value|
    value
  end
  sorted.to_h.keys
end

def fetch_coordinates(coordinates, indexes)
  fetched = []
  indexes.each do |index|
    fetched << coordinates[index]
  end
  fetched
end

def closest_steakhouses(coordinates, limit)
  distances = calculate_distances(coordinates)
  indexes = sort_keys_by_values(distances).first(limit)
  fetch_coordinates(coordinates, indexes)
end

p closest_steakhouses([[1, -1], [3, 4], [2, 5], [1, 2]], 2)
