class Anagram
  def initialize(word)
    @word = word.upcase
    @letters = get_letters(word)
  end

  def match(candidates)
    candidates.filter {|w| @word != w.upcase and @letters == get_letters(w)}
  end

  def get_letters(word)
    word.upcase.each_char.sort.join
  end
end