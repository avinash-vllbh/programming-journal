###
# Reverse the bits of an unsigned integer
# Direct approach
# Convert to base 2 string or array and reverse
# Time complexity: O(n) loop through all the bits
###
def reverseBits(num, size)
  # To make the input number into binary of 16 or 32 bit format
  binary = "%0#{size}d" % num.to_s(2) #convert decimal to string of base 2 number
  puts binary
  puts binary.reverse!
  puts binary.to_i(2) # convert string of base 2 number to decimal
end

reverseBits(13, 16)

###
# Can we do better than O(n)
def reverseBitsEfficient(num, size)

end