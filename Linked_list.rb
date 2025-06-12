class LinkedList
  def initialize
    @head = nil
  end

  def append(val)
    node = @head
    new_node = Node.new(val)

    #If there's no nodes in list then set the head
    if node.nil?
      @head = new_node
      return
    end

    #Loops until the next node is nil aka reach the end of the linked list
    while node.next_node
      node = node.next_node
    end

    node.next_node = new_node
  end

  def prepend(val)
    new_node = Node.new(val, @head)

    @head = new_node
  end

  def size
    
  end

  def to_s
    node = @head

    #Iterates through the linked list and prints each node along the way
    while node.next_node
      print "(#{node.value}) -> "
      node = node.next_node
    end

    puts "(nil)"
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end