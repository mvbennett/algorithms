class Node
  attr_accessor :next, :value

  def initialize(num)
    @value = num
    @next = nil
  end
end

class LinkedList
  attr_reader :head, :tail, :length
  attr_accessor :tail

  def initialize
    @length = 0
    @head = nil
    @tail = nil
  end

  def show_values
    array = []
    node = @head
    until node.nil?
      array << node.value
      node = node.next
    end
    array
  end

  def append(node)
    if @length.zero?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
    @length += 1
  end

  def remove_from_head
    prev = @head
    @head = @head.next
    prev.next = nil
    @length -= 1
    prev.value
  end
end

class Queue
  attr_reader :list
  def initialize
    @list = LinkedList.new
  end

  def enqueue(val)
    @list.append(Node.new(val))
  end

  def dequeue
    @list.remove_from_head
  end

  def show
    p @list.show_values
  end
end

def find_intersection(list1, list2)
  result = nil
  node1 = list1.head
  node2 = list2.head
  until node1.nil? || node2.nil?
    return result = node1 if node1 == node2

    node1 = node1.next
    node2 = node2.next
  end
  result
end

list1 = LinkedList.new
list1.append(Node.new(9))
list1.append(Node.new(8))
list1.append(Node.new(7))
list1.append(Node.new(5))
list1.append(Node.new(4))

list2 = LinkedList.new
list2.append(Node.new(1))
list2.append(Node.new(2))
list2.append(Node.new(3))
list2.append(Node.new(4))
list2.append(Node.new((5)))

node1 = Node.new(3)
node2 = Node.new(2)
node3 = Node.new(1)

list1.append(node1)
list2.append(node1)
list1.append(node2)
list2.append(node2)

puts "expected: node value 3"
p find_intersection(list1, list2)

list3 = LinkedList.new
list3.append(Node.new(9))
list3.append(Node.new(8))
list3.append(Node.new(7))
list3.append(Node.new(5))
list3.append(Node.new(4))

puts "expected: nil"
p find_intersection(list1, list3)
