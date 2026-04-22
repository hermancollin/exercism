module RailFenceCipher
  def self.encode(*) = self.zigzag(*)
  def self.decode(*) = self.zigzag(*)

  private
  def self.zigzag(text, rails)
    parent_caller = caller_locations(1, 1).first.label.to_sym
    encoding = parent_caller == :encode
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