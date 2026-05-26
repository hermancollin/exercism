module House
  EMBEDDINGS = [
    "horse and the hound and the horn", "belonged to",
    "farmer sowing his corn", "kept", "rooster that crowed in the morn",
    "woke", "priest all shaven and shorn", "married",
    "man all tattered and torn", "kissed", "maiden all forlorn", "milked",
    "cow with the crumpled horn", "tossed", "dog", "worried", "cat",
    "killed", "rat", "ate", "malt", "lay in", "house", "Jack built."
  ].freeze
  def self.recite(start, stop) = (start..stop).map { verse(_1) }.join

  def self.verse(n)
    result = "This is"
    EMBEDDINGS[-2*n..].each_slice(2) do |subject, verb| 
      result += " the " + subject + " that " + verb
    end
    result + "\n"
  end
end