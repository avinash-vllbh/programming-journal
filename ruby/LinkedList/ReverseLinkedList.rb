#Reverse a linked list
require_relative 'SingleLinkedList'
class ReverseLinkedList < SingleLinkedList
  # Reverse a linked list iteratively
  def reverseList
    prev = nil
    current = head
    next_node = nil
    while current != nil
      next_node = current.next
      current.next = prev
      prev = current
      current = next_node
    end
    @head = prev
    print
  end

  #Reverse a linked list recursively
  def reverseRecursiveList(head)
    first = Node.new
    next_list = Node.new
    return if head == nil
    first = head
    rest = first.next
    return if rest == nil
    reverseRecursiveList(rest)
    first.next =nil
    rest.next = first
    return rest
  end
end
list = ReverseLinkedList.new
list.createRandomList(10)
list.print
list.reverseList
list.head = list.reverseRecursiveList(list.head)
list.print
