class Node
  attr_accessor :data, :next_node

  def initialize(data = nil)
    @data = data
    @next_node = nil
  end

  def count
    if next_node
      next_node.count + 1
    else
      1
    end
  end

  def append(node)
    if next_node
      next_node.append(node)
    else
      @next_node = node
    end
  end
end
