# Given an array, write a function to check if any two elements sum upto a third
require 'pry'

# Sort the given array - quick sort - tc: O(nlogn)
# Fix the first element and sum the following elements and binary search of the sum in the remaining array
# Time complexity: O(n2) ie. [O(nlogn)+O(n2+logn)]=> for height values of n O(n2)
# space complexity: O(1)
def check_sum(array)
  p array
  array.sort! # uses native quick sort to sort the array
  p array
  #fix the first element
  for i in 0..array.size-3
    j = i+1
    while j < array.size-2
      x = array[i]+array[j]
      # binding.pry
      if binary_search(array, j+1, array.size-1, x) 
        puts "Yes found: #{array[i]}, #{array[j]}, #{x}"
        return true
      end
      j += 1
    end
  end
  puts "No such combination is found in the given array"
  return false
end

# Binary search for target in the array
# Time complexity: O(logn)
def binary_search(array, start, finish, x)
  return false if start > finish
  mid = (start+finish)/2
  return true if array[mid] == x
  if x < array[mid]
    binary_search(array, start, mid-1, x)
  else
    binary_search(array, mid+1, finish, x)
  end
end

check_sum([8,9,12,10,20,13,7])
check_sum([8,9,12,10,5,6])