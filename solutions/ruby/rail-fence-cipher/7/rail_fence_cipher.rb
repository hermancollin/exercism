module RailFenceCipher
  def self.encode(*) = self.zigzag(true, *)
  def self.decode(*) = self.zigzag(false, *)

  private
  def self.zigzag(encoding, text, rails)
    rows = (0...rails).chain(rails.pred.pred.downto(1))
                      .cycle
                      .take(text.length)
    zigzag = rows.zip((0..text.length))
    if encoding
      zigzag.sort.map { |_, i| text[i] }.join
    else
      zigzag.sort.zip(text.chars).sort_by { _1[0][1] }.map(&:last).join
    end
  end
end