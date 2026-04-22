class Crypto

  def initialize(plaintext)
    @text = plaintext.downcase.scan(/[a-z0-9]/).join
    @textsize = @text.length
  end

  def ciphertext
    return @text if @textsize < 2
    r = Math.sqrt(@textsize).floor
    c = r**2 == @textsize? r : r + 1
    r += 1 if @textsize > r * c
    @text.ljust(r*c).chars.each_slice(c).to_a.transpose.map(&:join).join(" ")
  end
end