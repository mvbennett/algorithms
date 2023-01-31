=begin
Given the head node of a singly linked list, return true if the values of the
linked list forms a palindrome.

```javascript
       (1) -> (2) -> (3) -> (3) -> (2) -> (1)
        ^
        |
Input: (1)
Output: True


       (1) -> (2) -> (4) -> (2) -> (1)
        ^
        |
Input: (1)
Output: True



       (5) -> (8) -> (4) -> (1) -> (7)
        ^
        |
Input: (5)
Output: False



Psuedocode:

traverse linked list
push each value to an Array
make variables i and j for beginning and end of array
check if i's value and j's value are the same until i passes j

if i isnt the same as j, return false

=end

class Node
  attr_accessor :next, :value

  def initialize(num)
    @value = num
    @next = nil
  end
end

class LinkedList
  attr_accessor :head, :tail, :length

  def initialize
    @length = 0
    @head = nil
    @tail = nil
  end
end

def check_palindrome(list)
  array = []
  node = list.head
  until node.nil?
    array << node.value
    node = node.next
  end

  i = 0
  j = array.length - 1
  while i < j
    return false if array[i] != array[j]

    i += 1
    j -= 1
  end
  return true
end

list = LinkedList.new
list.head = Node.new(9)
list.head.next = Node.new(1)
list.head.next.next = Node.new(5)
list.head.next.next.next = Node.new(1)
list.head.next.next.next.next = Node.new(9)

p check_palindrome(list)

list_two = LinkedList.new
list_two.head = Node.new(9)
list_two.head.next = Node.new(1)
list_two.head.next.next = Node.new(5)
list_two.head.next.next.next = Node.new(1)

p check_palindrome(list_two)
