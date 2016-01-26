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

  def include?(beat)
     current_node = @head

    while current_node != nil
      return true if current_node.data == beat
      current_node = current_node.next_node
    end
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
    # condition ? one_method : other_method

    @head ? @head.count : 0


    # if @head
    #   @head.count
    # else
    #   0
    # end
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

  def pop(x = 1)
    new_tot = count - x - 1
    current_node = @head

    new_tot.times do
      current_node = current_node.next_node
    end

    current_node.next_node = nil
  end

  def find(position, num_nodes)
    # another unit
    jumps = position - 1
    current_node = @head

    jumps.times do
      current_node = current_node.next_node
    end

    # one unit
    found = []
    num_nodes.times do
      current_node = current_node.next_node
      found << current_node.data
    end
    found.join(" ")
  end

  def play
    `say -r 100 -v Boing #{all}`
  end

end
