module RailFenceCipher
  def self.encode(plaintext, rails)
    self.zigzag(rails, plaintext)
  end

  def self.decode(ciphertext, rails)
    self.zigzag(rails, ciphertext, true)
  end

  def self.zigzag(rails, text, decoding=false)
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