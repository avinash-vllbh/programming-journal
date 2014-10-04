# Longest alternating subsequence - Algorithm from wikipedia
# Given an array of integers find the longest possible alternating subsequence in the array

def longest_zig_zag(array)
  puts "Given array: #{array}"
  las_array = Array.new(array.size){Array.new}
  las_array[0][0] = array[0] # LIS of array of size 0 would be just that element
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