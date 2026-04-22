module CollatzConjecture
  def self.steps(x)
    raise ArgumentError if x <= 0
    return 0 if x == 1
    return 1 + steps(x.even? ? x/2 : 3*x + 1)
  end
end