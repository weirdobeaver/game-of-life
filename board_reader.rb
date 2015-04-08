require_relative 'board'

class BoardReader
  def initialize(board_input)
    @input = board_input.readlines
  end

  def board
    board = Board.new(get_width, get_height, get_generation, get_data)
  end

  private 

  def get_width
    @input[1].split(' ')[1].to_i
  end

  def get_height
     @input[1].split(' ')[0].to_i
  end 

  def get_generation
    @input[0].split(' ')[1].to_i
  end

  def get_data
    @input[2..-1].map! { |el| el.chomp.split('')}
  end
end
