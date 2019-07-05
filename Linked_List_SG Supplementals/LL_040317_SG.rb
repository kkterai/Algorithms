class Node
  attr_accessor :value, :next

  def initialize(value, next_node = nil)
      @value = value
      @next = next_node
  end
end

class LinkedList

  def initialize(value)
    @head = Node.new(value)
  end

  def add_to_end(value)
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(value, nil)
  end

  def delete(value)
    current.next = @head
    if current.value = value
      @head = current.next
    else
      while (current.next != nil) && (current.next.value != value)
        current = current.next
      end
      unless current.next == nil
        current.next = current.next.next
      end
    end
  end

  def return_list
    elements = []
    current = @head
    while current.next != nil
      elements << current
      current = current.next
    end
    elements << current
  end
end
