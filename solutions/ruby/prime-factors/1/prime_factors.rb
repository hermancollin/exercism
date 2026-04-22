module PrimeFactors
  def self.of(n)
    factors = []
    while n > 1
      prime_factor = (2..).lazy.find { n % _1 == 0 }
      factors << prime_factor
      n /= prime_factor
    end
    
    factors
  end
end