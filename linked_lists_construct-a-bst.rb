class Node
  attr_accessor :value, :next_node, :parent, :child_1, :child_2

  def initialize(*args)
    @value = value
    @next_node = next_node
    @parent = parent
    @child_1 = child_1
    @child_2 = child_2
  end

end

class LinkedList
  attr_accessor :head

  def initialize(*args)
    @head = Node.new(args)
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

  def make_bst
    # 1. count nodes
    current = @head
    count = count_nodes

    (count/2).times do
      #build from bottom up until midpoint
      current = current.next_node
    end
    head_node = current

    while current.next_node != nil
      #build from top down
      current = current.next_node
    end



  end


  #Utility function to print the original linked list
  def return_bst
    list = []
    current_node = @head

    while current_node != nil
      node = current_node
      case node
      when @head
        node = ["HEAD - value: #{current_node.value}, next: #{current_node.next_node}, parent: #{current_node.parent.value}, child_1: #{current_node.child_1.value},child_2: #{current_node.child_2.value}"]
      else
        node = ["NODE - value: #{current_node.value}, next: #{current_node.next_node}, parent: #{current_node.parent.value}, child_1: #{current_node.child_1.value},child_2: #{current_node.child_2.value}"]
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
   l.add_last('6')
   l.add_last('7')
   l.add_last('8')
   binding.pry
end
