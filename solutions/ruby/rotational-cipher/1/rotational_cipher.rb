module RotationalCipher
  ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a
  def self.rotate(plaintxt, rot)
    key = ALPHABET.each_slice(26).map {|alph| alph.rotate(rot)}
    plaintxt.tr(ALPHABET.join, key.join)
  end
end