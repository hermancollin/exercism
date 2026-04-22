class Matrix
  def initialize(matstring)
    @rows = matstring.lines.map do |l|
      l.strip.split(' ').map {|v| v.to_i}.to_a
    end
  end

  def row(i)
    @rows[i-1]
  end

  def column(j)
    @rows.map {|row| row[j-1]}
  end
end