# Find the longest common subsequence of two strings
require 'pry'

# Dynamic programming - 
# Time complexity: O(nm)
# Space complexity: O(nm) - 
def lcs(string1, string2)
  # Declare a two dimensional array
  lcs_grid = Array.new(string1.length+1) {Array.new(string2.length+1) { 0 }}
  for i in 1..string1.length
    for j in 1..string2.length
      # binding.pry
      if string1[i-1] == string2[j-1]
        lcs_grid[i][j] = lcs_grid[i-1][j-1] + 1
      else
        lcs_grid[i][j] = [lcs_grid[i-1][j],lcs_grid[i][j-1]].max
      end
    end
  end

  # Printing the LCS grid array built for finding LCS
  # lcs_grid.each do |lcs_grid_row|
  #   p lcs_grid_row
  # end
  
  puts "Length of LCS between #{string1} and #{string2} is #{lcs_grid.last.last}"
  
  # Tracing backwards to print the LCS using recursion
  tracingLCS(lcs_grid, string1, string2, string1.length, string2.length)

  # Tracing back to grid to print the lcs using iteration
  # i = string1.length
  # j = string2.length
  # while i >= 0 && j >= 0
  #   if string1[i-1] == string2[j-1]
  #     i = i-1
  #     j = j-1
  #   else
  #     # binding.pry
  #     if lcs_grid[i-1][j] > lcs_grid[i][j-1]
  #       i = i-1
  #     else
  #       j = j-1
  #     end
  #   end
  # end
end

# Tracing backwards to print the LCS using recursion
def tracingLCS(lcs_grid, string1, string2, i, j)
  return if i < 0 or j < 0
  if string1[i-1] == string2[j-1]
    tracingLCS(lcs_grid, string1, string2, i-1, j-1)
    print string1[i-1]
  else
    if lcs_grid[i-1][j] > lcs_grid[i][j-1]
      tracingLCS(lcs_grid, string1, string2, i-1, j)
    else
      tracingLCS(lcs_grid, string1, string2, i, j-1)
    end
  end
end

# lcs("ACCGGGTTAC", "AGGACCA")