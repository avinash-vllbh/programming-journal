class Stack
  attr_accessor :store
  #@store - Use the array data structure to store the elements in the stack
  #@top - keep track of top element in the stack
  def initialize
    @store = Array.new
    @top = -1
  end

  # push the element at the the end of the stack
  def push(element)
    @store.push(element)
    @top = @top.succ
    self
  end
  #pops the last pushed element from the stack
  #O(1)
  def pop
    return nil if empty?
    popped = @store[@top]
    @store.pop
    @top = @top.pred
    return popped
  end
  # Returns the current size of the array
  def size
    @store.size
  end

  # Returns the top element of the array, but won't pop the element
  def seek
    @store[@top]
  end

  # To check if we are at the bottom of the stack
  # Returns true if the bottom is reached
  def is_stack_bottom?
    @top == -1
  end

  private
  def empty?
    @top == -1
  end
end