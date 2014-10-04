# Two singly linked-lists intersect at a node and merge into a single linked-list.
# The size of each is unknown and the number of nodes prior to the intersection node can vary in each list.
# Write a function to find the intersecting node.

require 'pry'
require_relative "single_linked_list"

class MergerNodeLL
  attr_accessor :list1, :list2

  def initialize
    @list1 = SingleLinkedList.new
    @list2 = SingleLinkedList.new
  end

  # Add elements to the list at random with a merger node in them
  def add_to_lists

    [1,2,3,4,5,6,7,8].each do |x|
      list1.add(x)
    end
    [22,4,2].each do |x|
      list2.add(x)
    end
    node1 = list1.head
    (rand(4)+1).times do
      node1 = node1.next
    end
    node2 =list2.head
    while node2.next != nil
      node2 = node2.next
    end
    node2.next = node1
  end

  ###
  # If the merger is not based on address and just node values
  # We can just revert the two lists and compare node's value by vlaue in both lists
  # Node after which values difer is the merger node 
  # Time complexity: O(m+n)
  # Space complexity: O(1)
  # Note: This method wouldn't work if the merger is based on addresses too since reversing one list would affect the other
  ###
  def find_merger_value
    list1.reverseList # O(m)
    list2.reverseList # O(n)
    node1 = list1.head
    node2 = list2.head
    merger = nil
    while node1 != nil && node2 != nil # O(m || n) which ever is larger
      if node1.value == node2.value
        merger = node1.value
      else
        return merger
      end
      node1 = node1.next
      node2 = node2.next
    end
  end

  def get_count_list(head)
    current_node = head
    count = 0
    while current_node != nil
      count += 1
      current_node = current_node.next
    end
    return count
  end

  def get_intersection_node(diff, head1, head2)
    node1 = head1
    node2 = head2
    diff.times do
      node1 = node1.next
    end
    while node1 != nil && node2 != nil
      if node1 == node2
        return node1
      end
      node1 = node1.next
      node2 = node2.next
    end
    nil
  end

  # Find the longest list and traverse until the difference length between those two lists
  # Then compare node by node of those two lists
  # Time complexity: O(m+n) Traversing lengths of both the lists
  # Space complexity: O(1) 
  def find_merger_node
    list1.print
    list2.print
    node1 = list1.head
    node2 = list2.head
    c1 = get_count_list(list1.head)
    c2 = get_count_list(list2.head)
    d = (c1-c2).abs
    current_node = nil
    if c1 > c2
      return get_intersection_node(d, list1.head, list2.head)
    else
      return get_intersection_node(d, list2.head, list1.head)
    end
  end
end

merger = MergerNodeLL.new
merger.add_to_lists
# puts "The two lists merge at Node with value: #{merger.find_merger_node}"
intersectionNode = merger.find_merger_node
puts "The two lists merge at Node with value: #{intersectionNode.value}"
