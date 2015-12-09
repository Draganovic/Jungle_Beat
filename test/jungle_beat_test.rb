require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beat'
require './lib/node'

class JungleBeatTest < Minitest::Test

  def test_it_can_initialize_with_beat
    jb = JungleBeat.new("dop deep pop")

    assert jb
  end

  def test_it_can_append_mult_nodes
    jb = JungleBeat.new("pop doop noop")
    a = "pop"
    b = "doop"
    c = "noop"
    appended_data = "beep"

    jb.append(a)
    jb.append(b)
    jb.append(c)
    jb.append(appended_data)

    assert_equal a, jb.head.data
    assert_equal appended_data, jb.head.next_node.next_node.next_node.data
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
