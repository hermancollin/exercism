class Queens
  def initialize(white:, black: nil)
    @queens = black ? white.zip(black) : [white]
    raise ArgumentError if @queens.flatten.any? { !(0..7).include?(_1) }
  end

  def attack?
    return true if @queens.any? {_1 == _2}
    return true if @queens.map {|v1, v2| (v1 - v2).abs}.uniq.size == 1
    
    false
  end
end