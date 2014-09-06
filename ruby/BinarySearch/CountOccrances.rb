# Find the count of occrances of an element in an array
###
# Search by reducing the search space by half each time and retrun the first occurance of search element
# Time complexity: O(logn)
# Space complexity: O(1)
###
def binarySearch(array, size, x, first = true)
  start = 0
  finish = size-1
  result = -1
  while start <= finish
    mid_index = (start+finish)/2
    if array[mid_index] == x
      # return mid_index  => we don't return here since a duplicate of it could be before it
      result = mid_index
      if first
        finish = mid_index-1
      else
        start = mid_index+1
      end 
    elsif x < array[mid_index]
      finish = mid_index - 1
    else
      start = mid_index + 1
    end
  end
  return result
end

###
# counts the occurances by retruning start and end positions of that element using binary search
# count = end_pos - start_pos + 1
# Time complexity: O(logn)
# Space complexity: O(1)
###
def countOccurances(array, element)
  first = binarySearch(array, array.size, element) # Time complexity: O(logn)
  unless first == -1
    last = binarySearch(array, array.size, element, false) # Time complexity: O(logn)
    return count = last - first + 1
  end
  return 0
end

puts "Number of occurances of 8: #{countOccurances([8,8,8,8,8,8,12,15], 8)}"
