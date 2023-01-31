# Question 2:
#
# Given the head node of a singly linked list, return the value of one of the nodes at random from the linked list.
#
# The node value that is returned must be fairly random. How can we test this out?
#
#
# Example
#        (1) -> (5) -> (7) -> (10)
#         ^
#         |
# Input: (1) head
# Output: 5
#
# // If we were to call the function on the above linked list 100 times, we would
# // expect the frequency of each node value to return approximately 25 times.
# // Should resemble:
#
# {
#   1: 25
#   5: 25
#   7: 25
#   10: 25
# }
#
#
# Constraints
#
# - Time Complexity: O(N)
# - Auxiliary Space Complexity: O(N)
#
#
# - You can only pass through the linked list once
#
#
# 1 - 5 - 7 - 15  [1, 5, 7, 15]
# sample
#
#
# Pseudocode:
# make empty Array
# traverse the list
# push each node value to Array
# return a sample from array
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
end

def random(head)
  array = []
  node = head
  until node.nil?
    array << node.value
    node = node.next
  end

  # array[rand(0...array.length)]
  array.sample
end

def test_frequency(head)
  freq = Hash.new(0)

  i = 0
  while i < 100
    val = random(head)
    freq[val] += 1
    i += 1
  end
  p freq
end

def one_pass_random(head)
  encountered = 0
  result = head.value
  node = head
  until node.nil?
    encountered += 1
    return node.value if rand(0..) < rand(0.1...1) / encountered

    node = node.next
  end
  result
end

def test_one_frequency(head)
  freq = Hash.new(0)

  i = 0
  while i < 100
    val = one_pass_random(head)
    freq[val] += 1
    i += 1
  end
  p freq
end

list = LinkedList.new
list.append(Node.new(9))
list.append(Node.new(1))
list.append(Node.new(5))
list.append(Node.new(2))
list.append(Node.new(7))

puts random(list.head)
puts one_pass_random(list.head)
# puts random(list.head)
# puts random(list.head)
test_frequency(list.head)
test_one_frequency(list.head)
