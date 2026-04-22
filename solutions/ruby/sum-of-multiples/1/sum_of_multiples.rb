class SumOfMultiples
  def initialize(*args)
    @base_vals = args
  end

  def to(level)
    (1...level).filter { |i| @base_vals.any? {|base| i % base == 0}}.sum
  end
end