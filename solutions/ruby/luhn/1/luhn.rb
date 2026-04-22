module Luhn
  def self.valid?(numstring)
    numstring_stripped = numstring.gsub(' ', '')
    if not numstring_stripped.match(/^\d+$/) or numstring_stripped.length == 1
      return false
    end

    digits_luhn = numstring_stripped.reverse.each_char.with_index
      .reduce(0) do |acc, (digit, i)|
        d = digit.to_i
        if i.odd?
          d = 2 * d
          d = d - 9 if d > 9
        end
        acc + d
      end
    return (digits_luhn % 10) == 0
  end
end
