class Matrix
  def initialize(matstring)
    @matrix = matstring.lines.map {|l| l.strip.split(' ').map(&:to_i).to_a}
  end

  def row(i)
    @matrix[i-1]
  end

  def column(j)
    @matrix.map {|row| row[j-1]}
  end
end