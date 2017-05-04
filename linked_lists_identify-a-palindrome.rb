require 'pry'
#Choosing to do a doubly linked list to enable going in both directions (e.g. does previous.value == next.value, and so on)

class Node
  attr_accessor :value, :previous, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end

end

class LinkedList
  attr_accessor :node, :head, :tail, :mid_1, :mid_2 #Two mids needed in case of even number of elements.

  def initialize(value)
    @node = Node.new(value)
    @head = @node
    @tail = @node
  end

  def add_last(value)
    current = @tail
    current.next_node = Node.new(value) #adding to end
    @tail = current.next_node
  end
end

def is_palindrome?(linked_list) #assuming doubly linked list
  # 1. count nodes
  counter = 0
  # 2.a if odd, ignore center
    # - assign mid_1 to left of center node
    # - assign mid_2 to right of center node
  # 2.b.if even,
    # - assign mid_1 to left middle node
    # - assign mid_2 to right middle node
  # 3. Go opposite directions, determining equality between mid_1 and mid_2
  # 4. Return true or false
end

l = LinkedList.new('m')
l.add_last('a')
l.add_last('d')
l.add_last('a')
l.add_last('m')
