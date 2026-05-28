module Diamond
  LETTERS = ('A'..'Z').to_a.freeze
  def self.make_diamond(letter)
    letter_index = LETTERS.index(letter)
    width = (letter_index + 1) * 2 - 1
    result = ('A'..letter).map do |l|
      row = " " * width + "\n"
      row[width / 2 - LETTERS.index(l)] = l
      row[width / 2 + LETTERS.index(l)] = l
      row
    end
    result += result[...letter_index].reverse
    result.join
  end
end