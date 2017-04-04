class Node
  attr_accessor :value, :next

  def initialize(value, next_node = nil)
    @value = value
    @next = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize(value)
    @head = Node.new(value)
    @head.next = nil
  end

  def add_to_end(value)
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(value, nil)
  end

  def delete(value)
    current = @head
    if current.value == value
      @head = current.next
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

  def find_kth_to_last_node(k)
    list_length = 1
    current_node = @head
    while current_node.next
      current_node = current_node.next
      list_length += 1
    end
    how_far_to_go = list_length - k

    current_node = @head
    counter = 0
    while counter < how_far_to_go && current_node != nil
        current_node = current_node.next
        counter += 1
    end
    return current_node
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

  def return_list
    list = []
    current_node = @head

    while current_node != nil
      node = current_node
      case node
      when @head
        node = ["HEAD - value: #{current_node.value}, next: #{current_node.next}"]
      else
        node = ["NODE - value: #{current_node.value}, next: #{current_node.next}"]
      end
      list << node
      current_node = current_node.next
    end
    return list
  end
end

  ll = LinkedList.new(5)
  ll.add_to_end(10)
  ll.add_to_end(20)
  ll.add_to_end(30)
  ll.add_to_end(14)
  ll.add_to_end(18)
