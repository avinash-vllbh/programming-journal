class Node
  attr_accessor :value, :next

  def initialize(value = nil)
    @value = value
  end

end

class SingleLinkedList
  attr_accessor :head

  # Head can be intialized when the class object is being created
  def initialize(first_value = nil)
    @head = Node.new(first_value) if first_value
  end

  # Add a new element to the linked list
  # Traverse to the end of the list and point the current end to the element
  # Time complexity O(n)
  # Space complexity O(1)
  def add(value)
    if head.nil?
      @head = Node.new(value)
    else
      current_node = head
      while current_node.next
        current_node = current_node.next
      end
      current_node.next = Node.new(value)
    end
  end

  ###
  # Creates a LinkedList of size limit using Ruby's Psuedo Random number generator
  # Iterates from 0 to limit-1 and add's a random number to the list on self
  ###
  def create_random_list(limit)
    limit.times do
      add(rand(10))
    end
  end

  ###
  # => Creates a random list of size 10 and returns a node at random other than head.
  ###
  def get_random_node
    select_node = nil
    create_random_list(10)
    current_node = head
    # Select a random node from the list to delete just that node.
    (rand(8)+1).times do 
      current_node = current_node.next
      break if current_node == nil
    end
    select_node = current_node
    return select_node
  end


  # Find an element in the linked list
  # Traverse the list one by one from head and return if the element is found
  # Time complexity O(n) => Worst case, traverse the entire array to find the element
  # Space complexity O(1)
  def find(value)
    current_node = head
    while current_node != nil
      return current_node if current_node.value == value
      current_node = current_node.next
    end
    nil
  end

  # Remove an element in the linked list
  # Traverse the list one by one from head and return if the element is found
  # Time complexity O(n) => Worst case, traverse the entire array to find the element
  # Space complexity O(1)
  def remove(value)
    if head.value == value
      @head = head.next
    else
      current_node = head.next
      prev_node = head
      while current_node
        if current_node.value == value
          prev_node.next = current_node.next
          return
        else
          prev_node = current_node
          current_node = current_node.next
        end
      end
      nil
    end
  end

  # Traverse the list one by one from head and print the value of each node
  # Time complexity O(n)
  # Space complexity O(1)
  def print
    current_node = head
    list = []
    while current_node
      list.push(current_node.value)
      current_node = current_node.next
    end
    puts list.join("->")
  end

  # Reverse a linked list iteratively
  # Time complexity O(n)
  # Space complexity O(1)
  def reverse_list
    prev = nil
    current = head
    next_node = nil
    # Reversing the links iteratively
    # 8 -> 9 => 8 <- 9
    while current != nil
      next_node = current.next
      current.next = prev
      prev = current
      current = next_node
    end
    @head = prev
  end

  ###
  # Reverse a linked list recursively
  # Uses function stack during execution to reverse the nodes
  # Time complexity: O(n)
  # Space complexity: O(1)
  ###
  def reverse_recursive_list(node)
    # After reaching end of list we point head to end node and return
    if node.next == nil
      @head = node
      return
    end
    reverse_recursive_list(node.next)
    # Recursion starts folding up
    temp = node.next
    temp.next = node
    node.next = nil
  end
end

# ll = SinglyLinkedList.new
# [10, 20 ,30 ,55, 5, 45, 99].each do |x|
#   ll.add(x)
# end
# ll.print
# [10, 150, 250].each do |x|
#   node = ll.find(x)
#   unless node.nil?
#     puts "#{node.value} is found in the list"
#   else
#     puts "#{x} is not found in the list"
#   end
# end
# ll.remove(20)
# ll.print


