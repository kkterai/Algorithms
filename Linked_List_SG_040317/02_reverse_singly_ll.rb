class Node
  attr_accessor :value, :next #, :prev - used if implementing a doubly linked list.

  def initialize(value, next_node = nil)
    @value = value
    @next = next_node
  end
end

class LinkedList
  attr_accessor :head, :tail

  def initialize(value)
    @head = Node.new(value)
    @head.next = nil
    @tail = @head
  end

  def add_to_end(value)
    @tail.next = Node.new(value)
    @tail = @tail.next
    @tail.next = nil
  end

  def reverse(list)
    return nil if list.nil?
    previous = nil
    current = list.head
    while(current != nil)
      temp = current.next
      current.next = previous
      previous = current
      current = temp
    end
    list.head = previous
    list
  end

  def display_values(list)
      return nil if list.nil?
      current = list.head
      arr = []
      while(current != nil)
        arr.push(current.value)
        current = current.next
      end
      p arr
    end
  end
