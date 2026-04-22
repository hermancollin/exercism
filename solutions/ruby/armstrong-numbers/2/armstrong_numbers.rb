module ArmstrongNumbers
  def self.include?(number)
    number == number.digits.sum { |n| n ** number.digits.length }
  end
end
