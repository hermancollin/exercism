module OcrNumbers
  MAPPING = {
    " _ | ||_|" => 0, "     |  |" => 1, " _  _||_ " => 2,
    " _  _| _|" => 3, "   |_|  |" => 4, " _ |_  _|" => 5,
    " _ |_ |_|" => 6, " _   |  |" => 7, " _ |_||_|" => 8,
    " _ |_| _|" => 9
  }.freeze
  
  def self.convert(input)
    rows = input.split("\n")
    raise ArgumentError if rows.length % 4 != 0
    raise ArgumentError if rows.any? { _1.length % 3 != 0 }
    
    rows.each_slice(4).map do |lines|
      lines.pop
      (0...lines.first.length / 3).map do |i|
        char = lines.map { _1[3*i..3*i+2] }.join
        MAPPING.key?(char) ? MAPPING[char].to_s : "?"
      end.join
    end.join(",")
  end
end