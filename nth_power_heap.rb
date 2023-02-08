
class MinHeap
  attr_reader :elements

  def initialize
    @elements = []
  end

  def push(element)
    @elements << element
    bubble_up(@elements.size - 1)
  end

  def pop
    return nil if @elements.empty?

    # Swap the first and last elements
    @elements[0], @elements[-1] = @elements[-1], @elements[0]

    # Pop the last element (which is now the minimum)
    min_element = @elements.pop

    # Restore the min heap property
    bubble_down(0)

    min_element
  end

  private

  def parent_index(index)
    (index - 1) / 2
  end

  def left_child_index(index)
    2 * index + 1
  end

  def right_child_index(index)
    2 * index + 2
  end

  def bubble_up(index)
    parent = parent_index(index)
    return if parent < 0

    if @elements[index] < @elements[parent]
      @elements[index], @elements[parent] = @elements[parent], @elements[index]
      bubble_up(parent)
    end
  end

  def bubble_down(index)
    left_child = left_child_index(index)
    right_child = right_child_index(index)
    smallest = index

    smallest = left_child if left_child < @elements.size && @elements[left_child] < @elements[index]

    smallest = right_child if right_child < @elements.size && @elements[right_child] < @elements[smallest]

    if smallest != index
      @elements[index], @elements[smallest] = @elements[smallest], @elements[index]
      bubble_down(smallest)
    end
  end
end

def get_all_powers(n)
  powers = []
  i = 2
  while i <= n
    powers << i**2
    i += 1
  end
  max_power = powers.last
  # puts "max power #{max_power}"
  i = 2
  max_base = n
  while i < n && i**3 < max_power
    powers << i**3
    i += 1
  end
  max_base = i - 1

  e = 4
  max_exp = 1.0 / 0
  while 2**e < max_power
    powers << 2**e
    e += 1
  end
  max_exp = e - 1

  e = 4
  i = 3
  while e < max_exp && i**e < max_power
    while i < max_base && i**e < max_power
      powers << i**e
      i += 1
    end
    max_base = i - 1
    e += 1
  end
  max_exp = e - 1
  powers.uniq
end

def power_numbers(n)
  heap = MinHeap.new
  all = get_all_powers(n)
  all.each do |num|
    heap.push(num)
  end

  power_numbers = []
  n.times do
    power_numbers << heap.pop
  end
  power_numbers
end

# p power_numbers(20)
# p power_numbers(10)
# p power_numbers(30)
# [4, 8, 9, 16, 25, 27, 32, 36, 49, 64, 81, 100, 121, 125, 128, 144, 169, 196, 216, 225, 256, 289, 324, 343, 361, 400, 441, 484, 512, 529]

describe 'nth_power_heap' do
  context 'with a value of 10' do
    it 'should return 10 power numbers' do
      expect(power_numbers(10)).to eq([4, 8, 9, 16, 25, 27, 32, 36, 49, 64])
    end
  end

  context 'with a value of 20' do
    it 'should return 20 power numbers' do
      expect(power_numbers(20)).to eq([4, 8, 9, 16, 25, 27, 32, 36, 49, 64, 81, 100, 121, 125, 128, 144, 169, 196, 216, 225])
    end
  end

  context 'with a value of 30' do
    it 'should return 30 power numbers' do
      expect(power_numbers(30)).to eq([4, 8, 9, 16, 25, 27, 32, 36, 49, 64, 81, 100, 121, 125, 128, 144, 169, 196, 216, 225, 256, 289, 324, 343, 361, 400, 441, 484, 512, 529])
    end
  end
end
