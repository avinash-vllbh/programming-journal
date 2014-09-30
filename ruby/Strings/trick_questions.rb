require 'pry'
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
  terminology = {1 => "one",2 => "two",3 => "three",4 => "four",5 => "five",6 => "six",7 => "seven",
                  8 => "eight",9 => "nine"}
  puts terminology
  str = ""
  if number % 1000 == 0
    str << "One thousand"
    number = number % 1000
  elsif number % 100 != number
    str << terminology[number/100] << " hundered"
    number = number - ((number/100) * 100)
  end
  if number%10 != number
    str << " " << terminology[number/10]
    number = number - ((number/10) * 10)
  end
  if number != 0
    str << " " << terminology[number]
  end
  puts str
end

numberToText(451)


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

printAll()

###
# Switch two words

def switch(sentence, i, j)
  words = sentence.split
  words[i], words[j] = words[j], words[i]
  sentence = words.join(" ")
  return sentence
end