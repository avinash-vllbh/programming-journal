# Write a function to determine if a singly linked list has a loop.
require 'pry'
require_relative 'SingleLinkedList'
class LoopsInLL < SingleLinkedList
  def addToList
    [1,2,3,4,5].each do |x|
      add(x)
    end
    node = head
    loop_node = node.next.next
    current_node = head
    while current_node.next != nil
      current_node = current_node.next
    end
    current_node.next = loop_node
  end

  ###
  # Storing each visited node in hash map
  # If a node is already present in the hash then return saying loops exist
  # Time complexity: O(n)
  # Space Complexity: O(n) [Since hash map grows along with input size]
  ###
  def checkLoopsHashing
    current_node = head
    prev_node = nil
    visited_hash = Hash.new
    while current_node != nil
      if visited_hash[current_node].nil?
        visited_hash[current_node] = true
      else
        puts "Loops exist in Linked List"
        # Closing the loop by making the prev nodes next pointer as nil
        prev_node.next = nil
        break
      end
      prev_node = current_node
      current_node = current_node.next
    end
    print
    # return "There are no loops in LL"
  end

  ###
  # Uses Floyd's cycle detection algorithm, have two pointers
  # increment p1 by 1 step and p2 by two steps each time and if p1 == p2 implies there is a cycle in the list
  # if not p2 would always be ahead of p1
  # Time complexity: O(n)
  # Space Complexity: O(1) [Auxiliary space doesn't grow with input size]
  ###
  def checkLoopsExist
    node1 = head
    node2 = head
    while node1 != nil && node2 != nil && node2.next != nil
      node1 = node1.next
      node2 = node2.next.next
      if node1 == node2 #Loop exists and node1 can be anynode in the loop
        return "Loops exists in the given LinkedList"
        removeLoop(node1)
      end
    end
    return "No loops in the LinkedList"
  end

  def removeLoop(loop_node)
    current_node = head
    while(current_node != nil)
      current_loop = loop_node
      while (current_loop.next != loop_node && current_loop.next != current_node)

      end
    end
  end
end

loops_check = LoopsInLL.new
loops_check.addToList
loops_check.checkLoopsHashing
# puts loops_check.checkLoopsExist