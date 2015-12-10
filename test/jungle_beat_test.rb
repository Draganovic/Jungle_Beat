require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beat'
require './lib/node'

class JungleBeatTest < Minitest::Test

  attr_reader :jb

  def setup
    @jb = JungleBeat.new(nil)
  end

  def test_it_can_initialize_with_beat

    assert jb
  end

  def test_it_can_append_mult_nodes

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

    a = Node.new("peep")
    b = Node.new("pop")
    c = Node.new("meep")

    jb.append(a)
    jb.append(b)
    jb.append(c)

    assert_equal 3, jb.count
  end

  def test_it_can_count_empty_list

    assert_equal 0, jb.count
  end

  def test_it_can_prepend
    a = "pop"
    b = "doop"
    c = "noop"
    prepended_data = "beep"

    jb.append(a)
    jb.append(b)
    jb.append(c)

    assert_equal 1, jb.prepend(prepended_data)
    assert_equal prepended_data, jb.head.data
  end

  def test_it_can_prepend_an_empty_list
    data = "pop"

    assert_equal 1, jb.prepend(data)
    assert_equal 1, jb.count
  end

  def test_it_can_prepend_mult_values
    data = "pop meep doop"

    assert_equal 3, jb.prepend(data)
    assert_equal 3, jb.count
  end

  def test_jb_builder_can_parse_beat
    jb = JungleBeat.new("doot")

    assert_equal 1, jb.jb_builder
  end

  def test_jb_builder_can_parse_two_beats
    jb = JungleBeat.new("doot meep")

    assert_equal 2, jb.jb_builder
  end

  def test_parse_nothing

    assert_equal 0, jb.jb_builder
  end

  def test_it_can_make_nodes
    jb = JungleBeat.new("beep deep meep")

    assert_equal 3, jb.count
  end
  #
  def test_it_knows_if_something_is_included
    jb = JungleBeat.new("pop doop noop")
    head = Node.new("pop")
    body = Node.new("doop")
    tail = Node.new("noop")
    not_included = Node.new("woop")

    head.append(body)
    body.append(tail)



    refute jb.include?(not_included.data)
    assert jb.include?(body.data)
    assert jb.include?(tail.data)
  end

end
