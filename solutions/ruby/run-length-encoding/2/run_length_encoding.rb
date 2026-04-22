module RunLengthEncoding
  def self.encode(input) = input.gsub(/(.)\1+/) { "#{$&.length}#{$1}" }
  def self.decode(input) = input.gsub(/([0-9])+/) { $'[0] * ($&.to_i - 1) }
end