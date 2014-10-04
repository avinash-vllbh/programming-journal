# Write a function to determine if a singly linked list has a loop.

require 'pry'
require_relative 'single_linked_list'
class LoopsInLL < SingleLinkedList
  def add_to_list
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
  def check_loops_hashing
    current_node = head
    prev_node = nil
    visited_hash = Hash.new
    while current_node != nil
      if visited_hash[current_node].nil?
        visited_hash[current_node] = true
      else
        puts "Loop exist in Linked List"
        # Closing the loop by making the prev nodes next pointer as nil
        puts "closing the loop at #{current_node.value}"
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
  def check_loops_exist
    node1 = head
    node2 = head
    while node1 != nil && node2 != nil && node2.next != nil
      node1 = node1.next
      node2 = node2.next.next
      if node1 == node2 #Loop exists and node1 can be anynode in the loop
        puts "Loop exists in the given LinkedList"
        return remove_loop(node1)
      end
    end
    puts "No loop in the LinkedList"
  end

  def remove_loop(loop_node)
    current_node = head
    current_loop = loop_node
    while(current_node != nil)
      current_loop = loop_node
      while (current_loop.next != loop_node && current_loop.next != current_node)
        current_loop = current_loop.next
      end
      # Loops starts where current_node meets current_loop.next
      if current_loop.next == current_node
        puts "#{current_node.value} is the begining of the loop"
        break
      else
        current_node = current_node.next
      end
    end
    puts "closing the loop"
    # Closing the loop by making the prev nodes next pointer as nil
    current_loop.next = nil
    print
  end
end

loops_check = LoopsInLL.new
loops_check.add_to_list
# loops_check.check_loops_hashing
loops_check.check_loops_exist