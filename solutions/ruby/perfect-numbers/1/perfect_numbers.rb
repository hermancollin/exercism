module PerfectNumber
  def self.classify(n)
    if n <= 0
      err_msg = "Classification is only possible for positive integers."
      raise ArgumentError, err_msg
    end
    return "deficient" if n == 1  # edge case
    aliquot = (1..n/2).filter {|x| n % x == 0}.uniq.sum
    case aliquot
    when n then "perfect"
    when (1...n) then "deficient"
    else "abundant"
    end
  end
end