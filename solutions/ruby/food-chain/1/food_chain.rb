COMMENTS = [
  "It wriggled and jiggled and tickled inside her.", 
  "How absurd to swallow a bird!",
  "Imagine that, to swallow a cat!",
  "What a hog, to swallow a dog!",
  "Just opened her throat and swallowed a goat!",
  "I don't know how she swallowed a cow!",
  "She's dead, of course!\n"
]
SWALLOWED = %w[fly spider bird cat dog goat cow horse]

module FoodChain
  def self.song
    (0..7).map {FoodChain.stanza(_1)}.join("\n\n")
  end
  
  def self.stanza(n)
    result = []
    result << "I know an old lady who swallowed a #{SWALLOWED[n]}."
    if n >= 1
      result << COMMENTS[n - 1]
    end
    return result.join("\n") if n == 7
    
    n.downto(1).each do |i|
      tmp = "She swallowed the #{SWALLOWED[i]} to catch the #{SWALLOWED[i-1]}"
      tmp += i == 2 ? " that wriggled and jiggled and tickled inside her." : "."
      result << tmp
    end
    
    result << "I don't know why she swallowed the fly. Perhaps she'll die."
    result.join("\n")
  end
end