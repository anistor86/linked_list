class LinkedList
  attr_accessor :head, :tail

	def initialize
		@head = nil
		@tail = nil
	end

  def append(data = nil)
    # check if the list is empty
    if @head == nil
      @head = Node.new(data)
      @tail = @head
    else
    # change the pointer to the next Node
      @tail.next_node = Node.new(data)
      @tail = @tail.next_node
    end
  end

  def prepend(data)
    # check if the list is empty
    if @head == nil
      @head = Node.new(data)
      @tail = @head
    else
    # change the pointer to the head and make a new node
      pointer = @head
      @head = Node.new(data, pointer)
    end
  end

  def size
    size = 0
    # move the pointer to the head
    pointer = @head
    # loop until the pointer is nil and increase the counter "size"
    until pointer == nil
      size += 1
      pointer = pointer.next_node
    end
    size
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    i = 0
    pointer = @head
    until i == index
      return if pointer.next_node == nil
      pointer = pointer.next_node
      i += 1
    end
    pointer
  end

  def pop
    pointer = @head
    until pointer.next_node == @tail
			pointer = pointer.next_node
		end
		pointer.next_node = nil
		@tail = pointer
  end

  def contains?(value)
    pointer = @head
    # loop until last node
    until pointer == nil
      # return true if the value of the pointer is equal to the value passed
      return true if pointer.value == value
      # otherwise move the pointer to the next node
      pointer = pointer.next_node
    end
    return false
  end

  def find(data)
    i = 0
    pointer = @head
    until pointer == nil
      return i if pointer.value == data
      i += 1
      pointer = pointer.next_node
    end
    nil
  end

  def to_s
    pointer = @head
    # loop until last node to print the values
    until pointer == nil
      print "( #{pointer.value} ) -> "
      pointer = pointer.next_node
    end
    print "nil\n"
  end

  def insert_at(data, index)
    i = 0
    pointer = @head
    # loop until i match the index-1 node
    until i == (index-1)
      i += 1
      pointer = pointer.next_node
    end
    # if the pointer != nil, means is in the middle, so insert a new node
    # and link the pointer to the next node
    if pointer.next_node != nil
      pointer.next_node = Node.new(data, pointer.next_node)
    else
    # if nil, is the last node and @tail is nil
      pointer.next_node = Node.new(data)
      @tail = pointer.next_node
    end
  end

  def remove_at(index)
    i = 0
    pointer = @head
    until i == (index-1)
      i += 1
      pointer = pointer.next_node
    end
    @tail = pointer if pointer.next_node = @tail
    pointer.next_node = (pointer.next_node.next_node == nil ? nil : pointer.next_node.next_node )
  end


end
# Node class, containing a #value method and a link to the #next_node
class Node
  attr_accessor :value, :next_node

  def initialize(data, next_node = nil)
    @value = data
    @next_node = next_node
  end
end

=begin

test = LinkedList.new
test.append("A")
test.prepend("B")
test.append("C")
test.prepend("D")
test.prepend("J")
puts test.tail
test.pop
test.pop
puts test.size
puts test.head
puts test.tail
test.to_s
puts test.at(2).value
puts test.contains?("B")
puts test.contains?("C")
puts test.find("C")
puts test.find("B")
test.remove_at(2)
test.to_s
test.insert_at("F", 1)
test.to_s

=end
