#Reverse a linked list
require_relative 'SingleLinkedList'
class ReverseLinkedList < SingleLinkedList

  # Reverse a linked list iteratively
  def reverseList
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
  def reverseRecursiveList(node)
    # After reaching end of list we point head to end node and return
    if node.next == nil
      @head = node
      return
    end
    reverseRecursiveList(node.next)
    # Recursion starts folding up
    temp = node.next
    temp.next = node
    node.next = nil
  end
end

list = ReverseLinkedList.new
list.createRandomList(7)
list.print
list.reverseList
puts "List reversed iteratively"
list.print
list.reverseRecursiveList(list.head)
puts "List reversed back to original state recursively"
list.print
