# remove duplicates from an unsorted linked list. [CTCI, 77]

class Node
  attr_accessor :value, :next

  def initialize(value = nil)
    @value = value
  end

end

class SinglyLinkedList
  attr_accessor :head

  # Head can be intialized when the class object is being created
  def initialize(first_value = nil)
    @head = Node.new(first_value) if first_value
  end

  # Add a new element to the linked list
  # Traverse to the end of the list and point the current end to the element
  # Time complexity O(n)
  # Space complexity O(n)
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

  # Find an element in the linked list
  # Traverse the list one by one from head and return if the element is found
  # Time complexity O(n) => Worst case, traverse the entire array to find the element
  # Space complexity O(n)
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
  # Space complexity O(n)
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
  # Space complexity O(n)
  def print
    current_node = head
    list = []
    while current_node
      list.push(current_node.value)
      current_node = current_node.next
    end
    puts list.join("->")
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


