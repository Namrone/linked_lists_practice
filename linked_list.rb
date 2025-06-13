class LinkedList
  def initialize
    @head = nil
  end

  def append(val)
    new_node = Node.new(val)
    
    #If there's no nodes in list then set the head
    if @head.nil?
      @head = new_node
      return
    end

    each_node do |node| 
      if node.next_node.nil?
        node.next_node = new_node 
        break
      end
    end
  end

  def prepend(val)
    new_node = Node.new(val, @head)

    @head = new_node
  end

  def size
    count = 0
    each_node{|node| count += 1 unless node.nil?}
    count
  end

  def head
    @head
  end

  def tail
    last = each_node{|node| return node.value if node.next_node.nil?}
    last
  end

  def at(index)
    each_node do |node|
      index -= 1
      if index == 0
        return node.value
      elsif node.next_node.nil?
        return node.next_node
      end
    end
  end

  def pop
    previous_node = @head

    return if @head.nil?
    @head = nil if @head.next_node.nil?

    each_node do |node|
      previous_node.next_node = nil if node.next_node.nil? 
      previous_node = node
    end
  end

  def contains?(value)
    each_node{|node| return true if node.value == value}
    false
  end

  def find(value)
    index = 0
    each_node do |node| 
      return index if node.value == value
      index += 1
    end
    nil
  end

  def to_s
    #Iterates through the linked list and prints each node along the way
    each_node{|node| print "(#{node.value}) -> "}

    puts "(nil)"
  end

  def insert_at(value, index)
    if index == 0
      @head = Node.new(value,@head) 
      return
    end
    previous_node = nil

    each_node do |node|
      if index == 0
        previous_node.next_node = Node.new(value,node)
        break
      end
      index -= 1
      previous_node = node
    end
  end

  def remove_at(index)
    if index == 0
      @head = @head.next_node  
      return
    end
    previous_node = nil

    each_node do |node|
      if index == 0
        previous_node.next_node = node.next_node
        break
      end
      index -= 1
      previous_node = node
    end
  end

  #method to iterate through the list to be used by other methods
  def each_node
    node = @head

    while node
      yield(node)
      node = node.next_node
    end
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end