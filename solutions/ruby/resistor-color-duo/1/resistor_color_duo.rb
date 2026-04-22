module ResistorColorDuo
  def self.value(colors)
    color_code = {
      black: 0, brown: 1, red: 2, orange: 3, yellow: 4,
      green: 5, blue: 6, violet: 7, grey: 8, white: 9
    }
    digits = colors.map { |c| color_code[c.to_sym]}
    10 * digits[0] + digits[1]
  end
end
