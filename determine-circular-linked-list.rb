require 'pry'

#A circular linked list is a linked list where all nodes are connected to form a circle. There is no NULL at the end. A circular linked list can be a singly circular linked list or doubly circular linked list.

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end

end

class LinkedList
  attr_accessor :node, :head

  def initialize(value)
    @node = Node.new(value)
    @head = @node
  end

  def add_last(value)
    current = @head
    until current.next_node == nil
      current = current.next_node
    end
    current.next_node = Node.new(value)
  end

  def make_circular
    current = @head
    until current.next_node == nil
      current = current.next_node
    end
    current.next_node = @head
  end

  def is_circular?
    start = @head
    current = @head
    until current.next_node == start || current.next_node == nil
      current = current.next_node
    end
    if current.next_node == start
      "This is a circular linked list"
    else
      "This is not a circular linked list"
    end
  end

  l = LinkedList.new('m')
  l.add_last('a')
  l.add_last('d')
  l.add_last('d')
  l.add_last('a')
  l.add_last('m')
  binding.pry
end
