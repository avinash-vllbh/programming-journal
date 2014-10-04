#Reverse a linked list
require_relative 'single_linked_list'
class ReverseLinkedList < SingleLinkedList

  # Reverse a linked list iteratively
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

list = ReverseLinkedList.new
list.createRandomList(7)
list.print
list.reverse_list
puts "List reversed iteratively"
list.print
list.reverse_recursive_list(list.head)
puts "List reversed back to original state recursively"
list.print
