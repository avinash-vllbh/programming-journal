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
  # puts binary.to_i(2) # convert string of base 2 number to decimal
end
# reverseBits(39,32)

###
# Can we do better than O(n) ???
# Source - http://cs-technotes.blogspot.com/2010/12/reverse-integer-bit-by-bit.html
# Source - http://graphics.stanford.edu/~seander/bithacks.html#BitReverseObvious
# reverse abcd, you can first reverse ab and cd => badc, then reverse ba and dc => dcba
# This method applies divide and conquer.  consider each two bits and swap them, then consider four bits together, then eight bits... So, time complexity is reduced to O(logn).
# Time complexity: O(logn)
# Space complexity: O(1)

def  reverseBitsEfficient(x)
    puts "%032d" % x.to_s(2)
    # //swap each two bits
    # //10101010...
    tmp1 = (x&0xAAAAAAAA)>>1; # 0xAAAAAAAA = "101010...10" 32 bit notation with all even positions as 1's
    # //010101010..
    tmp2 = (x&0x55555555)<<1; # 0x55555555 = "010101...01" 32 bit notation with all odd positions as 1's
    x = tmp1|tmp2
    # //swap each four bits
    # //11001100 
    tmp1 = (x&0xCCCCCCCC)>>2;
    # //0011
    tmp2 = (x&0x33333333)<<2;
    x = tmp1|tmp2
    # //swap every eight bits
    # //1111000011110000
    tmp1 = (x&0xF0F0F0F0)>>4;
    tmp2 = (x&0x0F0F0F0F)<<4;
    x = tmp1|tmp2
    # //swap every 8 bits
    tmp1 = (x&0xFF00FF00)>>8;
    tmp2= (x&0x00FF00FF)<<8;
    x = tmp1|tmp2
    # //swap every 16 bits
    tmp1 = (x&0xFFFF0000)>>16;
    tmp2 = (x&0x0000FFFF)<<16;
    x = tmp1|tmp2
    puts x.to_s(2)
end
reverseBitsEfficient(39)


###
# Swap all odd bits with even bits in a 32 bit integer
# e.g Input x = 89  (Binary: 1011001)
#     output = 166  (Binary: 10100110)
# Idea is all even bits are shifting towards left by one positions
# All odd bits are shifting towards right by one positions
# So get all even bits and shift them left by 1, get all odd bits and shift them right by 1
# Then bitwise OR both evens and odds
# Time complexity: O(1)
# Space complexity: O(1)

def swapBitsEvenOdd(x)
  puts "#{x} --> #{x.to_s(2)}"
  # Bitwise AND of a number with 0xAAAAAAAA gives all even bits of that number
  tmp1 = (x&0xAAAAAAAA)>>1; # 0xAAAAAAAA = "101010...10" 32 bit notation with all even positions as 1's
  # //010101010..
  # Bitwise AND of a number with 0x55555555 gives all odd bits of that number
  tmp2 = (x&0x55555555)<<1; # 0x55555555 = "010101...01" 32 bit notation with all odd positions as 1's
  x = tmp1|tmp2
  puts "#{x} --> #{x.to_s(2)}"
end

swapBitsEvenOdd(89)