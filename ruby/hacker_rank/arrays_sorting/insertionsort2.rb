#!/usr/bin/ruby
def  insertionSort(array)
  for i in 1..array.size-1
    current_element = array[i] # pick the current element
    j = i - 1
    # Push the elements greater than current element to right
    while j >= 0 && array[j] > current_element
      array[j+1] = array[j]
      j -= 1
    end
    array[j+1] = current_element
    array.each {|i| print "#{i} "}
    print "\n"
  end
end
# Read array size and array from STDIN
# call insertionSort on the array
cnt = gets.to_i
ar = gets.strip.split(" ").map! {|i| i.to_i}
insertionSort(ar)