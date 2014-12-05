# You are given a number N. Find the digits in this number that exactly divide N and display their count. 
# For N = 24, there are 2 digits - 2 & 4. Both these digits exactly divide 24. So our answer is 2

# Using each_char and then type-casting each char to int.
# 
def find_digits_count_string_operations(input)
  digits = 0
  n = input.to_i
  input.each_char do |c|
    c = c.to_i
    unless c == 0
      q, r = n.divmod(c)
      if r == 0
        digits += 1
      end
    end
  end
  puts digits
end

def find_digits_count_int_operations(input)
  input = input.to_i
  digits = 0
  n = input
  while n != 0
    n, r = n.divmod(10)
    unless r == 0
      quo, rem = input.divmod(r)
      if rem == 0
        digits += 1
      end
    end
  end
  puts digits
end


# Read the input from STDIN
test_cases = gets.chomp.to_i
test_cases.times do
  input = gets.chomp
  find_digits_count_string_operations(input)
  find_digits_count_int_operations(input.to_i)
end

# require 'benchmark'
# TEST_COUNT = 1_000_000

# Benchmark.bmbm do |b|
#   b.report(:find_digits_count_string_operations) { TEST_COUNT.times { find_digits_count_string_operations("12523475676") } }
#   b.report(:find_digits_count_int_operations) { TEST_COUNT.times { find_digits_count_int_operations("12523475676") } }
# end