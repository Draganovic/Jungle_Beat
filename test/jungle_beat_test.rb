require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beat'
require './lib/node'

class JungleBeatTest < Minitest::Test

  def test_it_can_initialize_with_beat
    jb = JungleBeat.new("dop deep pop")

    assert jb
  end

  def test_it_can_append
    jb = JungleBeat.new("pop doop noop")
    a = Node.new("pop")
    b = Node.new("doop")
    c = Node.new("noop")
    appended_data = "beep"

    a.next_node = b
    b.next_node = c
    jb.head = a
    jb.append(appended_data)

    refute c.next_node.nil?
    assert_equal appended_data, c.next_node.data
  end

  def test_tail_can_be_found
    jb = JungleBeat.new("peep pop meep")
    a = Node.new("peep")
    b = Node.new("pop")
    c = Node.new("meep")

    jb.head = a
    a.next_node = b
    b.next_node = c

    assert_equal nil, c.next_node
    assert_equal c, jb.find_tail
  end

  def test_it_can_count
    jb = JungleBeat.new("peep pop meep")
    a = Node.new("peep")
    b = Node.new("pop")
    c = Node.new("meep")

    jb.append(a)
    jb.append(b)
    jb.append(c)

    assert_equal 3, jb.count
  end


end
