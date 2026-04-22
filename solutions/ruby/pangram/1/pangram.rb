module Pangram
  def self.pangram?(sentence)
    sentence.upcase.scan(/[A-Z]/).uniq.length == 26
  end
end