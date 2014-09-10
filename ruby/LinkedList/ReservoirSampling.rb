# Given a linked list with unknown length randomly select one node with equal probability for every node in the list
require 'pry'
require_relative 'SingleLinkedList'
class ReservoirSampling
  attr_accessor  :list

  def initialize
    @list = SingleLinkedList.new
  end

  ###
  # create an ordered list
  ###
  def createOrderedList
    [1,2,3,4,5,6,7,8,9].each do |x|
      list.add(x)
    end
    puts "given linked list is "
    list.print
  end

  ###
  # creates a random sample using reservoir sampling algorithm
  # First creates a reservoir of size x from first x elements, then randomize adding further elements to it.
  # Time complexity: O(n)
  ###
  def randomSample(x)
    return ArgumentError.new("Not a valid integer") unless (Integer(x) rescue false)
    sample = Array.new(x) #create a reservoir of size x

    #Fill the reservoir with first x elements in the list
    current_node = list.head
    x.times do |i|
      if current_node == nil
        return sample
      else
        sample[i] = current_node
      end
      current_node = current_node.next
    end

    # Parse the list after processing the first x elements
    list_counter = x
    while current_node != nil
      i = rand(list_counter) 
      if i < x 
        sample[i] = current_node
      end
      list_counter += 1
      current_node = current_node.next
    end
    return sample
  end
end

rs = ReservoirSampling.new
rs.createOrderedList
random_sample = rs.randomSample(5)

random_sample.each do |node|
  puts "randomly picked: #{node.value}"
end