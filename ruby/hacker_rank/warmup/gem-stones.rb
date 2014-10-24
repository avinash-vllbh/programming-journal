##
# https://www.hackerrank.com/challenges/gem-stones
# 
# Read from STDIN
count_rocks = gets.to_i

gem_elements = []
# To be gem element an element has to be in all the rocks
# Add all the first rocks elements as gem elements
first_rock = gets.chomp
gem_elements = first_rock.split("")

# For each next rock get only elements that are in common
(count_rocks-1).times do
  rock = gets.chomp
  elements = rock.split("")
  # Keep only intersection elements in both the arrays
  gem_elements = gem_elements & elements
end

puts gem_elements.size