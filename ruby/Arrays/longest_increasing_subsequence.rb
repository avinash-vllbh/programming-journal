# Longest increasing subsequence
# Given an array of integers find the longest possible increasing subsequence in the array
require 'pry'
# Time complexity: O(n^2)

def lis(array)
  puts "Given array: #{array}"
  lis_array = Array.new(array.size){Array.new}
  lis_array[0][0] = array[0] # LIS of array of size 0 would be just that element
  for i in 1..array.size-1
    for j in 0..i-1
      if array[j] < array[i] && lis_array[i].size < lis_array[j].size + 1 # Have the longest matching subsequence from before.
        lis_array[i] = Array.new(lis_array[j])
      end
    end
    lis_array[i] << array[i]
  end
  i = 0
  max_seq_size = 0
  lis_array.each do |lis_row|
    max_seq_size = lis_row.size if lis_row.size > max_seq_size
    puts "Longest substring until array position #{i}: #{lis_row}"
    i += 1
  end
  puts "longest increasing sequence size: #{max_seq_size}"
end

lis([3,0,-1,6,4,8,11])
lis([3,2,6,4,5,1])

# Effecient implementation for longest increasing sequence
# Time complexity: O(nlogn)
# => Uses binaray search to find the least element than the current element.
