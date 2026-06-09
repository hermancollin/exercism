class Microwave
  def initialize(n)
    digits = "%04d" % n
    @seconds = digits[2..].to_i % 60
    @minutes = digits[..1].to_i + digits[2..].to_i / 60
  end
  
  def timer = "#{"%02d" % @minutes}:#{"%02d" % @seconds}"
end