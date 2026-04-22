module ResistorColor
  COLORS = %w[black brown red orange yellow green blue violet grey white]
  def self.color_code(color)
    COLORS.index(color).to_i
  end
end