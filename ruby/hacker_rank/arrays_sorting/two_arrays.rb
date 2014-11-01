###
# https://www.hackerrank.com/challenges/two-arrays
#
# Read from STDIN
require 'pry'
test_cases = gets.to_i
test_cases.times do
  # read the array size and limit
  n, k = gets.split(" ").map {|i| i.to_i}
  arr1 = gets.split(" ").map {|i| i.to_i}
  arr2 = gets.split(" ").map {|i| i.to_i}
  c1 = c2 = 0
  n.times do |i|
    if arr1[i] >= k
      c1 = c1 + (arr1[i] - k)
    else
      c2 = c2 - arr1[i]
    end 
  end
  binding.pry
  n.times do |i|
    if k - arr2[i] >= 0
      c2 = c2 + arr2[i]
    else
      c1 = c1 + (arr2[i] - k)
    end
  end
  binding.pry
  if c1 >= 0 && c2 >= 0
    puts "YES"
  else
    puts "NO"
  end
end