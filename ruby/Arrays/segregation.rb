# Sort an array such that odd numbers are in front of even numbers and their relative order doesn't change.

# Segregate array with odds infront of evens without order
# swap the first even element from left and first odd element from right
# Time complexity: O(n)
# Space complexity: O(1) => Auxialiary space doesn't increase with array size.
def arraySegNoOrder(array)
  puts "given array is:"
  p array
  left = 0 
  right = array.size-1
  while left < right
    # Walk the array from left and get the next even number
    while array[left] % 2 == 1 && left < right
      left += 1
    end
    # Walk the array from right and get the next odd number
    while array[right] % 2 == 0 && left < right
      right -= 1
    end
    # swap the above two numbers such that odd comes to left and even goes to right
    temp = array[left]
    array[left] = array[right]
    array[right] = temp
  end
  puts "segrated array with odds infront of evens"
  p array
end
arraySegNoOrder([3,4,8,9,11,10,6,1,5])

# Segregate array with odds infront of evens also retaining the order of odds and evens
# Parse the array once for odd's and once more for even's
# Space complexity: O(n)
# Time complexity: O(n) => Using auxiliary array of size same as input array
def arraySegWithOrder(array)
  puts "given array is:"
  p array
  seg_array = []
  array.each do |i|
    if i%2 == 1
      seg_array.push(i)
    end
  end
  array.each do |i|
    if i%2 == 0
      seg_array.push(i)
    end
  end
  puts "segrated array with odds infront of evens and retaining order"
  p seg_array
end
arraySegWithOrder([3,4,8,9,11,10,6,1,5])