class WordProblem

  attr_reader :answer
  OP_SYMBOLS = {
    "plus" => "+", "minus" => "-", "multiplied by" => "*", "divided by" => "/"
  }.freeze
  
  def initialize(sentence)
    args = get_arg(sentence)
    raise ArgumentError if args.nil?
    tokens = args.gsub(Regexp.union(OP_SYMBOLS.keys), OP_SYMBOLS).split
    raise ArgumentError unless valid_equation?(tokens)
    @answer = tokens.shift.to_i
    # ignore order of operations and evaluate left to right
    tokens.each_slice(2) { |op, num| @answer = @answer.send(op, num.to_i) }
  end


  def valid_equation?(symbols)
    return false if symbols.length.even? || symbols.length.zero?
    symbols.each_slice(2).all? do |sym1, sym2|
      valid_slice = numeric?(sym1)
      valid_slice = OP_SYMBOLS.values.include?(sym2) if sym2
      
      valid_slice
    end
  end

  def numeric?(x) = x.to_i.to_s == x
    
  def get_arg(txt) = txt.scan(/(?<=What is ).*?(?=\?)/)[0]
end