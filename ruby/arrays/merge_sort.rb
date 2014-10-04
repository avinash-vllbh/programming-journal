require 'pry'

# Time complexity: O(nlogn)
# Space complexity: O(nlogn)
def merge_sort(array)
  return array if array.size < 2
  mid = array.size/2
  left = array[0,mid]
  right = array[mid..-1]
  left = merge_sort(left)
  right = merge_sort(right)
  merge(left, right)
end

def merge(left, right)
  result = []
  # Compare and push until one of left or right is empty
  until left.empty? || right.empty?
    if left.first <= right.first
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right #Either left or right array are empty
end

# Time complexity: O(mlogm) + O(nlogn) + O(m+n)
def two_unsorted_to_sorted_single(first, second)
  puts "first array is #{first}"
  first = merge_sort(first)
  puts "second array is #{second}"
  second = merge_sort(second)
  puts "Merged into single sorted array"
  p merge(first, second)
end

two_unsorted_to_sorted_single([3,4,8,9,11,10,5,1,6], [1,7,20,5,6])