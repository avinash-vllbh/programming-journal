# https://www.hackerrank.com/challenges/mark-and-toys
# Read number of toys and money with mark from STDIN
# Read price of each toy into toys array
n, money = gets.split(" ").map(&:to_i)
prices = gets.split(" ").map(&:to_i).sort # Covert each price to integer and sort the array

toys = 0
prices.each do |price|
  if money - price >= 0
    money = money - price
    toys += 1
  else
    break
  end
end
puts toys