class Darts
  def initialize(x, y)
    @x, @y = x, y
  end

  def score
    r = Math.sqrt(@x**2 + @y**2)
    return 10 if r <= 1
    return 5 if r <= 5
    return 1 if r <= 10
    return 0
  end
end