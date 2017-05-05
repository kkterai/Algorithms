require 'pry'

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end

end

class LinkedList
  attr_accessor :head, :random

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

  def add_last_random(value)
    current = @head
    until current.next_node == nil
      current = current.next_node
    end
    current.next_node = Node.new(value)
    @random = @head.next_node.next_node
  end

  def clone
    current = @head
    until current.next_node.next_node == nil
      new_node = Node.new(current.value)
      new_node.next_node = current.next_node
      new_node.random
  end
end
