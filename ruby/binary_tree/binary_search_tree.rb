class TreeNode
  attr_accessor :value, :left, :right
  def initialize(value = nil)
    @value = value
  end
end
class BinarySearchTree

  ###
  # Insert an element to BST through recursion
  ###
  def insert_to_bst(root, value)
    if root.nil?
      root = TreeNode.new(value)
    elsif value < root.value
      root.left = insert_to_bst(root.left, value)
    else
      root.right = insert_to_bst(root.right, value)
    end
    return root
  end

  ###
  # Add an element to BST through iteration
  ###
  def add_iteratively_to_bst(root, value)
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
  # Search for an element in BST
  # Time complexity: O(logn)
  # Space complexity: O(1)
  ###
  def search_bst(root, element)
    return if root == nil
    return "Found" if root.value == element
    if element < root.value
      search_bst(root.left, element)
    else
      search_bst(root.right, element)
    end
  end

  # Printing binary tree through pre-order traversal
  def print_bst(root)
    return if root == nil
    puts root.value
    if root.left != nil
      puts "Left of #{root.value}"
      print_bst(root.left)
    end
    if root.right !=nil
      puts "Right of #{root.value}"
      print_bst(root.right)
    end
  end

  def add_random_elements_to_bst
    root = nil
    [10, 5, 13, 6, 3, 10, 12, 11].each do |i|
      root = insert_to_bst(root, i)
    end
    # [10, 5, 13, 6, 3, 10, 12, 11].each do |i|
    #   root = add_iteratively_to_bst(root, i)
    # end
    return root
  end
end

bst = BinarySearchTree.new
root = bst.add_random_elements_to_bst
bst.print_bst(root)
if bst.search_bst(root, 11)
  puts "Element Found"
else
  puts "Element not found"
end