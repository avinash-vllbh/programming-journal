# Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.
require 'pry'
require_relative 'SingleLinkedList'
class TreeNode
  attr_accessor :value, :left, :right
  def initialize(value = nil)
    @value = value
  end
end
class OrderedListToBST
  attr_accessor  :list

  def initialize
    @list = SingleLinkedList.new
  end

  ###
  # create an ordered list
  ###
  def createOrderedList
    # [1,2,3,4,5,6,7,8,10,12,15,16,20].each do |x|
    [1,2,3,4,5,6,7,8,9].each do |x|
      list.add(x)
    end
  end

  ###
  # Insert an element to BST through recursion
  ###
  def insertToBST(root, value)
    if root.nil?
      root = TreeNode.new(value)
    elsif value < root.value
      root.left = insertToBST(root.left, value)
    else
      root.right = insertToBST(root.right, value)
    end
    return root
  end

  # Printing binary tree through pre-order traversal
  def printBST(root)
    return if root == nil
    puts root.value
    if root.left != nil
      puts "Left of #{root.value}"
      printBST(root.left)
    end
    if root.right !=nil
      puts "Right of #{root.value}"
      printBST(root.right)
    end
  end

  ###
  # Find the middle node and insert it into tree
  # Call the same method on left sublist and right sublist of middle node
  # Time complexity: O(nlogn) [O(n) --> To find the middle element of the list, O(logn) --> To add the element to the list]
  # Space complexity: O(n) [since we are creating a tree of size of list]
  ###
  def createBSTFromList(start_node, end_node, root)
    return root if start_node == nil || end_node == nil
    if start_node == end_node
      root = insertToBST(root, start_node.value)
      return root
    end
    node1 = start_node
    node2 = start_node.next
    prev_node = nil
    # Find the middle node of sub-list
    while node2 != end_node && node2 != nil && node2.next != nil
      prev_node = node1
      node1 = node1.next 
      node2 = node2.next.next
    end
    # Inserting middle node
    root = insertToBST(root, node1.value)
    # recursively calling the method on left sublist
    root = createBSTFromList(start_node, prev_node, root)
    # recursively calling the method on right sublist
    root = createBSTFromList(node1.next, end_node, root)
    return root
  end
end

bst = OrderedListToBST.new
bst.createOrderedList
bst.list.print
current_node = bst.list.head
while current_node.next != nil
  current_node = current_node.next
end
last_node = current_node
root = nil
root = bst.createBSTFromList(bst.list.head, last_node, root)
bst.printBST(root)