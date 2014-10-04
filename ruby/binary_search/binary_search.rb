require 'pry'
###
# Search by reducing the search space by half each time
# Time complexity: O(logn)
# Space complexity: O(1)
###
def iterative_search(array, size, x)
  start = 0
  finish = size-1
  while start <= finish
    mid_index = (start+finish)/2
    if array[mid_index] == x
      return mid_index
    elsif x < array[mid_index]
      finish = mid_index - 1
    else
      start = mid_index + 1
    end
  end
  return -1
end

###
# Search by reducing the search space by half each time
# Time complexity: O(logn)
# Space complexity: O(1)
###
def recursive_search(array, start, finish, x)
  return -1 if start > finish
  mid = (start+finish)/2
  if array[mid] == x
    return mid
  elsif x < array[mid]
    return recursive_search(array, start, mid-1, x)
  else
    return recursive_search(array, mid+1, finish, x)
  end
end

###
# Search by reducing the search space by half each time and retrun the first occurance of search element
# Time complexity: O(logn)
# Space complexity: O(1)
###
def find_first_occurance(array, size, x)
  start = 0
  finish = size-1
  result = -1
  while start <= finish
    mid_index = (start+finish)/2
    if array[mid_index] == x
      # return mid_index  => we don't return here since a duplicate of it could be before it
      result = mid_index
      finish = mid_index-1
    elsif x < array[mid_index]
      finish = mid_index - 1
    else
      start = mid_index + 1
    end
  end
  return result
end

###
# Search by reducing the search space by half each time and return the last occurance of search element
# Time complexity: O(logn)
# Space complexity: O(1)
###
def find_last_occurance(array, size, x)
  start = 0
  finish = size-1
  result = -1
  while start <= finish
    mid_index = (start+finish)/2
    if array[mid_index] == x
      # return mid_index  => we don't return here since a duplicate of it could be before it
      result = mid_index
      start = mid_index+1
    elsif x < array[mid_index]
      finish = mid_index - 1
    else
      start = mid_index + 1
    end
  end
  return result
end

puts "iterative search result --> pos: #{iterative_search([2,5,7,8,9,12,15], 7, 8)}"
puts "recursive search result --> pos: #{recursive_search([2,5,7,8,9,12,15], 0, 6, 8)}"

puts "First occurance search result --> pos: #{find_first_occurance([8,8,8,8,8,9,12,15], 8, 8)}"
puts "last occurance search result --> pos: #{find_last_occurance([8,8,8,8,8,8,12,15], 8, 8)}"

