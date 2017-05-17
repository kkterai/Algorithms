require 'pry'

class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = next_node
  end
end

class TreeNode
  attr_accessor :r_child, :l_child, :value

  def initialize(value, l_child = nil, r_child = nil)
    @value = value
  end
end

class Bst
  attr_accessor :root

  def initialize(root)
    @root = root
  end

end

class LinkedList
  attr_accessor :head

  def initialize(value)
    @head = Node.new(value)
  end

  def add_last(value)
    current = @head
    until current.next_node == nil
      current = current.next_node
    end
    current.next_node = Node.new(value)
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

  def mid_node
    current = @head
    count = count_nodes
    (count/2).times do
      current = current.next_node
    end
   current
  end

  def last_node
    current = @head
    count = count_nodes
    (count-1).times do
      current = current.next_node
    end
   current
  end
end


l = LinkedList.new('1')
l.add_last('2')
l.add_last('3')
l.add_last('4')
l.add_last('5')
l.add_last('6')
l.add_last('7')
l.add_last('8')
binding.pry
