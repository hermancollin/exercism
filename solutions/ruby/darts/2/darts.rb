class Darts
  attr_reader :score
  def initialize(x, y)
    r = Math.sqrt(x**2 + y**2)
    @score = r <= 1 ? 10 : r <= 5 ? 5 : r <= 10 ? 1 : 0
  end
end