###
# Find the min and max values in an array of integers
# Time complexity: O(n), space complexity: O(1)
# No of comparisions: ~2(n-1) => All the elements could be checked with both min and max in worst case
###
def minmax_linear(array)
  min, max = 0, 0
  comparisions = 0
  if array.size <= 1
    # minmax = Minmax.new
    min = array.first
    max = array.first
  else
    min = array.first
    max = array.first
    array.each do |x|
      comparisions += 1
      if min > x
        min = x
      else
        comparisions += 1
        if max < x 
          max = x
        end
      end
    end
  end
  return {"min" => min, "max" => max, "comparisions" => comparisions}
end

p minmax_linear([6])
p minmax_linear([1,5,3,4,-3,-2,3])

###
# Find the min and max values in an array of integers
# Time complexity: O(n), space complexity: O(1)
# No of comparisions: ~3n/2
#           Total pairs: ~n/2
#           Total comparision: 1 (min and max in the pair itself) + 1(min of pair with min) + 1(max of pair with max)
###
def minmax_pairs(array)
  min = array.first
  max = array.first
  comparisions = 0
  if array.size <= 1
  else
    if array.size/2 != 0
      array.shift # Remove the first element to work with array as pairs
    end
    array.each_slice(2) do |x,y| # Get pairs of elements from array
      comparisions += 2
      if min > [x, y].min
        min = [x, y].min
      end
      comparisions += 1
      if max < [x, y].max
        max = [x, y].max
      end
    end
  end
  return {"min" => min, "max" => max, "comparisions" => comparisions}
end
p minmax_pairs([6])
p minmax_pairs([1,5,3,4,-3,-2,3])