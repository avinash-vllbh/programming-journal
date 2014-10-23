require 'pry'
class Node
	attr_accessor :value, :left, :right
	def initialize(value = nil)
		@value = value
	end
end

class Bst < Node
	def insert(root, value)
    # binding.pry
    if root.nil?
      root = Node.new(value)
    elsif value < root.value
      root.left = insert(root.left, value)
    else
      root.right = insert(root.right, value)
    end
    return root
  end

  def loopyInsert(root, value)
    current_node = root
    prev_node = nil
    while !current_node.nil?
      prev_node = current_node
      # binding.pry
      if current_node.value > value
        if current_node.left.nil?
          current_node.left = Node.new(value)
          break
        else
          current_node = current_node.left
        end
      else
        if current_node.right.nil?
          current_node.right = Node.new(value)
          break
        else
          current_node = current_node.right
        end
      end
    end
    return root
  end

  def search(root, value)
    @height ||= 0
    return if root.nil?
    if root.value == value
      puts "found at level #{@height}"
    elsif root.value > value
      @height += 1
      search(root.left, value)
    else
      @height += 1
      search(root.right, value)
    end
  end

  def print(root)
    return if root.nil?
    print(root.left)
    p root.value
    print(root.right)
  end
end
bst = Bst.new
root = nil
root = bst.insert(root, 5)
root = bst.insert(root, 4)
root = bst.insert(root, 6)
root = bst.loopyInsert(root, 7)
root = bst.loopyInsert(root, 3)
bst.search(root, 3)
bst.print(root)

