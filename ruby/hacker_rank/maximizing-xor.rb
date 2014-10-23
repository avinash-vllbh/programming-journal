#!/usr/bin/ruby
##
# https://www.hackerrank.com/challenges/maximizing-xor
# Given two integers: L and R,
# find the maximal values of A xor B given, L ≤ A ≤ B ≤ R
def maxXor(l, r)
  max = 0
  (l..r).each do |a|
    (a+1..r).each do |b|
      max = [max, a ^ b].max
    end
  end
  return max
end
# Read the inputs from STDIN
l = gets.to_i
r = gets.to_i
print maxXor(l, r)