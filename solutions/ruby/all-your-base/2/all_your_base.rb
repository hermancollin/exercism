module BaseConverter
  def self.convert(in_base, digits, out_base)
    raise ArgumentError if in_base < 2 || out_base < 2
    raise ArgumentError if digits.any? {_1 < 0 || _1 >= in_base}
    return [0] if digits.sum == 0 || digits.empty?
    number = digits.reverse
                   .each_with_index
                   .sum { |d, exponent| d * in_base**exponent }
    exp = 0
    result = []
    while number.positive?
      result.prepend(number % out_base)
      exp += 1
      number /= out_base
    end
    result
  end
end