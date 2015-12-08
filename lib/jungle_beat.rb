require_relative './node'

class JungleBeat

  attr_accessor :head

  def initialize(data)
    @data = data
    @head = nil
  end

  def jb_builder

  end

  def append(data)
    node = Node.new(data)
    @head = node if @head == nil
    last = find_tail(@head)
    last.next_node = node unless last == node
    # iterate through list
    #assign tail to node
  end


  def find_tail(node = nil)
    node = @head
    while node.next_node != nil
      node = node.next_node
    end
    node
  end

  def count
    @head.count
  end

end
