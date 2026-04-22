class Scrabble
  RANKS = [
    'AEIOULNRST', 'DG', 'BCMP', 'FHVWY', 'K', 'JX', 'QZ'
  ].freeze
  
  def initialize(word)
    @word = word.upcase
  end

  def score
    @word.each_char
      .map { |char| 1 + RANKS.index { |rank| rank.include?(char) } }
      .map {|val| val == 6 ? 8 : val}
      .map {|val| val == 7 ? 10 : val}
      .sum
  end
end
