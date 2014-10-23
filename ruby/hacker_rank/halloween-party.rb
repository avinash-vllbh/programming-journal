##
# https://www.hackerrank.com/challenges/halloween-party
# Input Format
# The first line contains an integer T, the number of test cases. T lines follow.
# Each line contains an integer K

# Output Format
#   T lines. 
#   Each line contains an integer that denotes the maximum number of pieces that can be obtained for each test case.
#   
#   E.g. Input 
#   2
#   5
#   8
#   
#   Output
#   6
#   16

# Read inputs from STDIN
test_cases = gets.chomp.to_i
test_cases.times do
  input = gets.chomp.to_i
  pieces = (input / 2) * (input - input/2)
  puts pieces
end