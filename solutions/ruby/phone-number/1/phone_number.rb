module PhoneNumber
  def self.clean(phone_num)
    digits = phone_num.scan(/[0-9]/).join
    digits = digits[1..] if digits[0] == '1'
    return nil if digits.length != 10 or digits[0].to_i < 2 or digits[3].to_i < 2
    digits
  end
end