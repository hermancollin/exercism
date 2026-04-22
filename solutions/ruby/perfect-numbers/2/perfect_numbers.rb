module PerfectNumber
  ERR_MSG = "Classification is only possible for positive integers."
  def self.classify(n)
    raise ArgumentError, ERR_MSG if n <= 0
    aliquot = (1..n/2).filter {|x| n % x == 0}.sum
    return "perfect" if aliquot == n
    return "abundant" if aliquot > n
    
    "deficient"
  end
end