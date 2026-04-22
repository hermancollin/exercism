class Cipher
  CHARS = ('a'..'z').to_a.freeze
  
  attr_reader :key
  def initialize(key = nil)
    if key
      raise ArgumentError unless ('a'..'z').cover?(key)
      @key = key
    else
      @key = Array.new(100) { rand(26) }.map { CHARS[_1] }.join
    end
  end

  def encode(plaintext, rotate_left = false)
    shifts = key.chars.map { CHARS.index(_1) }
    shifts = shifts.map { _1 * -1 } if rotate_left
    plaintext.chars.zip(shifts.cycle).map do |char, shift|
      CHARS[(CHARS.index(char) + shift) % 26]
    end.join
  end

  def decode(ciphertext) = encode(ciphertext, true)
end