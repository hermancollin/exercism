class Triangle
  def initialize(n) = @n = n

  def rows
    result = []
    result << [1] unless @n.zero?
    (0...@n-1).each do |i|
      result << [1] + (0..i).map do |j|
        result[-1][j] + (result[-1][j+1] || 0)
      end
    end
    
    result
  end
end