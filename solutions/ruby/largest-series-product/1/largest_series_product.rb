class Series
  def initialize(sequence)
    raise ArgumentError unless sequence.match?(/\A\d+\z/)
    @sequence = sequence
  end

  def largest_product(n)
    raise ArgumentError if n > @sequence.length
    @sequence.chars.each_cons(n).map do |subsequence|
      subsequence.map(&:to_i).reduce(:*)
    end.max
  end
end