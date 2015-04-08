require 'minitest/autorun'
require 'pry'
require_relative 'game_of_life'

  class TestEvolve < Minitest::Test
    def setup
      @old_board = BoardReader.new(StringIO.new('Generation 1:
4 8
........
....*...
...***..
*....*..')).board
      @new_board = Evolver.new(@old_board).evolve
    end

    def test_under_population
      assert_equal '*', @old_board.data[3][0]
      assert_equal '.', @new_board.data[3][0]
    end

    def test_over_crowding
      assert_equal '*', @old_board.data[2][4]
      assert_equal '.', @new_board.data[2][4]
    end

  end

