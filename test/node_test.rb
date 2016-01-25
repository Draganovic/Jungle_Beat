require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beat'
require './lib/node'


class NodeTest < Minitest::Test

  def test_it_starts_with_no_data
    node = Node.new

    assert_equal nil, node.data
  end

  def test_node_can_count
    node = Node.new

    assert_equal 1, node.count
  end

  def test_it_can_count_a_list
    head = Node.new
    body = Node.new
    tail = Node.new

    head.next_node = body
    body.next_node = tail

    assert_equal 3, head.count
    assert_equal 2, body.count
    assert_equal 1, tail.count
  end

  def test_it_can_append_mult_nodes
    head = Node.new("pop")
    body = Node.new("doop")
    tail = Node.new("noop")
    appended_data = "beep"

    head.append(body)
    body.append(tail)
    tail.append(Node.new(appended_data))

    assert_equal body, head.next_node
    assert_equal appended_data, tail.next_node.data
  end

  def test_it_can_append
    appended_data = "pop"

    node = Node.new
    next_node = Node.new(appended_data)

    refute node.next_node

    node.append(next_node)

    assert node.next_node
    assert_equal appended_data, node.next_node.data
  end

  def test_it_can_use_include?
    head = Node.new("pop")
    body = Node.new("doop")
    tail = Node.new("noop")
    not_included = Node.new("woop")

    head.append(body)
    body.append(tail)

    assert head.include?(body.data)
    assert head.include?(tail.data)
    refute head.include?(not_included.data)
  end

  def test_it_can_insert_1_between_2_nodes
    head = Node.new("pop")
    body = Node.new("doop")
    tail = Node.new("noop")

    head.append(tail)

    assert_equal tail, head.next_node
    head.insert(1, body)

    assert_equal 3, head.count
    assert head.include?(body.data)
    assert_equal body, head.next_node
  end

end
