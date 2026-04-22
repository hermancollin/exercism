class ResistorColorTrio
  COLORS = %w[black brown red orange yellow green blue violet grey white]

  def initialize(colors)
    @colors = colors
  end

  def label
    digits = @colors.map {|c| COLORS.index(c).to_i}
    value = digits[0..1].join.to_i * 10**digits[2].to_i
    case value
    when (0...10**3)
      prefix = ""
    when (10**3...10**6)
      prefix = "kilo"
      value /= 10**3
    when (10**6..10**9)
      prefix = "mega"
      value /= 10**6
    else
      prefix = "giga"
      value /= 10**9
    end
    "Resistor value: #{value} #{prefix}ohms"
  end
end