module Prime
  def self.nth(n)
    raise ArgumentError unless n.positive?
    primes = []
    (2..).each do |i|
      primes << i if primes.none? {|p| i % p == 0}
      break if primes.length == n
    end
    primes[-1]
  end
end
