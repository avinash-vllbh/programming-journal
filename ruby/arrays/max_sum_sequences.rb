###
# Find the maximum sub sequence sum in an array of integers
# Time complexity: O(n) [we are parsing the array only once]
# Space complexity: O(1)
###
def max_sum_sequence(array)
  p array
  max_sum = 0 #sum of max sub sequence
  sum = 0 #sum of each subsequence
  # Keep track the sequence start and end positions
  sequence_start = 0
  sequence_end = 0
  temp_sequence_start = 0;  #Initialized to start of the array
  array.each_with_index do |value, index|
    if sum+value > 0
      sum = sum+value
    else
      # resetting sum to zero
      sum = 0
      # making next index as sequence start
      temp_sequence_start = index + 1
    end
    if max_sum < sum
      #changing max sub sequence sum
      max_sum = sum
      #max sum is being changed thus,
      # =>  sequence start is pointed to where the current sequence started
      sequence_start = temp_sequence_start
      sequence_end = index
    end
  end
  puts "Max sub sequence sum: #{max_sum}"
  puts "start: #{sequence_start}, end: #{sequence_end}"
end

max_sum_sequence([4,3,-2,5,-3,-6,2])
max_sum_sequence([-1,2,3,5,-2]) 
max_sum_sequence([-1,-2,-3,-3,-2]) # All negative values would retrun everything as zero

require 'pry'
###
# Find the maximum sub sequence sum in an array of integers using Divide and conquer strategy
# Time complexity: O(nlogn) [we are dividing it into two halfs and processing both halfs each time]
#         T(n) = c1n + c2nlogn => O(n) + O(nlogn) => O(nlogn)
# Space complexity: O(1)
###
def max_sum_sequence_dc(array)
  if array.size == 1
    return array.first
  end
  mid = array.size/2
  # Get the max subsequence sum of left half
  left_max_sum = max_sum_sequence_dc(array[0..mid-1])
  # Get the max subsequence sum of right half
  right_max_sum = max_sum_sequence_dc(array[mid..-1])
  left_sum = -999
  right_sum = -999
  # Get the best possible sum of left half
  sum = 0
  (mid-1).downto(0) do |i| # To have the count backwards
    sum = sum + array[i] 
    left_sum = [left_sum,sum].max
  end
  # Get the bset possible sum of right half
  sum = 0
  (mid..array.size-1).each do |i|
    sum = sum + array[i]
    right_sum = [right_sum, sum].max
  end
  # Return the maximum of three possible sub sequences
  return [left_max_sum, right_max_sum, left_sum+right_sum].max
end
dc_max = max_sum_sequence_dc([4,3,-2,5,-3,-6,2])
puts "Max sum using Divide and conquer: #{dc_max}"
dc_max = max_sum_sequence_dc([-1,2,3,5,-2]) 
puts "Max sum using Divide and conquer: #{dc_max}"
dc_max = max_sum_sequence_dc([-1,-2,-3,-3,-2])
puts "Max sum using Divide and conquer: #{dc_max}"