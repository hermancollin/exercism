require 'ostruct'

class Palindromes
  def initialize(max_factor:, min_factor: 1)
    raise ArgumentError, "min must be <= max" if max_factor < min_factor
    @upper = max_factor
    @lower = min_factor
  end

  def generate
    @max_pal = find_palindrome((@upper**2).downto(@lower**2))
    @min_pal = find_palindrome((@lower**2).upto(@upper**2))
  end

  def smallest
    @min_pal || OpenStruct.new(value: nil, factors: [])
  end

  def largest
    @max_pal || OpenStruct.new(value: nil, factors: [])
  end

  private def find_palindrome(range)
    range.each do |n|
      if n.to_s == n.to_s.reverse
        # find factors
        f = []
        limit = Math.sqrt(n).to_i
        (@lower..limit).each do |f1|
          next if n % f1 != 0
          f2 = n / f1
          f << [f1, f2] if (@lower..@upper).cover?(f2)
        end
        return OpenStruct.new(value: n, factors: f) unless f.empty?
      end
    end
    nil
  end
end