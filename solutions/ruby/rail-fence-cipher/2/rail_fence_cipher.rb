module RailFenceCipher
  def self.encode(plaintext, n_rows)
    self.get_zigzag(plaintext, n_rows).join.gsub(".", "")
  end

  def self.decode(ciphertext, n_rows)
    chars = ciphertext.chars.to_a
    zz = self.get_zigzag(ciphertext, n_rows)
      .join
      .gsub(/\w/) { chars.shift }
      .chars
      .each_slice(ciphertext.length)
      .to_a
    (0..ciphertext.length).map do |i|
      zz.map { _1[i] }.join
    end.join.gsub(".", "")
  end

  def self.get_zigzag(text, n_rows)
    rows = (0...n_rows).map { |i| "." * text.length }
    row = 0
    direction = -1
    text.scan(/\w/).each_with_index do |char, i|
      column = i % text.length
      rows[row][column] = char
      direction *= -1 if row == n_rows - 1 || row == 0
      row += direction
    end
    rows
  end
end