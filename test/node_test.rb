require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beat'
require './lib/node'

class NodeTest < Minitest::Test

  def test_it_starts_with_no_data
    node = Node.new

    assert_equal nil, node.data
  end

end
