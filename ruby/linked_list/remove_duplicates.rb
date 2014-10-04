# remove duplicates from an unsorted linked list. [CTCI, 77]

require_relative 'single_linked_list'
class RemoveDuplicates < SingleLinkedList
  attr_accessor :list_hash
  def initialize
    @list_hash = Hash.new
  end

  ###
  # Creates a LinkedList of size limit using Ruby's Psuedo Random number generator
  # Iterates from 0 to limit-1 and add's a random number to the list on self
  ###
  def create_random_list(limit)
    limit.times do
      add(rand(10))
    end
    print
  end

  ###
  # Loop through by adding an element to list_hash if we it's not included in list_hash
  # Remove the element if it already exists in the hash
  # time complexity = O(n) => we loop through the list only once
  # space complexity = O(n) ???
  ###
  def remove_duplicates
    current_node = head.next
    prev_node = head
    @list_hash[head.value] = true
    while current_node != nil
      # If it's first time finding the current_node value, move both prev_node and current_node to their next nodes
      if list_hash[current_node.value].nil?
        @list_hash[current_node.value] = true
        current_node = current_node.next
        prev_node= prev_node.next
      # If current_node's value is in the hash, then point prev_node.next to current_node's next node in the list
      # Only move the current_node to it's next element
      else
        prev_node.next = current_node.next
        current_node = current_node.next
      end
    end
    print
  end
end

rmDup = RemoveDuplicates.new
rmDup.create_random_list(10)
rmDup.remove_duplicates