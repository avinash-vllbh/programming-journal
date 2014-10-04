# Write an algorithm to find the kth to last element of a singly linked list. [CTCI, 77]

require_relative 'single_linked_list'
class KthLastElement < SingleLinkedList
  ###
  # Creates a LinkedList of random size using Ruby's Psuedo Random number generator
  # Iterates from 0 to size-1 and add's a random number to the list on self
  ###
  require 'pry'
  def create_random_list
    list_size = rand(9) + 1
    list_size.times do
      add(rand(10))
    end
    print
  end

  ###
  # Starts with two pointers both pointing to head, we move pointer2 k positions with pointer1 still pointing to the head
  # After moving pointer2 k positions then we move both pointer1 and pointer2 one position each until we reach the end
  # At this state pointer1 will be pointing to kth to last position and pointer2 to the end of list
  # Time complexity O(n) => traverse the list only once
  # Space complexity O(n) => Axiliary space is just two nodes throughout the execution of the program
  ###
  def kth_last_element(k)
    node1 = head
    node2 = head
    k.times do 
      node2 = node2.next
      return "List size less than #{k}" if node2 == nil
    end
    # binding.pry
    while node2 != nil
      node2 = node2.next
      node1 = node1.next
    end
    return node1.value
  end
end

knode = KthLastElement.new
knode.create_random_list
puts knode.kth_last_element(3)
