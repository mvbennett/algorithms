#
# Linked List to Queue
# Implement a Linked List data structure with addToTail and removeFromHead methods.
#
# Then use that Linked List data structure to implement a Queue data structure with enqueue and dequeue methods.
#
# No input or output cases. Instead, upon implementation of the Linked List, and
# then Queue class, you should be able to run the following commands.
#
#
# ll = instance of Linked List class.
#
# ll.addToTail(1)
# ll.addToTail(5)
# ll.addToTail(7)
# ll.addToTail(10)
#
# print out ll.removeFromhead() => 1
# print out ll.removeFromhead() => 5
# print out ll.removeFromhead() => 7
# print out ll.removeFromhead() => 10
#
# Same thing should be accomplished with the Queue as well
#
#
# q = instance of Queue class.
#
# ll = {}
#
# q.enqueue(1)
#
# ll = {1,}
# q.enqueue(5)
# ll = {1,5}
# q.enqueue(7)
# ll = {1,5,7}
# q.enqueue(10)
#
# ll = {1,5,7,10}
# print out q.dequeue() => 1
# ll = {5,7,10}
# print out q.dequeue() => 5
# ll = {7,10}
# print out q.dequeue() => 7
# print out q.dequeue() => 10
#
# Time Complexity: addToTail - O(1)
#                  removeFromHead - O(1)
#                  enqueue - O(1)
#                  dequeue - O(1)
#
# Auxiliary Space Complexity: O(N) <-- refers to how many elements are in the
# linked list or queue at any given time
#
# Diagram:
# p
#     h
# 1 - 5 -7 - 10
#
#
# Pseudocode:
#
# make previous placeholder for head
# next node from head becomes the new head
# previous head severs the next connection
#

class Node
  attr_accessor :next, :value

  def initialize(num)
    @value = num
    @next = nil
  end
end

class LinkedList
  attr_reader :head, :tail, :length

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

# list = LinkedList.new
# list.append(Node.new(1))
# list.append(Node.new(5))
# list.append(Node.new(7))
# list.append(Node.new(10))

# p "before removal"
# p list
# p list.remove_from_head
# puts
# p "after removal"
# p list
# p list.remove_from_head
# puts
# p "after removal"
# p list

queue = Queue.new
queue.enqueue(1)
queue.enqueue(5)
queue.enqueue(7)
queue.enqueue(10)

p queue.show

p queue.dequeue

puts
p "after - [5,7,10]"
p queue.show




# [1,5,7,10]
