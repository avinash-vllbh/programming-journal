# CtCI 1.1
#   "Implement an algorithm to determine if a string has all unique characters.
#    What if you cannot use additional data structures?"


# Implementation 1
# Use array's unique method and compare size to original string size
# Not sure time complexity of this solution
def has_dup?(s)
  s = s.split('')
  s.uniq.size != s.size
end

# Implementation 2 
# Keep track of unique characters in hash. Iterate over characters to see if uniq.
# Is this is O(n) time complexity in Ruby?
def uniq_chars?(s)
  checked = {}
  s.each_char do |char|
    return false if checked[char]
    checked[char] = true
  end
  true
end

# Implementation 3
# Sort characters first, then check if next character is equal to check uniqueness
# Is this O(n log n) time complexity in Ruby?
def sort_check_unique(s)
  s = s.chars.sort.join
  (0...s.size).each do |i|
    return false if s[i] == s[i+1]
  end
  true
end

require 'benchmark'
TEST_COUNT = 1_000_000

Benchmark.bmbm(5) do |b|
  b.report(:has_dup?) { TEST_COUNT.times { has_dup?('world') } }
  b.report(:uniq_chars?) { TEST_COUNT.times { uniq_chars?('world') } }
  b.report(:sort_check_unique) { TEST_COUNT.times { sort_check_unique('world') } }
end