require 'pry'

class Node
  attr_accessor :value, :next_node, :l_child, :r_child

  def initialize(value)
    @value = value
    @next_node = next_node
    @l_child = l_child
    @r_child = r_child
  end
end

class LinkedList
  attr_accessor :head, :root

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

  #Methods below, 'count_nodes', 'mid_node', and 'last_node' called on linked list.

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

  #Methods below - 'count', 'find_mid', and 'find_last') called w/in 'make_bst' method.

  def count(start,last)
    current = start
    counter = 1
    until current == last
      current = current.next_node
      counter += 1
    end
    counter
  end

  def find_mid(start,last)
    current = start
    count = count(start,last)
    (count/2).times do
      current = current.next_node
    end
   current
  end

  def find_last(start,last) #last could be mid node, if looking at left branch
    current = start
    count = count(start,last)
    (count-1).times do
      current = current.next_node
    end
   current
  end

  def make_bst(start = @head, mid = mid_node, last = last_node)
    start = start
    mid = mid
    last = last

    puts "Start = #{start.value}"
    puts "Mid = #{mid.value}"
    puts "Last = #{last.value}"

    if start.value > last.value
      return "Done!"
    else
      # 1) Get the Middle of the linked list and make it root.
      root = mid
#       2) Recursively do same for left half and right half.
      if start.value < mid.value
        # a) Get the middle of left half and make it left child of the root created in step 1.
        root.l_child = find_mid(start,mid)
        last = mid
        if last == root.l_child
          mid.r_child = last.next_node
          mid.l_child = start
          start = mid_node.next_node
          mid = find_mid(start, last_node)
          last = last_node

          make_bst(start, mid, last)
        end
        temp = root.l_child
        mid = temp
        make_bst(start, mid, last)
      elsif last.value > mid.value
        root.r_child = find_mid(mid.next_node,last) # b) Get the middle of right half and make it right child of the root created in step 1.
        start = mid.next_node
        if start == root.r_child
          mid.r_child = last
          mid.l_child = start
          return
        end
        mid = root.r_child
        make_bst(start, mid, last)
      else
      end
    binding.pry
    end
  end


  # def make_bst (Tricky - bottom up)
  #   current = @head
  #   # 1. count nodes
  #   count = count_nodes
  #   (count/2).times do
  #     #build from bottom up until midpoint
  #     current.parent = current.next_node.next_node #assign parent
  #     current.next_node.parent = current.next_node.next_node #assign parent of adjacent node
  #     current.next_node.next_node.child_1 = current
  #     current.next_node.next_node.child_2 = current.next_node
  #     current = current.next_node.next_node
  #   end
  #   head_node = current
  #
  #   while current.next_node != nil
  #     #build from top down
  #     current = current.next_node
  #   end
  #   self
  # end

  #Utility function to print the bst
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
