require 'pry'

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

  def include?(node)
    if @data == node
      true
    elsif @next_node == nil
      false
    else
      @next_node.include?(node)
    end
  end

  def insert(position, node)
    next_position = position-1
    if next_position == 0
      old_node = next_node
      @next_node = node
      @next_node.next_node = old_node
    else
      @next_node.insert(next_position, node)
    end
  end


end
