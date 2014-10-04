###
# Find a element in a circular sorted array with no duplicates
# Time complexity: O(logn)
# Space complexity: O(1)
###
def find_element(array, x)
  size = array.size
  start = 0
  finish = size - 1
  while start <= finish
    mid = start + (finish-start)/2
    if array[mid] == x
      return mid
    elsif array[mid] <= array[finish]
      if x > array[mid] && x <= array[finish]
        start = mid+1
      else
        finish = mid-1
      end
    else
      if x < array[mid] && x >= array[start]
        finish = mid-1
      else
        start = mid+1
      end
    end
  end
  return -1
end

###
# Find how many times a given circularly sorted array is rotated
# Time complexity: O(logn)
# Space complexity: O(1)
###
def count_rotations(array)
  size = array.size
  start = 0
  finish = size - 1
  while start <= finish
    return start if array[start] <= array[finish]
    mid = start + (finish-start)/2
    nxt = (mid+1)%size
    prev = (mid+size-1)%size
    if array[mid] <= array[nxt] && array[mid] <= array[prev]
      return mid
    elsif array[mid] <= array[finish]
      finish = mid-1
    else
      start = mid+1
    end
  end
  return -1
end

puts "Element is at position: #{find_element([12,10,9,2,3,4,5,6], 4)}"
puts "Given array is circular sorted: #{count_rotations([12,10,9,2,3,4,5,6])}"
