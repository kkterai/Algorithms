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

  def delete(value)
      current = @head
      if current.value == value
          # If the head is the element to be delete, the head needs to be updated
          @head = current.next #assumes that there is a next node
      else
          current = @head
          while (current != nil) && (current.next != nil) && ((current.next).value != value)
              current = current.next
          end

          if (current != nil) && (current.next != nil)
              current.next = (current.next).next
          end
      end
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
