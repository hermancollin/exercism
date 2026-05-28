UNITS = %w[
  one two three four five six seven eight nine ten
  eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen 
  twenty thirty forty fifty sixty seventy eighty ninety
]

class Say
  def initialize(n) = @n = n

  def in_english
    raise ArgumentError unless @n < 1e12 && @n >= 0
    result = ""
    reste = @n
    powers = [1e9, 1e6, 1e3]
    separators = ["billion", "million", "thousand"]
    until reste < 1000
      pow_index = powers.index { |d| reste / d >= 1}
      pow = powers[pow_index]
      coefficient = (reste / pow).to_i
      sep = separators[pow_index]
      debug coefficient
      result += "#{spell_units(coefficient)} #{sep}"
      reste -= pow * coefficient
      result += " " if reste != 0
    end
    result += spell_units(@n % 1000)
  end

  # spell number between 0 and 999
  def spell_units(number)
    return "zero" if @n == 0
    reste = number
    result = ""
    # hundreds
    until reste < 100
      hundreds = reste / 100
      result += "#{UNITS[hundreds - 1]} hundred"
      reste -= 100 * hundreds
      result += " " if reste != 0
    end
    dividers = [90, 80, 70, 60, 50, 40, 30] + 20.downto(1).to_a
    until reste == 0
      divider_index = dividers.index {|d| reste / d >= 1}
      divider = dividers[divider_index]
      result += UNITS[-divider_index - 1]
      reste -= divider
      result += "-" if divider >= 20 && reste != 0
    end
    result
  end
end