module ArmstrongNumbers
  def self.include?(number)
    digits = number.to_s
    number == digits.each_char.map(&:to_i).map { |d| d**digits.length }.sum
  end
end
