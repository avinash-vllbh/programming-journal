# Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.
require 'pry'
class TreeNode
  attr_accessor :value, :left, :right
  def initialize(value = nil)
    @value = value
  end
end
class OrderedListToBST
  # attr_accessor :root

  ###
  # Add an element to BST through iteration
  ###
  def additeratielyToBST(root, value)
    if root.nil?
      root = TreeNode.new(value)
    else
      current_node = root
      while current_node
        if value < current_node.value
          if current_node.left == nil
            # Adding the new value to the tree
            current_node.left = TreeNode.new(value)
            return root# Added the element, retrun reference to root of the tree
          else
            current_node = current_node.left
          end
        else
          if current_node.right == nil
            # Adding the new value to the tree
            current_node.right = TreeNode.new(value)
            return root# Added the element, retrun reference to root of the tree
          else
            current_node = current_node.right
          end
        end
      end
    end
    return root
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

  def addRandomElementsToBST
    root = nil
    [10, 5, 13, 6, 3, 10, 12, 11].each do |i|
      root = insertToBST(root, i)
    end
    # [10, 5, 13, 6, 3, 10, 12, 11].each do |i|
    #   root = additeratielyToBST(root, i)
    # end
    return root
  end

  # Printing binary tree through pre-order traversal
  def printBST(root)
    return if root == nil
    puts root.value
    if root.left != nil
      printBST(root.left)
    end
    if root.right !=nil
      printBST(root.right)
    end
  end

  def searchBST(root, element)
    return if root == nil
    return "Found" if root.value == element
    if element < root.value
      searchBST(root.left, element)
    else
      searchBST(root.right, element)
    end
  end

end

bst = OrderedListToBST.new
root = bst.addRandomElementsToBST
# puts bst.root
bst.printBST(root)
if bst.searchBST(root,11)
  puts "Element found"
else
  puts "Element not found"
end
