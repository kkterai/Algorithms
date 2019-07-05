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

   def find_last(start,last)
     current = start
     count = count(start,last)
     (count-1).times do
       current = current.next_node
     end
    current
   end
end

def start_bst(linkedlist)
  #linked list
  ll = linkedlist
  start = ll.head
  mid = mid_node
  last = ll.last_node
  node_count = ll.count_nodes

  #binary search tree
  root_node = TreeNode.new(mid.value)
  bst = Bst.new(root_node)
  depth = Math.log2(node_count)
  binding.pry

  # def make_bst(root, start, last)

  # So basically, I must do in-order traversal: l,root,r
  # 1) Count ll nodes
  # 2) Determine number of levels (base 2 log(n))
  # Algorithm
  # 3) excluding root, split count in half
  # 4) In order traversal: 

  #  if start.value > last.value  #Base case
  #    return null
  # =elsif depth == 0
  #    return root_node
  #  else
  # => if depth >= 1
        if bst.root.r_child == nil
            root.right = new Node(depth-1);
            root.left = new Node(depth-1);

          for (int i=0; i < depth; i++){
              Node node = new Node(depth);
              node.right = new Node(depth-1);
              node.left = new Node(depth-1);
          }
  # => end
  # return bst
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
