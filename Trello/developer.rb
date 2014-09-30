# Find a 9 letter string of characters that contains only letters from

# acdegilmnoprstuw

# such that the hash(the_string) is

# 956446786872726

# if hash is defined by the following pseudo-code:

# Int64 hash (String s) {
#     Int64 h = 7
#     String letters = "acdegilmnoprstuw"
#     for(Int32 i = 0; i < s.length; i++) {
#         h = (h * 37 + letters.indexOf(s[i]))
#     }
#     return h
# }
# For example, if we were trying to find the 7 letter string where hash(the_string) was 680131659347,
#  the answer would be "leepadg".

require 'pry'
def hash(s)
  h = 7
  letters = "acdegilmnoprstuw"
  for i in 0...s.size
    # binding.pry
    h = (h * 37 + letters.rindex(s[i]))
  end
  puts "hash of #{s}: #{h}"
  return h
end

# Unhashing the string from given number
# number % 37 will be the index of the letter in letters array
# Decrease the number until it's less than 259,
#   which is where the hash function starts hashing any valid string with
def unhash(h)
  begin
    h = Integer(h)
  rescue ArgumentError
    return ArgumentError.new("Invalid input argument")
  end
  return nil if h == 7
  return "Invalid hash" if h > 7 && h < 259
  string = []
  letters = "acdegilmnoprstuw"
  while h >= 259
    quotient, modulus = h.divmod(37)
    string.unshift(letters[modulus])
    h = quotient
  end
  return string.join
end

# h1 = hash("")
# h2 = hash("a")
# h3 = hash("test")
# h4 = hash("leepadg")
# h5 = hash("trellises")

# puts unhash(h1)
# puts unhash(h2)
# puts unhash(h3)
# puts unhash(h4)
# puts unhash(10)
# puts unhash("asdsad")
# puts unhash(956446786872726)
