module RailFenceCipher
  def self.encode(*) = self.zigzag(*)
  def self.decode(*) = self.zigzag(*)

  private
  def self.zigzag(text, rails)
    parent_caller = caller_locations(1, 1).first.label.to_sym
    decoding = parent_caller == :decode
    ((0...rails).to_a + (1...rails - 1).to_a.reverse)
      .cycle
      .take(text.length)
      .zip((0..text.length))
      .sort_by { decoding ? _1: nil }
      .zip(text.chars)
      .sort_by { |x| decoding ? x[0][1] : x }
      .map(&:last)
      .join
  end
end