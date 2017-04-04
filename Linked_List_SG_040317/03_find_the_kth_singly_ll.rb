require 'pry'

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

#Finding the kth to last node

# It might be tempting to iterate through the list until we reach the end and then walk backwards k nodes.
#
# But we have a singly linked list! We can’t go backwards. What else can we do?
# What if we had the length of the list? The distance from the head to the target is n-k. We don't know the length of the list (n). But we can figure it out by iterating from the head to the tail and count the nodes!

  def find_kth_to_last_node(k)
    # STEP 1: get the length of the list
    # start at 1, not 0
    # else we'd fail to count the head node!
    list_length = 1
    current_node = @head
    # traverse the whole list,
    # counting all the nodes
    while current_node.next
        current_node = current_node.next
        list_length += 1
    end
    # STEP 2: walk to the target node
    # calculate how far to go, from the head,
    # to get to the kth to last node
    how_far_to_go = list_length - k

    current_node = @head
    counter = 0
    while counter < how_far_to_go && current_node != nil
        current_node = current_node.next
        counter += 1
    end
    return current_node
  end

  def find(value) #finding by value it's holding requires each node to have unique value. How else can we search?
    current_node = @head
    while current_node != nil
      if current_node.value == value
        return current_node
      else
        current_node = current_node.next
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

  ll = LinkedList.new(5)
  ll.add_to_end(10)
  ll.add_to_end(20)
  ll.add_to_end(30)
  ll.add_to_end(14)
  ll.add_to_end(18)
