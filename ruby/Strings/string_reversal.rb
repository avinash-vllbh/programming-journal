###
# Reverse a string
# Time complexity: O(n)

def reverse(string)
  for i in 0...string.size/2
    string[i], string[string.size-i-1] = string[string.size-i-1], string[i]
  end
  return string
end
# reverse("test")
# reverse("hello")
# reverse("avinash")


###
# Reverse all the words in a given sentence
#       Reverse the entire sentence as a string
#       Then reverse each word by word in sentence to get back to original words in sentence
#       Just the words are reversed now
# Time complexity: O(n)
# Space complexity: O(1)
#        Auxiliary space doesn't grow with input size
def reverseWords(sentence)
  sentence = reverse(sentence)
  words = sentence.split(/ /)
  words.map! { |word| reverse(word) }
  words.join(" ")
end 

# puts reverseWords("hi avi how are you")
 

###
# Find all permutations of a string
#    E.g "dog" => ["dog", "dgo", "odg", "ogd", "gdo", "god"]
# Strategy recursion
#       Fix char at one position and permutate the rest of the string
# Time complexity: O(n*n!)
# Space complexity: O(n*n!)
# => Auxiliary space increases to store the array of permutations
require 'pry'
def stringPermutations(string)
  return [string] if string.size <= 1
  permutations = []
  for i in 0...string.size
    # Duplicating string to str since,
    # str = string => would just point str to string object and str.slice would affect string too
    str = string.dup
    fix = str.slice!(i) # Removes the char at index i and retrun the removed char
    perms = stringPermutations(str)
    perms.each do |perm|
      # binding.pry
      permutations << fix + perm
    end
  end
  return permutations
end

# perms = stringPermutations("dogs")
# p perms

###
# Find all permutations of a string
#    E.g "dog" => ["dog", "dgo", "odg", "ogd", "gdo", "god"]
# Strategy recursion
#       Fix char at one position and permutate the rest of the string
# Time complexity: O(n*n!)
# Space complexity: O(1)
#         Auxiliary space doesn't grow with input string size
def strPermEfficient(string, k, n)
  if k == n
    puts string
  else
    for i in k..n
      string[i], string[k] = string[k], string[i] # fixing one element
      strPermEfficient(string, k+1, n) # calling perm on remaining string
      string[k], string[i] = string[i], string[k]  # Swap back the previously swapped elements
    end
  end
end

# strPermEfficient("dogs", 0, 3)



