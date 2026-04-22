module Grains
  def self.square(n)
    raise ArgumentError unless n in (1..64)
    2**(n-1)
  end

  def self.total
    2**64 - 1
  end
end