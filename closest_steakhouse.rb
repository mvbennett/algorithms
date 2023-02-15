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

describe 'Closest Steakhouse' do
  context 'When finding two closest steakhouses' do
    it 'should return the coordinates of the two closest' do
      expect(closest_steakhouses([[1, -1], [3, 4], [2, 5], [1, 2]], 2)).to eq([[1, -1], [1, 2]])
    end
  end
end

describe 'Closest Steakhouse' do
  context 'When finding three closest steakhouses' do
    it 'should return the coordinates of the three closest' do
      expect(closest_steakhouses([[1, -1], [3, 4], [2, 5], [1, 2]], 3)).to eq([[1, -1], [1, 2], [3, 4]])
    end
  end
end

describe 'Closest Steakhouse' do
  context 'When given two steakhouses with the same amount of distance' do
    it 'should return the coordinates of the one whose hypotenuse is smaller' do
      expect(closest_steakhouses([[0, 10], [5, 5]], 1)).to eq([[5, 5]])
    end
  end
end
