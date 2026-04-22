class SpiralMatrix
  attr_reader :size
  def initialize(size)
    @size = size
  end

  def matrix
    matrix = Array.new(size) { Array.new(size, 0) }
    x, y = 0, 0
    directions = [[0, 1], [1, 0], [0, -1], [-1, 0]].cycle
    next_wall = size
    next_move = directions.next
    alternator = [0, 1].cycle
    increment = size - 1
    
    (1..size**2).each do |i|
      matrix[x][y] = i
      if i == next_wall
        next_move = directions.next
        next_wall = next_wall + increment
        increment -= alternator.next
      end
      (dx, dy) = next_move
      x, y = x + dx, y + dy
    end
    matrix
  end
end