class Board
  attr_reader :width, :height, :generation, :data
  def initialize(width, height, generation, data)
    @width = width
    @height = height
    @generation = generation
    @data = data
  end

end