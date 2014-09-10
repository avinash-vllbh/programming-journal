#Find the middle element of the stack
require_relative 'stack'
require 'pry'
def find_middle_stack
  stack = Stack.new
  5.times do |i| 
    stack.push(i)
  end
  return stack
end
@counter = 1
@down = 0
def middle_element(stack)
  return if stack.is_stack_bottom?
  element = stack.pop
  @counter += 1
  middle_element(stack)
  @down += 1
  # binding.pry
  puts "middle element is #{element}" if @down == @counter/2
end

stack = find_middle_stack
middle_element(stack)