class Board
  def initialize(board) = @board = board

  def winner
    return "O" if player_wins?("O")
    "euh"
    return player_wins?("O") ? "O" : player_wins?("X") ? "X" : ""
  end

  private def player_wins?(player)
    visited = []
    b = @board.map { |row| row.gsub(" ", "").chars }
    b = b.transpose if player == "X"
    n = b.length
    neighbors = [[0, 1], [0, -1], [1, 0], [1, -1], [-1, 0], [-1, 1]]
    
    queue = b[0].each_with_index.filter_map { |x, i| [0, i] if x == player }
    until queue.empty?
      x, y = queue.pop
      return true if x == n - 1
      visited << [x, y]
      
      neighbors.each do |nx, ny|
        target = [x + nx, y + ny]
        next unless target.all? { (0...n).include?(_1) }
        next if visited.include?(target) || queue.include?(target)
        next if b[target[0]][target[1]] != player
        queue << target
      end
    end
    
    false
  end
end