class Integer
  def prime? = (2..self ** 0.5).none? {|p| self % p == 0}
end

module Prime
  def self.nth(n)
    raise ArgumentError unless n.positive?
    (2..).lazy.filter(&:prime?).take(n).to_a.last
  end
end