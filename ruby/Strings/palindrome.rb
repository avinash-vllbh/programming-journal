require 'pry'
###
# check if a string is a palindrome
# Time complexity: O(n/2)
# Space complexity: O(1)
def isPalindrome(string)
  for i in 0...string.size
    break if i > string.size/2
    return "false" unless string[i] == string[string.size-i-1]
  end
  return "true"
end

# puts isPalindrome("lol")
# puts isPalindrome("trert")

# Longest palindrome substring in a string
def longestPalindromeDP(string)
  n = string.size
  lbegin = 0
  maxLen = 0
  array = Array.new(n){Array.new(n)}
  # A char in itself is a palindrome
  for i in 0...n
    array[i][i] = true;
  end
  # Two consecutive letters if equal are a palindrom
  for i in 0...n-1
    if string[i] == string[i+1]
      array[i][i+1] = true
    end
  end
  # Find substring of length more than three
  for len in 3..n
    for i in 0...n-len+1
      j = i+len-1
      if string[i] == string[j] && array[i+1][j-1]
        binding.pry
        array[i][j] = true
        lbegin = i
        maxLen = len
      end
    end
  end
  # print the array starting from lbegin to maxLen of the substring
  p string[lbegin, maxLen]
end

longestPalindromeDP("cayak")
longestPalindromeDP("testingnight")
# Check if a given string is a rotation of a palindrome
                                                                        