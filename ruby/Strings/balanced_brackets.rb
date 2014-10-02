require 'pry'
require_relative '../Stack/stack'
###
# Check for balanced paranthesis in an expression
#     Push all the opening braces into the stack
#     Pop the element from stack if there is a closing braces, also checking for its match to the popped brace
# Time complexity: O(n)
# Space complexity: O(n)
def checkBracketsBalanced(string)
  opening_braces = ["[","{","("]
  closing_braces = ["]","}",")"]
  # A sting shouldn't start with a closing brace
  return false if closing_braces.include?(string[0])
  stack = Stack.new
  for i in 0...string.size
    if opening_braces.include?(string[i])
      stack.push(string[i])
    else
      if closing_braces.include?(string[i])
        matching_open_brace = opening_braces[closing_braces.index(string[i])]
        return false unless matching_open_brace == stack.pop
      end
    end
  end
  if stack.is_stack_bottom?
    return true
  else
    return false
  end
end

def checkBracketsRecursive(string)
  return true if string.empty? or string == nil

  # Declaring as instance varaible, thus won't be overwritten during recursion
  @string ||= string
  @stack ||= Stack.new
  @opening_braces ||= ["[","{","("]
  @closing_braces ||= ["]","}",")"]

  if @opening_braces.include?(string[0])
    @stack.push(string[0])
  else
    if @closing_braces.include?(string[0])
      matching_open_brace = @opening_braces[@closing_braces.index(string[0])]
      return false unless matching_open_brace == @stack.pop 
    end
  end
  return checkBracketsRecursive(string[1..-1])
  # Should check for stack emptyness too
end