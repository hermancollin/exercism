class Squares
  attr_reader :n, :sum_of_squares, :square_of_sum
  
  def initialize(n)
    @n = n
    @sum_of_squares = (n)*(n + 1)*(2*n + 1)/6
    @square_of_sum = (n*(n+1)/2)**2
  end

  def difference
    square_of_sum - sum_of_squares
  end
end