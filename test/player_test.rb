require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    pogba = Player.new("Paul Pogba", :midfielder)
    assert_instance_of Player, pogba
  end

  def test_it_has_attributes
    pogba = Player.new("Paul Pogba", :midfielder)
    assert_equal "Paul Pogba", pogba.name
    assert_equal :midfielder, pogba.position
  end
end
