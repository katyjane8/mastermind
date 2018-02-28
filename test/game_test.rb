require './lib/game'
require 'minitest/autorun'
require 'minitest/pride'

class GameTest < Minitest::Test
  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_can_display_start_message
    game = Game.new

    assert game.intro.include?("Welcome")
  end
end
