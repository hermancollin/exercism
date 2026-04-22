module ResistorColorDuo
  COLORS = %w[black brown red orange yellow green blue violet grey white]
  def self.value(colors)
    colors.map {|c| COLORS.index(c)}
      .join
      .to_i
  end
end
