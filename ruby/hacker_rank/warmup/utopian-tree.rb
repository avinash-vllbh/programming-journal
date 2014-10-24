##
# Utopian challege on hacker rank - https://www.hackerrank.com/challenges/utopian-tree
# Constraints 
#   1 <= T <= 10 
#   0 <= N <= 60
# Output Format 
# For each test case, print the height of the Utopian tree after N cycles.
#   Sample Input #00:
#   2
#   3
#   4
#   Sample Output #00:
#   6
#   7
#
begin
  test_cases = gets.chomp.to_i # Read number of test cases
  if test_cases.between?(1, 10)
    cycles = []
    result = []
    # Read the cycles as stdin
    test_cases.times do
      cycle = gets.chomp.to_i
      if cycle.between?(0, 60)
        cycles.push(cycle)
      else
        puts ArgumentError.new("Test cases should be between 1 and 10")
      end
    end
    # Calculate what the growth would be at each cycle
    cycles.each do |cycle|
      if cycle == 0 
        result.push(1) # If cycle is 0 => just planted so 1
      elsif cycle == 1
        result.push(2) # If cycle is 1 => just doubled so 2
      else
        ##
        # pattern emerges when you look at values from 2,3,4,5...
        # let x be 1 (initial growth of tree)
        #   2 => 2x+1
        #   3 => 4x+2
        #   4 => 4x+3
        #   5 => 8x+6
        #   .
        #   .
        #   9 => 32x+30
        #   If N is even => So each cycles value is 2**(number/2)x + (2**(number/2) - 2) 
        #   If N is odd => So each cycles value is 2**(number+1/2)x + (2**(number+1/2) - 1) 
        if cycle%2 == 1
          cycle += 1
          rem = cycle/2
          result.push(2**rem + 2**rem - 2)
        else
          rem = cycle/2
          result.push(2**rem + 2**rem - 1)
        end
      end
    end
    result.each { |res| puts res }
  else
    puts ArgumentError.new("Test cases should be between 1 and 10")
  end
rescue ArgumentError => e
  puts e
end