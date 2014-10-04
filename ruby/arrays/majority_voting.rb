require 'pry'
###
# Below method implements Bayer Moores majority voting algorithm to find the majority element in a sequence.
# Majority element is said to be more that atleast n/2 elements in the array
# We determine the majority element using two passes of the array
# Time complexity: O(n)
# Space complexity: O(1) --> Auxiliary space doesn't increase with input size
def find_by_bayer_moore(array)
  candidate = 0
  count = 0
  # Pass 1 - Find the candidate maintaing a count 
  for i in 0..array.size-1
    # binding.pry
    candidate = array[i] if count == 0
    if array[i] == candidate
      count += 1
    else
      count -= 1
    end
  end
  counter = 0
  # Pass 2 - To verify that the candidate from pass1 is acutally a majority
  array.each do |i|
    if i == candidate
      counter += 1
    end
  end
  if counter > array.size/2
    puts "Found majority element is: #{candidate}"
  else
    puts "No majority element"
  end
end

find_by_bayer_moore([5, 5, 0, 0, 0, 5, 0, 0, 5])