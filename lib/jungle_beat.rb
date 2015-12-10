require_relative './node'
require 'pry'

class JungleBeat

  attr_accessor :head

  def initialize(data)
    @data = data
    @head = nil
    jb_builder
  end

  def jb_builder
    data = @data.to_s.split
    data.each {|beat| append(beat)}
    data.count
  end

  def append(data)
    node = Node.new(data)
    if @head
      @head.append(node)
    else
      @head = node
    end
  end

  def find_tail(node = nil)
    node = @head
    while node.next_node != nil
      node = node.next_node
    end
    node
  end

  # def include?(node)
  #   @head.include?(node)
  # end

  def prepend(data)
    node = Node.new(data)
    if @head
      old_head = @head
      @head = node
      @head.next_node = old_head
    else
      @head = node
    end
    1
  end

  def count
    if @head
      @head.count
    else
      0
    end
  end

end
