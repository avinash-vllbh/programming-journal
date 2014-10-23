###
# Using merge of the two sorted arrays and finding the k/2 element in the array.
# where k = m(size of a1)+n (size of a2)
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
  return result[median_pos]
end

###
# Using divide and conquer to find median of two arrays that are of equal size
# Time complexity: O(logn + logm)
###
def median_sorted_arrays_dc(arr1, arr2)
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
    median_sorted_arrays_dc(arr1[pos_med1+1..arr1.size-1], arr2[0..pos_med2-1])
  else  # Median will be in left half of A1 and right half of A2
    median_sorted_arrays_dc(arr1[0..pos_med1-1], arr2[pos_med2+1..arr2.size-1])
  end
end