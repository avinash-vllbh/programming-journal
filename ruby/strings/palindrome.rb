###
# check if a string is a palindrome
# Time complexity: O(n/2)
# Space complexity: O(1)
def isPalindrome(string)
  for i in 0...string.size
    break if i > string.size/2
    return false unless string[i] == string[string.size-i-1]
  end
  return true
end

# Longest palindrome substring in a string
# Dynamic programming
# Time complexity : O(n**2)
# Space complexity : O(n**2)
# Auxialiary space of size O(n**2) is used for the matrix
def longest_palindrome_dp(string)
  n = string.size
  lbegin = 0
  maxLen = 1
  array = Array.new(n){Array.new(n)}
  # A char in itself is a palindrome
  for i in 0...n
    array[i][i] = true;
  end
  # Two consecutive letters if equal are a palindrome
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
        array[i][j] = true
        lbegin = i
        maxLen = len
      end
    end
  end
  # print the array starting from lbegin to maxLen of the substring
  return string[lbegin, maxLen]
end


def lp_manacher(s)
  p = Array.new(2*s.size - 1) { iii }
end
# Check if a given string is a rotation of a palindrome
                                                                        