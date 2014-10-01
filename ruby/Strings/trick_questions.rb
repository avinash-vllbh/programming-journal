require 'pry'
###
# Find the number of unique strings in a collection of strings
#
def countUnique(array)
  p array
end

array = %w(hi hello hw how are you hi hw heello)
# countUnique(array)

def getMaxPossibleString(number)
  maxStr = ""
  for x in 1..number
    maxStr = maxStr + x.to_s
  end
  return maxStr.length
end
###
# given a string with numbers from 1 to 250 and a missing number
# find the missing number
def missingNumber(string, max)
  maxLen = getMaxPossibleString(max)
  digits = maxLen - string.length
  
  p "missing #{maxLen - string.length} digit number"
end
# missingNumber("3412678910", 10)

###
# Print out the text form of numbers from 1 to 1000.
# Eg input: 20 => output: "twenty"

def numberToText(number)
  return "Invalid" if number > 1000
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
  end
  puts str.join(" ")
end

numberToText(50)
numberToText(10)
numberToText(55)
numberToText(255)
numberToText(999)

###
# Print 1 to 1000 without using any loops or conditional statements
###
@i = 0;

def pp()
  print @i
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
def printAll()
  c();c();c();c();c();c();c();c();
end

# printAll()


###
# Switch two words in a sentence
###
def switch(sentence, i, j)
  words = sentence.split
  words[i], words[j] = words[j], words[i]
  sentence = words.join(" ")
  return sentence
end