# https://www.hackerrank.com/challenges/make-it-anagram
# Given two strings (they can be of same or different length)
# find out the minimum number of character deletions required to make two strings anagrams. 
# Any characters can be deleted from any of the strings
# Sample Input
#   s1 = "fcrxzwscanmligyxyvym"
#   s2 = "jxwtrhvujlmrpdoqbisbwhmgpmeoke"
# Output: 30
# 
# Read two strings from STDIN
s1 = gets.chomp.split("")
s2 = gets.chomp.split("")
hash = Hash.new(0)
# Increment the count of each char for string 1
s1.each do |x|
  hash[x] += 1
end
# Decrease the count of each char for string 2
s2.each do |x|
  hash[x] -= 1
end
deletions = 0
# No of deletions would be the sum of absolutes of each value in the hash
hash.each_value {|value| deletions = deletions + value.abs}
puts deletions