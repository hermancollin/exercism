CIPHER = ('a'..'z').to_a.reverse.join

module Atbash
  def self.encode(plaintext)
    plaintext.downcase
      .gsub(/[^0-9a-z]/i, '')
      .scan(/.{1,5}/)
      .map do |piece|
        piece.chars.map do |char|
          if ('a'..'z').include?(char)
            CIPHER[('a'..'z').to_a.index(char)]
          else
            char
          end
        end.join
      end.join(" ")
  end

  def self.decode(ciphertext)
    self.encode(ciphertext).gsub(' ', '')
  end
end