# Write code to partition a linked list around a value x, 
# such that all nodes less than x come before all nodes greater than or equal to x. [CTCI, 77]

require_relative 'SingleLinkedList'
class PartitionLinkedList < SingleLinkedList
attr_accessor :random_list, :less_list, :greater_list #:partitioned_list
  def initialize
    @random_list = SingleLinkedList.new
    @less_list = SingleLinkedList.new
    @greater_list = SingleLinkedList.new

  end

  ###
  # => Add the values 
  ###
  def partitionLL(x)
    # create a random linked list of size 10
    random_list.createRandomList(10)
    random_list.print
    puts "Partitioning around value: #{x}"
    less_pointer = less_list.head
    greater_pointer = greater_list.head
    current_node = random_list.head
    while current_node != nil
      if current_node.value < x
        less_list.add(less_pointer, current_node.value)
      else
        greater_list.add(greater_pointer, current_node.value)
      end
      current_node = current_node.next
    end
    less_pointer.next = greater_list.head
    less_list.print
  end


  def addAsNextNode(current_node, value)
    if current_node.next == nil
      current_node.next.value = value
      current_node.next.next = nil
    else
      temp = current_node.next
      current_node.next.value = value
      current_node.next.next = temp
    end
    return current_node.next
  end
end

partition = PartitionLinkedList.new
partition.partitionLL(5)
