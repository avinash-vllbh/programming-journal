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
    [1,2,3,4,5,6,7,8,9].each do |x|
      list.add(x)
    end
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
  # Build the left subtree
  # Create root for the tree and map left subtree to root
  # build the right subtree and map right subtree to root
  # Time complexity: O(n) [O(n) --> To find the size of the list, O(n) --> To traverse the list adding each element to BST]
  # Space complexity: O(n) [since we are creating a tree of size of list]
  ###
  def orderedListToBalancedBST(list_node, start, finish)
    # Making list node a class varaible to keep the pointer moving 
    if @list_node.nil?
      @list_node = list_node
    end
    return nil if start > finish
    mid = start + (finish-start)/2
    # binding.pry
    left_tree = orderedListToBalancedBST(@list_node, start, mid-1)
    parent = TreeNode.new(@list_node.value)
    parent.left = left_tree
    @list_node = @list_node.next
    parent.right = orderedListToBalancedBST(@list_node, mid+1, finish)
    return parent
  end
end


bst = OrderedListToBST.new
size = 0
bst.createOrderedList
bst.list.print
current_node = bst.list.head
while current_node.next != nil
  current_node = current_node.next
  size += 1
end
root = nil
root = bst.orderedListToBalancedBST(bst.list.head, 0, size)
bst.printBST(root)


###
# # Find the middle node and insert it into tree
# # Call the same method on left sublist and right sublist of middle node
# # Time complexity: O(nlogn) [O(n) --> To find the middle element of the list, O(logn) --> To add the element to the list]
# # Space complexity: O(n) [since we are creating a tree of size of list]
# ###
# def createBSTFromList(start_node, end_node, root)
#   return root if start_node == nil || end_node == nil
#   if start_node == end_node
#     root = insertToBST(root, start_node.value)
#     return root
#   end
#   node1 = start_node
#   node2 = start_node.next
#   prev_node = nil
#   # Find the middle node of sub-list
#   while node2 != end_node && node2 != nil && node2.next != nil
#     prev_node = node1
#     node1 = node1.next 
#     node2 = node2.next.next
#   end
#   # Inserting middle node
#   root = insertToBST(root, node1.value)
#   # recursively calling the method on left sublist
#   root = createBSTFromList(start_node, prev_node, root)
#   # recursively calling the method on right sublist
#   root = createBSTFromList(node1.next, end_node, root)
#   return root
# end
