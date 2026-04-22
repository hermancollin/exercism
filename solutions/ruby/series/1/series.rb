class Series
  def initialize(serie)
    @serie = serie.each_char.to_a
    raise ArgumentError if @serie.length == 0
  end

  def slices(n)
    raise ArgumentError if n <= 0 || n >= 6
    n_slices = @serie.length - n + 1
    (0...n_slices).map {|i| @serie[i...i+n].join}
  end
end