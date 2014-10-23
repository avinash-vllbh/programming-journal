##
# https://www.hackerrank.com/challenges/chocolate-feast
# N - total money
# C - price of each chocolate
# M - Total wrappers needed for 1 free chocolate
# Input
#   10 2 5
# Output
#   6 
test_cases = gets.to_i
test_cases.times do
  # Assign n, c, m values from the input
  n, c, m = gets.chomp.split(" ").map { |i| i.to_i  }

  chocolates = 0
  chocolates = n/c
  wrappers = n/c
  # As long as wrappers can get me free chocs
  while wrappers >= m
    # Quotient would be free chocoloates and rem would be remaining wrappers
    free_chocolates, wrappers = wrappers.divmod(m)
    chocolates = chocolates + free_chocolates
    # Free chocs whould have wrappers too!!!
    wrappers = wrappers + free_chocolates
  end
  puts chocolates
end
