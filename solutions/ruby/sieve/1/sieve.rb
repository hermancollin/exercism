class Sieve
  
  attr_reader :primes
  def initialize(n)
    @primes = (2..n).to_a
    (2..n).each do |i|
      number = 2 * i
      while number <= n
        @primes.delete(number)
        number += i
      end
    end
  end
  
end