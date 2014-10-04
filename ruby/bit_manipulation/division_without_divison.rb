###
# Implement division without using division or mod operators
# => Idea is to shift the divisor everytime once until it is greater than numerator
# shifting a number by k ie., n << k is equal to n*2^k
# E.g., 15/3
# 3 << 0 => 3 * 1 = 3, 15 > 3
# 3 << 1 => 3 * 2 = 6, 15 > 6
# 3 << 2 => 3 * 4 = 12, 15 > 12
# 3 << 3 => 3 * 8 = 24, 15 < 24
#           Multiple of 3 i.e. one shift less than 15 is 12
#           No of shift to get 12 is 2, add 1 << 2 to quotient
#           substract 12 from given number, ie., num = 15-12 = 3
# Current numerator is 3
# Now repeat the process again untill numerator or remainder is less than divisor    
###

def division(num, divisor)
  quotient = 0
  remainder = num
  shift = 0
  while remainder >= divisor
    if remainder < (divisor << shift)
      # binding.pry
      # Negate the shifted divisor from remainder and add add to shifts done to quotient
      remainder -= (divisor << (shift-1)) 
      quotient += (1 << (shift-1)) # Increment quotient for above shifts
      shift = 0
    end
    shift += 1
  end
  puts "quotient: #{quotient} and remainder: #{remainder}"
end

division(16,3)