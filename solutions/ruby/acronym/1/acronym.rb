class Acronym
  def self.abbreviate(sentence)
    sentence.gsub(/-|_/, " ").split().reduce("") { |acc, word| acc << word.upcase[0].to_s }
  end
end