module BaseConverter
  def self.convert(in_base, digits, out_base)
    raise ArgumentError if in_base < 2 || out_base < 2
    raise ArgumentError if digits.any? {_1 < 0 || _1 >= in_base}
    nb10 = digits.reverse
                 .each_with_index
                 .sum { |d, exponent| d * in_base**exponent }
    return nb10.digits if nb10 == 0 || digits.empty?
    rest = nb10
    exp = 0
    result = []
    while rest.positive?
      current_digit = rest % out_base
      result.prepend(current_digit)
      exp += 1
      rest /= out_base
    end
    result
  end
end