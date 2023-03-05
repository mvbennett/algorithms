class Heap
  def initalize
    @array = []
  end

  def child_index(arr, parent_index, bounds)
    child_i_one = 2 * parent_index + 1
    child_i_two = 2 * parent_index + 2
    return child_i_one if child_i_one >= bounds || child_i_two >= bounds || arr[child_i_one] > arr[child_i_two]

    child_i_two
  end

  def swap(arr, index1, index2)
    arr[index1], arr[index2] = arr[index2], arr[index1]
  end

  def bubble_down(arr, parent_index, bounds)
    child_index = child_index(arr, parent_index, bounds)

    while child_index < bounds && arr[parent_index] < arr[child_index]
      swap(arr, parent_index, child_index)
      parent_index = child_index
      child_index = child_index(arr, parent_index, bounds)
    end
  end

  def heapsort(arr)
    i = arr.length - 1
    while i >= 0
      bubble_down(arr, i, arr.length)
      i -= 1
    end

    wall = arr.length - 1
    while wall >= 0
      swap(arr, 0, wall)
      bubble_down(arr, 0, wall)
      wall -= 1
    end
    arr
  end
end
