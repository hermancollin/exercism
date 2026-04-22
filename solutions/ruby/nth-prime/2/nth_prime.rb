class Integer
  def prime? = (2..self ** 0.5).none? {|p| self % p == 0}
end

module Prime
  def self.nth(n)
    raise ArgumentError unless n.positive?
    primes = []
    (2..).each do |i|
      primes << i if i.prime?
      break if primes.length == n
    end
    primes[-1]
  end
end