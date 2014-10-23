##
# https://www.hackerrank.com/challenges/the-love-letter-mystery
# Find the minimum number of operations required to convert a given string into a palindrome
# 
# Read from STDIN
test_cases = gets.chomp.to_i
test_cases.times do
  operations = 0
  str = gets.chomp
  (str.size/2).times do |i|
    # To make it a palindrom first half of string should match the reverse of last half of string
    # Calculate the ordinal difference between two characters for them to be equal
    # Since we can reduce atleast one char to another since it would be higher than other
    operations += (str[i].ord - str[str.size-1-i].ord).abs
  end
  puts operations
end