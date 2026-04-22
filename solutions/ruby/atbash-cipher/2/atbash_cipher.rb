ALPHABET = ('a'..'z').to_a.join

module Atbash
  def self.encode(plaintext)
    plaintext.downcase
      .gsub(/[^0-9a-z]/i, '')
      .scan(/.{1,5}/)
      .map { |x| x.tr(ALPHABET, ALPHABET.reverse) }
      .join(" ")
  end

  def self.decode(ciphertext)
    self.encode(ciphertext).gsub(' ', '')
  end
end