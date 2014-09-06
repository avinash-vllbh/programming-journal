# Write a function to determine if a singly linked list is a palindrome.
require 'pry'
require_relative 'SingleLinkedList'
class Palindrome
  attr_accessor :list1, :list2
  
  def initialize
    @list1 = SingleLinkedList.new
    @list2 = SingleLinkedList.new
  end

  def addtoList
    [5,2,4,10,20,20,10,2,5].each do |x|
      list1.add(x)
      list2.add(x)
    end
  end
  
  def reverseLL
    prev = nil
    current = list2.head
    next_node = nil
    while current != nil
      next_node = current.next
      current.next = prev
      prev = current
      current = next_node
    end
    list2.head = prev
  end

  def isPalindrome
    list1.print
    list2.print
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
end

check_palindrome = Palindrome.new
check_palindrome.addtoList
check_palindrome.reverseLL
puts check_palindrome.isPalindrome