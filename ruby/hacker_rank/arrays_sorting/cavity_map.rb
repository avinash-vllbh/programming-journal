###
# https://www.hackerrank.com/challenges/cavity-map
# Read from STDIN
map_size = gets.to_i
str1, str2, str3 = nil, nil, nil

###
# processes the str2 for any cavity based on the conditions
def find_cavity(map_size, str1, str2, str3)
  result = str2 != nil ? str2.clone : nil
  if str1 != nil && str2 != nil && str3 != nil
    map_size.times do
      for i in 1..map_size-2
        if str2[i] > str2[i-1] && str2[i] > str1[i] && str2[i] > str2[i+1] && str2[i] > str3[i]
          result[i]  = "X"
        end
      end
    end
  end
  return result
end

# look for cavity in sets of 3 strings each
map_size.times do
  str1 = str2
  str2 = str3
  str3 = gets.chomp
  result = find_cavity(map_size, str1, str2, str3)
  puts result if result != nil
end

# Print the last string as it's a border to the map and doesn't need to be processed
puts str3