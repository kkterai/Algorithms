require 'pry'
#Choosing to do a doubly linked list to enable evaluation in both directions

class Node
  attr_accessor :value, :previous, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
    @previous = nil
  end

end

class LinkedList
  attr_accessor :node, :head, :tail, :mid_1, :mid_2 #Two pointers (mid_1 and mid_2) needed to go in opposite directions.

  def initialize(value)
    @node = Node.new(value)
    @head = @node
    @tail = @node
  end

  def add_last(value)
    current = @tail
    current.next_node = Node.new(value) #adding to end
    @tail = current.next_node
    current.next_node.previous = current
  end

  def count_nodes
    current = @head
    counter = 1
    until current.next_node == nil
      current = current.next_node
      counter += 1
    end
    counter
  end

  def is_palindrome? #assuming doubly linked list
    # 1. count nodes
    current = @head
    count = count_nodes
    if count.odd?
    # 2.a if odd, ignore center
      (count/2).times do
        current = current.next_node
      end
        # - assign mid_1 to left of center node
      @mid_1 = current.previous
        # - assign mid_2 to right of center node
      @mid_2 = current.next_node
    else
    # 2.b.if even,
      (count/2-1).times do
        current = current.next_node
      end
      # - assign mid_1 to left middle node
      @mid_1 = current
      # - assign mid_2 to right middle node
      @mid_2 = current.next_node
    end
    # 3. Go opposite directions, determining equality between mid_1 and mid_2
    until @mid_1.previous == nil
      if @mid_1.value == @mid_2.value
        @mid_1 = @mid_1.previous
        @mid_2 = @mid_2.next_node
      else
        false
      end
    end
    true
    # 4. Return true or false
  end

  # l = LinkedList.new('m')
  # l.add_last('a')
  # l.add_last('d')
  # l.add_last('d')
  # l.add_last('a')
  # l.add_last('m')

end
