#Find the middle element of the stack
require_relative 'stack'
require 'pry'

# To build a stack with unknown size
def build_stack
  stack = Stack.new
  rand(1..10).times do |i| 
    stack.push(i)
  end
  return stack
end

###
# Reach to the end of stack by popping each element using recursion
# Print the middle element when recursion is folding back.
# Time complexity: O(n) -> To parse the entire stack.
# Space complexity: ????
###
def middle_element(stack)
  @depth ||= 1 # Creates a counter instance variable to keep track of depth of recursion
  @fold ||= 0 # creates a down instance to keep track when recursion is folding up
  return if stack.is_stack_bottom? # Base case - to stop recursion when stack is empty
  element = stack.pop
  puts "popped element #{element}"
  @depth += 1
  middle_element(stack)
  @fold += 1
  puts "middle element is #{element}" if @fold == @depth/2
end

stack = build_stack
middle_element(stack)