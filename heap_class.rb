class Heap
  attr_reader :array

  def initialize
    @array = []
  end

  def child_index(parent_index, bounds)
    child_i_one = 2 * parent_index + 1
    child_i_two = 2 * parent_index + 2
    return child_i_one if child_i_one >= bounds || child_i_two >= bounds || @array[child_i_one] > @array[child_i_two]

    child_i_two
  end

  def swap(index1, index2)
    @array[index1], @array[index2] = @array[index2], @array[index1]
  end

  def bubble_down(parent_index, bounds)
    child_index = child_index(parent_index, bounds)

    while child_index < bounds && @array[parent_index] < @array[child_index]
      swap(parent_index, child_index)
      parent_index = child_index
      child_index = child_index(parent_index, bounds)
    end
  end

  def heapsort
    i = @array.length - 1
    while i >= 0
      bubble_down(i, @array.length)
      i -= 1
    end

    wall = @array.length - 1
    while wall >= 0
      swap(0, wall)
      bubble_down(0, wall)
      wall -= 1
    end
    @array
  end

  def add(value)
    @array << value
    heapsort
  end
end

heap = Heap.new
nine_nums = [5, 2, 3, 9, 1, 4, 6, 8, 7]
nine_nums.each do |num|
  heap.add(num)
end
p heap.array
