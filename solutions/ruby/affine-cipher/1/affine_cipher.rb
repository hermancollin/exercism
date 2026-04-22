ALPHABET = ('a'..'z').to_a.freeze
class Affine
  def initialize(a, b)
    raise ArgumentError unless coprime?(a, 26)
    @a = a
    @b = b
  end

  def encode(plaintext)
    plaintext.downcase
      .gsub(/[^0-9a-z]/i, '')
      .scan(/.{1,5}/)
      .map do |substring|
        substring.chars.map do |char|
          if char.match?(/[a-z]/)
            i = ALPHABET.index(char)
            e = (@a * i + @b) % 26
            ALPHABET[e]
          else
            char
          end
        end.join
      end.join(" ")
  end

  def decode(ciphertext)
    ciphertext.gsub(' ', '')
      .chars
      .map do |char|
        if char.match?(/[a-z]/)
            y = ALPHABET.index(char)
            mmi = (2..).lazy.find {|x| @a * x % 26 == 1}
            d = (mmi * (y - @b)) % 26
            ALPHABET[d]
        else
          char
        end
      end.join
  end

  private def coprime?(a, b) = a.gcd(b) == 1
end