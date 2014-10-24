##
# https://www.hackerrank.com/challenges/cut-the-sticks
#
# Read from STDIN
size = gets.to_i
sticks = gets.chomp.split(" ").map{ |i| i.to_i }

while(sticks.size > 0)
  puts sticks.size
  min = sticks.min
  # Remove all the elements that are equal to min
  sticks = sticks - [min]
  # Cut each stick as the same length as min stick
  sticks = sticks.map { |i| i - min }
end
