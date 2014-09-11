require 'pry'

# Uses quick sort algorithm to sort an array
# Time complexity: O(nlogn)
# Space complexity: O(1) => Since it's inplace. Auxiliary space doesn't grow with input size.
def quick_sort(array, start, finish)
  return array if start > finish # Base case to end recursion - at this point array is not valid
  pindex = partition(array, start, finish)
  quick_sort(array, start, pindex-1)
  quick_sort(array, pindex+1, finish)
end

# Select the last element of array as pivot each time
# rearrange the array such that all elements less than pivot are to it's left
def partition(array, start, finish)
  pivot = array[finish]
  pindex = start
  for i in start..finish-1
    if array[i] <= pivot
      # swap if element is lesser than pivot
      array[i],array[pindex] = array[pindex], array[i]
      pindex += 1
    end
  end
  #swap the element at pivot index with the pivot
  array[pindex], array[finish] = array[finish], array[pindex]
  return pindex
end
p [3,4,8,9,11,10,5,1,6]
p quick_sort([3,4,8,9,11,10,5,1,6], 0, 8)