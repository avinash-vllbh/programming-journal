# Implement an algorithm to delete a node from a single linked list, given only access to that node. [CTCI, 77]
require_relative 'SingleLinkedList'
class DeleteAccessNode < SingleLinkedList

  ###
  # => Creates a random list of size 10 and returns a node at random other than head.
  ###
  def findAndDeleteRandomNode
    select_node = nil
    createRandomList(10)
    current_node = head
    # Select a random node from the list to delete just that node.
    (rand(8)+1).times do 
      current_node = current_node.next
      break if current_node == nil
    end
    select_node = current_node
    delAccessNode(select_node)
  end

  ##
  # => Replace both current nodes value and next pointer with the next nodes value and pointer, which replaces this node with it's next node
  # => Time complexity O(1) [No need to traverse the entire list]
  ##
  def delAccessNode(node)
    puts "Deleting Node with value: #{node.value} from the list"
    if node.next != nil
      node.value = node.next.value
      node.next = node.next.next
    else
      node.value = nil
    end
    print
  end
end

delNode = DeleteAccessNode.new
delNode.findAndDeleteRandomNode

