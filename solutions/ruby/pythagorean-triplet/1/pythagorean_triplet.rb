module PythagoreanTriplet
  def self.triplets_with_sum(n)
    triplets = []

    # 'a' must be less than n/3 to satisfy a < b < c
    (1..(n / 3)).each do |a|
      # check if b is an integer
      numerator = n * (n - 2 * a)
      denominator = 2 * (n - a)
      if numerator % denominator == 0
        b = numerator / denominator
        c = n - a - b
        if a < b
          triplets << [a, b, c]
        end
      end
    end
    triplets
  end
end
