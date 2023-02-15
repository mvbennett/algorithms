def distance(x, y)
  Math.sqrt(x**2 + y**2)
end

def closest_steakhouses(coordinates, limit)
  distances = {}
  coordinates.each_index do |index|
    distances[index] = distance(coordinates[index][0], coordinates[index][1])
  end
  sorted = distances.sort_by do |index, value|
    value
  end
  indexes = sorted.to_h.keys.first(limit)
  result = []
  indexes.each do |index|
    result << coordinates[index]
  end
  result
end





p closest_steakhouses([[1,-1],[3,4], [2,5],[1,2]], 2)
