class Phrase
  attr_reader(:words)
  def initialize(phrase)
    # @words = phrase.scan(/\b\w+\b/).each.map(&:downcase)
    @words = phrase.gsub(/,|:|!|%|&|@|$|\^|\$|\./, ' ')
      .split
      .each
      .map {|w| w.downcase.delete_prefix("'").delete_suffix("'")}
      .filter {|w| w.length > 0}
  end

  def word_count
    words.uniq.map {|w| [w, words.count(w)]}.to_h
  end
end