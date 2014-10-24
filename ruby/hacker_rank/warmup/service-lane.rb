##
# service-lane - https://www.hackerrank.com/challenges/service-lane
# 
# Read the inputs from STDIN
input = gets.chomp.split(" ")
# Determine length of freeway and number of test cases
freeway, test_cases = input.map{ |i| i.to_i }

# Read the widths for each segment of freeway
input = gets.chomp
widths = input.split(" ").map{ |i| i.to_i }

# Read the test cases with entry and exit points
# Find the result of each test case
result = []
test_cases.times do
  entry, exit = gets.chomp.split(" ").map{ |i| i.to_i }
  min = 3 
  (entry..exit).each do |position|
    if widths[position].to_i < min
      min = widths[position].to_i
    end
  end
  result.push(min)
end
puts result