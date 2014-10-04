require 'pry'
###
# Using merge of the two arrays and finding the k/2 element in the array. where k = m(size of a1)+n (size of a2)
# Time complexity: O(m+n)
###
def median_sorted_arrays(array1, array2)
  result = []
  median_pos = (array1.size + array2.size)/2
  until array1.empty? || array2.empty?
    if array1.first < array2.first
      result << array1.first
      array1.shift
    else
      result << array2.first
      array2.shift
    end
  end
  result = result + array1 + array2
  return "Median of given array's is: #{result[median_pos]}"
end

puts "Using linear method"
puts median_sorted_arrays([3,7,9,11,12], [4,6,8,11,13])
puts median_sorted_arrays([3,5,7,9,10,11,13], [4,6,8,10,20,22,23])
puts median_sorted_arrays([3,4], [4,5])

###
# Using divide and conquer to find median of two arrays are of equal size
# Time complexity: O(logn + logm)
###
def median_sorted_arrays_same_size(arr1, arr2)
  size = arr1.size
  return -1 if size <= 0
  return (arr1.first+arr2.first)/2 if size == 1
  return ([arr1.first, arr2.first].max + [arr1[1], arr2[1]].min)/2 if size == 2
  pos_med1 = arr1.size/2
  pos_med2 = arr2.size/2
  # If both are equal even though we form a new array merging those two this would still be median of those two
  if arr1[pos_med1] == arr2[pos_med2]
    return arr1[pos_med1]
  elsif arr1[pos_med1] < arr2[pos_med2] # Median will be in right half of A1 and Left half of A2
    median_sorted_arrays_same_size(arr1[pos_med1+1..arr1.size-1], arr2[0..pos_med2-1])
  else  # Median will be in left half of A1 and right half of A2
    median_sorted_arrays_same_size(arr1[0..pos_med1-1], arr2[pos_med2+1..arr2.size-1])
  end
end

puts "Using divide and conquer method"
puts median_sorted_arrays_same_size([3,7,9,11,12], [4,6,8,11,13])
puts median_sorted_arrays_same_size([3,5,7,9,10,11,13], [4,6,8,10,20,22,23])
puts median_sorted_arrays_same_size([3,4], [4,5])