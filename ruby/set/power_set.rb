###
# Print all possible subsets of a given set of numbers => print PowerSet
# Input: [2,3,4]
# Output:[],[2],[3],[2,3],[4],[2,4],[3,4],[2,3,4]
# If a set is of size n, size of power set is 2**n
# set of size 3 ==> power set size is 8
# Time complexity is TC: O(2**n)

def print_power_set(array)
  power_set_size = 2**array.size
  power_set_size.times do |i|
    subset = []
    j = 0
    number = i
    while number != 0
      subset << array[j] if number & 1 == 1
      number >>= 1
      j += 1
    end
    p subset
  end
end

print_power_set([2,3,4])