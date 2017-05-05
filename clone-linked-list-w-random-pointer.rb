require 'pry'

class Node
  attr_accessor :value, :next_node, :random

  def initialize(value, next_node = nil, random = nil)
    @value = value
    @next_node = next_node
    @random = random
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

  def clone
    current = @head
    temp = nil
    until current == nil
      #clone node
      temp = current.next_node
      current.next_node = Node.new(current.value) #new node random pointer == nil
      current.next_node.next_node = temp
      #adjust new node random pointer
      current.next_node.random = current.random
      #traverse to next node
      current = temp
    end
    #Separate the original and copied linked lists
    current = @head
    copy = current.next_node

    temp = copy

    while current && copy
      if copy.next_node == nil
        current.next_node = nil
        break
      else
        current.next_node = current.next_node.next_node
        copy.next_node = copy.next_node.next_node
        current = current.next_node
        copy = copy.next_node
      end
    end
    temp
  end

  #Utility function to print the linked list
  def return_list
    list = []
    current_node = @head

    while current_node != nil
      node = current_node
      case node
      when @head
        node = ["HEAD - value: #{current_node.value}, next: #{current_node.next_node}, random: #{current_node.random.value}"]
      else
        node = ["NODE - value: #{current_node.value}, next: #{current_node.next_node}, random: #{current_node.random.value}"]
      end
      list << node
      current_node = current_node.next_node
    end
    return list
  end

  #Generate singly linked list with random pointer
   l = LinkedList.new('1')
   l.add_last('2')
   l.add_last('3')
   l.add_last('4')
   l.add_last('5')

   first = l.head
   first.random = first.next_node.next_node
   first.next_node.random = first
   first.next_node.next_node.random =
                    first.next_node.next_node.next_node.next_node
   first.next_node.next_node.next_node.random =
                    first.next_node.next_node.next_node.next_node
   first.next_node.next_node.next_node.next_node.random =
                                      first.next_node
   binding.pry
end
