require 'pry'

def searchElement(array, x)
  start = 0
  finish = array.size - 1
  position = binary_search_array(array, start, finish, x)
  if position.nil?
    puts "Element #{x} not found in given array"
  else
    puts "Element #{x} found at position: #{position}"
  end
end

###
# Important Note: Even if array is circularly sorted many times,
# either the right or left half of middle element will be sorted at any time
# Binary search works for any number of circular rotations of an array
# Binary search doesn't work if there are any duplicates
###
# Time complexity: O(logn)
#Space complexity: O(1) auxiliary space doesn't increase with input size
def binary_search_array(array, start, finish, x)
  return if start > finish
  mid = (start + finish)/2
  #case1 if element is found at mid
  return mid if array[mid] == x
  #case2 - Right half is sorted
  if array[mid] <= array[finish]
    if x > array[mid] && x <= array[finish]
      start = mid + 1 #check in the right half
    else
      finish = mid - 1
    end
  # Case3 - Left half is sorted
  else
    if x >= array[start] && x < array[mid]
      finish = mid - 1 # Check in the left half
    else
      start = mid + 1
    end
  end
  binary_search_array(array, start, finish, x)
end

searchElement([15, 17, 19, 20, 22, 7, 8, 13, 14], 5)


### Count the number of rotations on a given circular sorted array
def count_rotations(array)
  start = 0
  finish = array.size-1
  rotations = binary_search_array_count_rotations(array, start, finish)
  rotations ||= 0
  puts "array was rotated #{rotations} times"
end

###
# Reduce the search space rotations each time using the condition
# if mid < mid_prev && mid < mid < mid_next ==> If this is true that implies until that position times the array was rotated
# Time complexity: O(logn)
# space complexity: O(1)
def binary_search_array_count_rotations(array, start, finish)
  return if start > finish
  mid = (start+finish)/2
  # binding.pry
  size = array.size
  prev = (mid-1+size)%size
  nextt = (mid+1)%size
  # case1: if mid < prev and mid < next retrun mid position
  if array[mid] < array[prev] && array[mid] < array[nextt]
    return mid
  # Array is rotated either more times that that of mid or less that mid position
  else
    if array[mid] <= array[finish] # Right half is sorted
      finish = mid - 1 #Array is rotated less times that mid position
    else
      start = mid + 1 #Array is rotated more times that mid position
    end
  end
  binary_search_array_count_rotations(array, start, finish)
end

count_rotations([3])
count_rotations([3,4,5,6,7])
count_rotations([5,6,7,8,4])
count_rotations([15, 17, 19, 20, 22, 7, 8, 13, 14])
