require 'pry'
###
# Print out the text form of numbers from 1 to 1000.
# Eg input: 20 => output: "twenty"

def number_to_text(number)
  begin
    number = Integer(number)
  rescue ArgumentError
    return ArgumentError.new("Invalid argument given")
  end
  ones = { 1 => "one",2 => "two",3 => "three",4 => "four",5 => "five",6 => "six",7 => "seven",
                  8 => "eight",9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve",13=>"thirteen",
                  14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 
                  18 => "eighteen", 19 => "nineteen" }
  tens = { 20 => "twenty", 30 => "thirty", 40 => "fourty", 50 => "fifty", 60 => "sixty",
           70 => "seventy", 80 => "eighty", 90 => "ninety", 100 => "hundred"}
  str = []
  case
  when number < 0
    puts "Invalid number"
  when number < 20
    str << ones[number]
  when number < 100
    quo,rem = number.divmod(10)
    str << tens[quo*10]
    str << ones[rem]
  when number < 1000
    quo,rem = number.divmod(100)
    str << ones[quo]
    str << tens[100]
    if rem != 0
      str << "and"
      quo,rem = rem.divmod(10)
      str << tens[quo*10]
      str << ones[rem]
    end
  when number == 1000
    str << "One Thousand"
  when number > 1000
    str << "You gave me #{number} - No idea what to do with it"
  end
  return str.join(" ")
end

###
# Print the integer equivalents of a given roman numeral
def roman_to_integer(string)
  return nil if string.empty? || string.nil?
  string.upcase!
  values = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100}
  precedence = {"I" => 1, "V" => 2, "X" => 3, "L" => 4, "C" => 5}
  number = values[string[string.size-1]]
  if string.size > 1
    for x in 0..string.size-2
      i = string.size-2-x
      begin
        if precedence[string[i]] >= precedence[string[i+1]]
          number = number + values[string[i]]
        else
          number = number - values[string[i]]
        end
      rescue NoMethodError
        return NoMethodError.new("Invalid roman numeral")
      end
    end
  end
  return number
end

###
# Length of longest substring without repeating characters
# E.g. longest substring without repeating characters for abcabcbb is "abc" length is 3
# Keep track if we have a char as visited by using a hash
# Time complexity: O(n)
def longest_sub_string(string)
  return string.size if string.size <= 1
  # To keep track of longest substring without repeating characters
  hash = Hash.new
  max_len = 0
  max_start = 0
  max_finish = 0
  # To keep track of current substring without repeating characters
  len = 0
  start = 0
  finish = 0
  while finish < string.size
    if hash[string[finish]].nil? # Char is not visited so-far for this sub string
      # Add to hash as visited and increase the length
      hash[string[finish]] = finish
      finish += 1
      len += 1
    else # Found a reapeting character in current substring
      # Check if current substring is max length
      # Again start looking from next char of visited's first time, since
      # Until that we have already found the max possible unique substring 
      if len > max_len
        max_len = len
        max_start = start
        max_finish = finish
      end
      len = 0
      start = finish = hash[string[finish-1]]+1
      hash = {}
    end
  end
  # puts string[max_start..max_finish-1] #print the substring tooo
  return max_len
end

###
# Print 1 to 1000 without using any loops or conditional statements
###
def pp()
  @collection ||= []
  @i ||= 0
  @collection << @i
  @i += 1
end
def a()
  pp()
  pp()
  pp()
  pp()
  pp()
end
def b()
  a();a();a();a();a();
end
def c()
  b();b();b();b();b();
end
def print_all()
  c();c();c();c();c();c();c();c();
  pp()
  return @collection
end
require 'pry'
###
# Replace all occurances of given pattern to X, for example given that "abc", replace 
# "abcdeffdfegabcabc" to "XdeffdfegX"
# catch is to replace even contiguous patterns with single replacement
# Time complexity: O(mn)
# Space complexity: O(1)
def replace_matching_pattern(string, pattern, replacement)
  return string if string.nil? || pattern.nil? || replacement.nil?
  pStart = -1
  pEnd = -1
  index = 0
  # Iplace replacement - String content could be changed during execution
  # thus checking until we reach the end
  while(string[index] != nil)
  # string.each_char.with_index do |c, i|
    if string[index] == pattern[0]
      pStart = index
      # get the end of the matching pattern
      pEnd = get_match_end(string, pattern, pStart)
      if pStart != -1 && pEnd != -1
        string[pStart..pEnd] = replacement
      end
      pStart = -1
      pEnd = -1
    end
    index += 1
  end
  return string
end

# Return the end index of the matching pattern to be replaced in the string
def get_match_end(string, pattern, start)
  finish = start + pattern.size-1
  matchEnd = -1
  unless string[finish] == nil
    while string[start..finish] == pattern
      matchEnd = finish
      break if string[finish + pattern.size] == nil
      start = finish + 1
      finish = finish + pattern.size
    end
  end
  return matchEnd
end

###
# Switch two words in a sentence
###
def switch(sentence, i, j)
  words = sentence.split
  words[i], words[j] = words[j], words[i]
  sentence = words.join(" ")
  return sentence
end

###
# Find the number of unique strings in a collection of strings
# Time complexity: O(n)
# Space complexity: O(n)
# Auxiliary space increase with increase of input size, to store the hash
def count_unique(array)
  return array.size if array.size <= 1
  hash = Hash.new
  array.each do |key|
    # Add element to hash if it's not already there
    if hash[key].nil?
      hash[key] = true
    end
  end
  return hash.keys.size
end

def get_max_possible_string(number)
  maxStr = ""
  for x in 1..number
    maxStr = maxStr + x.to_s
  end
  return maxStr.length
end
###
# given a string with numbers from 1 to 250 and a missing number
# find the missing number
def missing_number(string, max)
  max_len = get_max_possible_string(max)
  digits = max_len - string.length
  
  p "missing #{max_len - string.length} digit number"
end
# missing_number("3412678910", 10)