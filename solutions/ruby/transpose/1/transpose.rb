module Transpose
  def Transpose.transpose(inputs)
    max_length = inputs.lines.map { |l| l.strip.length }.max
    inputs.lines
      .map { |l| l.strip.ljust(max_length, '%').each_char.to_a }
      .transpose
      .map {|line| line.join.gsub(/%+$/, "") } # remove trailing padding
      .join("\n")
      .gsub('%', ' ')                          # remove inner padding
  end
end