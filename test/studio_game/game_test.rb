# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/studio_game/player'
require_relative '../../lib/studio_game/game'

module StudioGame
  class GameTest < Minitest::Test
    def setup
      @game = Game.new('Test Me')

      @player_1 = Player.new('A', 60) # rubocop:disable Naming/VariableNumber
      @player_2 = Player.new('B', 75) # rubocop:disable Naming/VariableNumber

      $stdout = StringIO.new
    end

    def test_game_has_no_players_initially
      assert_empty @game.players
    end

    def test_game_can_add_players
      @game.add_player(@player_1)
      @game.add_player(@player_2)

      refute_empty @game.players
      assert_equal [@player_1, @player_2], @game.players
    end

    def test_boosts_the_player_if_a_high_number_is_rolled
      @game.add_player(@player_1)

      @game.stub(:roll_die, 6) do
        @game.play
        assert_equal 75, @player_1.health
      end
    end

    def test_skips_the_player_if_a_mid_number_is_rolled
      @game.add_player(@player_1)

      @game.stub(:roll_die, 3) do
        @game.play
        assert_equal 60, @player_1.health
      end
    end

    def test_drains_the_player_if_a_low_number_is_rolled
      @game.add_player(@player_1)

      @game.stub(:roll_die, 1) do
        @game.play
        assert_equal 50, @player_1.health
      end
    end
  end
end
