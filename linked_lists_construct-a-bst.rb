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
    if count.odd?
    # 2.a if odd
      (count/2).times do
        current = current.next_node
      end
      @head = current
    else
    # 2.b.if even,
      (count/2-1).times do
        current = current.next_node
      end
      @head = current
    end

  end


  #Utility function to print the original linked list
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
   l.add_last('6')
   l.add_last('7')
   l.add_last('8')
   binding.pry
end
