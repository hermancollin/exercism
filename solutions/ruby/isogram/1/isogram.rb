class Isogram
  def self.isogram?(input)
    letters = input.downcase.gsub(/ |-/, '').chars().tally().all? {|k, v| v < 2}
  end
end