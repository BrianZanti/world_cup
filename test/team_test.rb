require 'minitest/autorun'
require 'minitest/pride'
require './lib/team'
require './lib/player'
require 'pry'

class TeamTest < Minitest::Test
  def test_it_exists
    france = Team.new("France")
    assert_instance_of Team, france
  end

  def test_it_has_a_country
    france = Team.new("France")
    assert_equal "France", france.country
  end

  def test_a_team_starts_with_no_players
    france = Team.new("France")
    assert_equal [], france.players
  end

  def test_team_starts_as_not_eliminated
    france = Team.new("France")
    assert_equal false, france.eliminated?
  end

  def test_it_can_be_eliminated
    france = Team.new("France")
    france.eliminated = true
    assert_equal true, france.eliminated?
  end

  def test_it_can_add_player
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    assert_equal([mbappe, griezmann, pogba], france.players)
  end

  def test_it_can_return_players_by_position
    france = Team.new("France")
    mbappe = Player.new("Kylian Mbappe", :forward)
    griezmann = Player.new("Antoine Griezmann", :forward)
    pogba = Player.new("Paul Pogba", :midfielder)

    france.add_player(mbappe)
    france.add_player(griezmann)
    france.add_player(pogba)

    assert_equal [mbappe, griezmann], france.players_by_position(:forward)
    assert_equal [pogba], france.players_by_position(:midfielder)
  end
end
