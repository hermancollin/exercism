module Hamming
  def Hamming.compute(a, b)
    raise ArgumentError if a.length != b.length
    a.chars.zip(b.chars).count { |ak, bk| ak != bk }
  end
end