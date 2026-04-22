class WordProblem

  OP_SYMBOLS = {
    "plus" => "+", "minus" => "-", "multiplied by" => "*", "divided by" => "/"
  }.freeze
  
  def initialize(sentence)
    args = sentence.scan(/(?<=What is ).*?(?=\?)/)[0]
    raise ArgumentError if args.nil?
    @tokens = args.gsub(Regexp.union(OP_SYMBOLS.keys), OP_SYMBOLS).split
    raise ArgumentError unless valid_equation?(@tokens)
  end

  def answer
    result = @tokens.shift.to_i
    # ignore order of operations and evaluate left to right
    @tokens.each_slice(2) { |op, num| result = result.send(op, num.to_i) }

    result
  end

  private
  def valid_equation?(symbols)
    return false if symbols.length.even? || symbols.length.zero?
    symbols.each_slice(2).all? do |sym1, sym2|
      is_valid = sym1.to_i.to_s == sym1
      is_valid = OP_SYMBOLS.values.include?(sym2) if sym2

      is_valid
    end
  end
end