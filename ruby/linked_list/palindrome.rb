# Write a function to determine if a singly linked list is a palindrome.
require 'pry'
require_relative 'single_linked_list'
class Palindrome
  attr_accessor :list1, :list2
  
  def initialize
    @list1 = SingleLinkedList.new
    @list2 = SingleLinkedList.new
  end
  
  def add_to_list
    [5].each do |x|
      list1.add(x)
      list2.add(x)
    end
  end
  
  ###
  # Reverse a copy of the given linked list and compare element by element to see if the match in reverse order or not.
  # Time complexity: O(n)
  # Space complexity: O(n) [Since the auxiliary space grows along with the input size]
  ###
  def isPalindrome
    list2.reverseList
    node1 = list1.head
    node2 = list2.head
    while node1 != nil && node2 != nil
      if node1.value != node2.value
        return "Nope not a palindrome"
      end
      node1 = node1.next
      node2 = node2.next
    end
    return "Yes! it's a palindrome"
  end

  ###
  # Reverse the list from the middle node and then compare first half to second half.
  # Time complexity: O(n)
  # Space complexity: O(1) [Since the auxiliary space doesn't grow with input size, we would only use couple of extra pointers throught the method]
  ###
  def isPalindromeEfficient
    # Handle the edge case of single element
    # Single element is list is a palindrome
    if list1.head.next == nil
      return "Yep! list is a palindrome"
    end
    # To find the middle node of the list
    node1 = list1.head
    node2 = list1.head
    prev_node2 = list1.head
    while node1 != nil && node1.next != nil
      node1 = node1.next.next
      prev_node2 = node2
      node2 = node2.next
    end
    if node1 != nil
      prev_node2 = node2
      node2 = node2.next
    end
    # To recursively reverse the list from the mid point
    # Passing the prev_node2 as additional pointer for reversed half to be merged back to original
    reverse_recursive(node2, prev_node2)
    # Compare first half and second half of the list one step each and retrun if elements doesn't match at any step
    current_first = list1.head
    current_second = prev_node2.next
    while current_first != nil && current_second != nil
      if current_first.value != current_second.value
        return "Nope not a palindrome"
      end
      current_first = current_first.next
      current_second = current_second.next
    end
    # To recursively reverse back to the original list from the mid point
    reverse_recursive(prev_node2.next, prev_node2)
    list1.print
    return "Yep! list is a palindrome"
  end

  def reverse_recursive(node, prev_node)
    if node.next == nil
      prev_node.next = node
      return
    end
    reverse_recursive(node.next, prev_node)
    temp = node.next
    temp.next = node
    node.next = nil
  end
end

check_palindrome = Palindrome.new
check_palindrome.add_to_list
puts check_palindrome.isPalindromeEfficient