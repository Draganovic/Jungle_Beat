require_relative './node'

class JungleBeat

  attr_accessor :head, :rate, :voice

  def initialize(data)
    @data = data
    @head = nil
    jb_builder
    @rate = 500
    @voice = "Boing"
  end

  def reset_voice
    self.voice = "Boing"
  end

  def reset_rate
    self.rate = 500
  end

  def jb_builder
    data = @data.to_s.split
    data.each {|beat| append(beat)}
    data.count
  end

  def append(data)
    data.split.each do |beat|
      node = Node.new(beat)
      current_node = head
      if head

        until current_node.next_node.nil?
          current_node = current_node.next_node
        end

        current_node.next_node = node
      else

        @head = node
      end
    end
    data.split.count
  end

  def prepend(data)
    data.split.each do |beat|
      node = Node.new(beat)
      if head
        old_head = head
        @head = node
        @head.next_node = old_head
      else
        @head = node
      end
    end
    data.split.count
  end

  def find_tail(node = nil)
    node = head
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

  def count
    counter = 1
    current_node = head
    if current_node
      while current_node.next_node
        counter += 1
        current_node = current_node.next_node
      end
      counter
    else
      0
    end
  end

  def insert(position, data)
    sd = data.split
    sd.each_with_index do |beat, index|
      node = Node.new(beat)
      current_node = @head
      current_pos = 0
      index_val = position + index

      until current_pos == index_val - 1
        current_node = current_node.next_node
        current_pos += 1
      end

      node.next_node = current_node.next_node
      current_node.next_node = node
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
    jumps = position - 1
    current_node = @head

    jumps.times do
      current_node = current_node.next_node
    end

    found = []
    num_nodes.times do
      current_node = current_node.next_node
      found << current_node.data
    end
    found.join(" ")
  end

  def play
  `say -r #{rate}  -v #{voice} #{all}`
    all.size
  end

end
