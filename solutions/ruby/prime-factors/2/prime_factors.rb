module PrimeFactors
  def PrimeFactors.of(n, factors = [])
    return factors if n < 2 
    factor = (2..).lazy.find { n % _1 == 0 }
    
    PrimeFactors.of(n / factor, factors.push(factor))
  end
end