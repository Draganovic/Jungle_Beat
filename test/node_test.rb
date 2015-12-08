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

end
