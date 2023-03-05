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

  def max
    @array.last
  end
end



describe 'Heap' do
  heap = Heap.new
  [5, 2, 3, 9, 1, 4, 6, 8, 7].each do |num|
    heap.add(num)
  end
  context 'When multiple numbers are added to the heap' do
    it 'should have an array that is sorted from min to max' do
      expect(heap.array).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  context 'Heap max method' do
    it 'should give the max value in the heap' do
      expect(heap.max).to eq(9)
    end
  end
end
