class Triangle
  attr_reader :sides
  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    sides.uniq.length == 1 and not sides.include?(0)
  end

  def isosceles?
    valid? and (equilateral? or sides.uniq.length == 2)
  end

  def scalene?
    valid? and sides.uniq.length == 3
  end

  def valid?
    a, b, c = sides
    (a + b >= c) and (b + c >= a) and (a + c >= b)
  end
end