require_relative './node'

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
    .count
  end

  def find_tail(node = nil)
    node = @head
    while node.next_node != nil
      node = node.next_node
    end
    node
  end

  def include?(data)
    @head.include?(data)
  end

  def prepend(data)
    data.split.each do |beat|
      node = Node.new(beat)
      if @head
        old_head = @head
        @head = node
        @head.next_node = old_head
      else
        @head = node
      end
    end
    .count
  end

  def count
    if @head
      @head.count
    else
      0
    end
  end

  def insert(position, data)
    sd = data.split
    sd.each_with_index do |beat, index|
      node = Node.new(beat)
      if @head
        index_val = position + index
        @head.insert(index_val, node)
      else
        @head = node
      end
    end
    all
  end

  def all
    all_beats = []
    current_node = @head
    while current_node != nil
      all_beats << current_node.data
      current_node = current_node.next_node
    end
    all_beats.join(" ")
  end

  def play
    `say -r 500 -v Boing #{all}`
  end

end
