# Find a pair of elements from two sorted lists for which the sum of the elements is a certain value.

require_relative 'single_linked_list'
###
# => Extending SingleLinkedList to return end node of a list
###
class SingleLinkedList
  def end
    current_node = head
    while(current_node.next != nil)
      current_node = current_node.next
    end
    return current_node
  end
end

class PairToSum < SingleLinkedList
  attr_accessor :list1, :list2
  def initialize
    @list1 = SingleLinkedList.new
    @list2 = SingleLinkedList.new
  end
  ###
  # Prepares two sorted list for us to find the 
  ###
  def prep_sorted_lists
    10.times do |i|
      list1.add(3*i)
      list2.add(5*i)
    end 
    list1.print
    list2.print   
  end

  ###
  # since we need to find a pair, have to iterate on both the arrays
  # for each element in list1 we just need to look at elements less than (sum-node1.value) in List2
  # Time complexity - O(mn)
  ###
  def find_pair_to_sum(x)
    prep_sorted_lists # To prepared two sorted lists
    node1 = list1.head
    node2 = nil
    flag = false
    break_node = list2.end # Set the break node as end of secondlist
    while(node1.value < x && node1 != nil && flag == false)
      node2 = list2.head
      while(node2.value <= break_node.value && node2.value <= x-node1.value)
        if (node2.value + node1.value == x)
          flag = true
          break
        end
        break if node2.value + node1.value > x # All the following elements in List2 will be greater than sum anyways
        node2 = node2.next
      end
      break_node = node2 # Set the break point as this node for next iteration
      node1 = node1.next unless flag == true
    end
    if flag == true
      puts "Pair to match sum as #{x} is Node1: #{node1.value} and Node2: #{node2.value}"
    else
      puts "Pair not found"
    end
  end
end
pair = PairToSum.new
pair.find_pair_to_sum(11)
