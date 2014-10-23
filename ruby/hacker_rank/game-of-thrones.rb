##
# https://www.hackerrank.com/challenges/game-of-thrones
# Constraints 
#   1<=length of string <= 10^5 
#   Each character of the string is a lowercase English letter.
#   
# Enter your code here. Read input from STDIN. Print output to STDOUT
string = gets.chomp 
str_arr = string.chars.sort # Sort the input string, so that same char occurs consecutively
pos = 0
anomaly = 0
while pos < str_arr.size && anomaly < 2
  if str_arr[pos] == str_arr[pos+1]
    pos = pos + 2
  else
    anomaly = anomaly + 1
    pos = pos + 1
  end
end
# If there are more than one anomaly then it can't be a palindrome
# Since palindrome has to have each char occur twice
# except if size is odd one char can come in only once
if anomaly < 2
    puts "YES"
else
    puts "NO"
end