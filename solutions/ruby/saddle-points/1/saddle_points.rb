module Grid
  def self.saddle_points(input)
    results = []
    input.each_with_index do |row, i|
      row.each_with_index do |elem, j|
        next if elem != row.max
        next if elem != input.map {|row| row[j]}.min
        results << {"row" => i+1, "column" => j+1}
      end
    end
    results
  end
end