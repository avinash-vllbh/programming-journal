# Given an array of positve natural number from 1 to k-1 with array of size k
# Print all the duplicate elements in the array
# E.g. array of size 7 - [3, 5, 3, 4, 6, 2, 2]
# outputs is 3, 2
# Time complexity: O(n) -- checks the entire array atleast once
# Space complexity: O(1) 
#         Auxiliary space doesn't increase with input size.
#         We are reusing the existing array by changing the value to negative
def print_duplicates(array)
  size = array.size
  array.each do |element|
    element = element.abs # returns the absolute value
    if element < size # This would fail if we have an element in the array i.e. greater than size of array
      if array[element] > 0
        array[element] = -array[element] # Indicates first occurance
      else # Element at that pos already negative, indicates current element is duplicate.
        puts "#{element} is repeated" # printing the duplicate
      end
    else
      puts ArgumentError.new "failed constraints for the array"
      break
    end
  end
end
# print_duplicates([1,5,3,4,3,2,3])


# Find the least positive element missing from given array of size n
#                   E.g Array - [5,7,10,-2,4,5,-1,1,2] 
#                   Least missing positive element is 3
# Time complexity: O(n)
# Space complexity: O(1)
require 'pry'
def min_positive_missing_element(array)
  # Segregate the array with all positve moved to the right of the array
  pcount = 0 # Index at which positve elements start
  for i in 0..array.size-1
    if array[i] <= 0
      # binding.pry
      array[pcount], array[i] = array[i], array[pcount]
      pcount += 1 # increment count of non-positive integers
    end
  end 
  array.shift(pcount) #Removes the negatives and 0's at the start of the array
  
  # To make the positions of the elements in the array as negative
  array.each do |element|
    element = element.abs-1 #Since array start from 0
    if element < array.size
      if array[element] > 0
        array[element] = -array[element]
      end
    end
  end

  # Find the first index that has positive value and return the index as missing positive number
  for i in 0..array.size-1
    if array[i] > 0
      puts "Least positive missing element is #{i+1}"
      return
    end
  end
  puts "Least positive missing element is #{array.size+1}"
end
# min_positive_missing_element([-5,7,10,-2,4,5,-1,1,2,0]) #Will print 3
# min_positive_missing_element([0,0,1,5,3,4,-6,2,7]) #Will print 6



###
# Rotate a one dimensional array of n elements by k steps
#       Input sample = [a,b,c,d,e,f,g] ==>Rotate by 3 steps ==> output = [e,f,g,a,b,c] 
# The way it works is to reverse the array once and then reverse the two halfs based on number of steps of rotation
# Time complexity: O(n)
# Space complexity: O(1) 
def rotate_array(array,k,type="right")
  puts "Input array is"
  p array
  reverse_array(array, 0, array.size-1)
  if type == "right"
    reverse_array(array,0,k-1)
    reverse_array(array,k,array.size-1)
  else
    reverse_array(array,0,k)
    reverse_array(array,k+1,array.size-1)
  end
  puts "#{type} rotated array is"
  p array
end

def reverse_array(array, start, finish)
  while start < finish
    array[start], array[finish] = array[finish], array[start]
    start = start.succ
    finish = finish.pred
  end
end
rotate_array([4,7,3,5,6],2)
rotate_array([4,7,3,5,6],2,"left")
rotate_array(["a","b","c","d","e","f","g"],2)

###
# Rotate a one dimensional array of n elements by k steps
#       Input sample = [a,b,c,d,e,f,g] ==>Rotate by 3 steps ==> output = [e,f,g,a,b,c] 
# work in progress
# Break point doesn't work right if the number of elements are odd

def rotate_array_k_steps(array, k)
  n = array.size
  puts "Input array is"
  p array
  shifts = (n.to_f/k).ceil
  # binding.pry
  current = nil
  for i in 0..k-1
    current = array[i] if current.nil?
    nxt = (i+k)%n
    shifts.times do
      temp = array[nxt]
      array[nxt] = current
      current = temp
      nxt = (nxt+k)%n
    end
  end
  puts "Rotated array is"
  p array
  p current
end
