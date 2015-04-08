require "minitest/autorun"
require_relative 'game_of_life'

  class TestBoardReader < Minitest::Test
    def setup
      @board = BoardReader.new(StringIO.new('Generation 1:
4 8
........
....*...
...**...
........')).board
    end

    def test_creates_board_with_proper_width
      assert_equal 8, @board.width
    end

    def test_creates_board_with_proper_height
      assert_equal 4, @board.height
    end

    def test_creates_board_with_proper_generation
      assert_equal 1, @board.generation
    end

    def test_proper_live_and_dead_organism
      assert_equal '.', @board.data[1][3]
      assert_equal '*', @board.data[2][4]
    end
  end
