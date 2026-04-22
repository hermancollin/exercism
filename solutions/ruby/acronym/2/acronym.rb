class Acronym
  def self.abbreviate(sentence)
    sentence.upcase.gsub(/-|_/, " ").split(' ').map {|w| w[0]}.join
  end
end