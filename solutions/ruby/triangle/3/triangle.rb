class Triangle
  attr_reader :sides
  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    triangle? and sides.uniq.length == 1
  end

  def isosceles?
    triangle? and sides.uniq.length <= 2
  end

  def scalene?
    triangle? and sides.uniq.length == 3
  end

  def triangle?
    a, b, c = sides
    return false if sides.include?(0)
    (a + b >= c) and (b + c >= a) and (a + c >= b)
  end
end