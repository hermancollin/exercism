module IsbnVerifier
  def self.valid?(string)
    digits = string.scan(/\w/)
    digits[-1] = 10 if digits[-1] == 'X'
    return false if digits.length != 10 || digits.join.match?(/[A-Za-z]/)
    digits.map!(&:to_i).zip(10.downto(1).to_a).map {_1 * _2}.sum % 11 == 0
  end
end