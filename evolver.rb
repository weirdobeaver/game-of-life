require_relative 'board'

class Evolver

  def initialize(board)
    @board = board
  end

  def evolve
    new_data = []
    @board.data.each_with_index do |row, y|
      row.each_with_index do |el, x|
        new_data[y] ||= []
        new_data[y][x] = under_population(y, x)
        new_data[y][x] ||= over_crowding(y, x)
      end
    end

    Board.new(@board.width, @board.height, @board.generation + 1,
      new_data)
  end

  private

  def under_population(y, x)
    neighbours_count(y, x) < 2 ? '.' : nil
  end

  def over_crowding(y, x)
    neighbours_count(y, x) > 3 ? '.' : nil
  end

  def neighbours_count(y, x)
    [
      (@board.data[y - 1][x - 1] if y > 0 && x > 0),
      (@board.data[y - 1][x ] if y > 0),
      (@board.data[y - 1][x + 1] if y > 0),
      (@board.data[y][x - 1] if x > 0),
      (@board.data[y][x + 1]),
      (@board.data[y + 1][x - 1] if y + 1 < @board.height && x > 0),
      (@board.data[y + 1][x] if y + 1 < @board.height),
      (@board.data[y + 1][x + 1] if y + 1 < @board.height)
    ].flatten.count('*')
  end
end
