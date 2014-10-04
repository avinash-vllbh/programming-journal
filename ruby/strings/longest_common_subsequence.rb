###
# Find the longest common subsequence of two strings
# Strategy: Dynamic programming
# Time complexity: O(nm)
# Space complexity: O(nm)
###
def lcs(string1, string2)
  # Declare a two dimensional array
  lcs_grid = Array.new(string1.length+1) {Array.new(string2.length+1) { 0 }}
  for i in 1..string1.length
    for j in 1..string2.length
      if string1[i-1] == string2[j-1]
        lcs_grid[i][j] = lcs_grid[i-1][j-1] + 1
      else
        lcs_grid[i][j] = [lcs_grid[i-1][j],lcs_grid[i][j-1]].max
      end
    end
  end  
  # puts "Length of LCS between #{string1} and #{string2} is #{lcs_grid.last.last}"

  # Tracing backwards to print the LCS using recursion
  lcss = tracing_lcs(lcs_grid, string1, string2, string1.length, string2.length)
  return lcss.join(""), lcs_grid.last.last
end

# Tracing backwards to print the LCS using recursion
def tracing_lcs(lcs_grid, string1, string2, i, j)
  @lcss ||= []
  return if i < 0 or j < 0
  if string1[i-1] == string2[j-1]
    tracing_lcs(lcs_grid, string1, string2, i-1, j-1)
    @lcss << string1[i-1]
  else
    if lcs_grid[i-1][j] > lcs_grid[i][j-1]
      tracing_lcs(lcs_grid, string1, string2, i-1, j)
    else
      tracing_lcs(lcs_grid, string1, string2, i, j-1)
    end
  end
  return @lcss
end