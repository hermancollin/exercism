require 'ostruct'

class Palindromes
  def initialize(max_factor:, min_factor: 1)
    raise ArgumentError, "min must be <= max" if max_factor < min_factor
    @upper = max_factor
    @lower = min_factor
  end

  def generate
    @max_pal = find_palindrome(:down)
    @min_pal = find_palindrome(:up)
  end

  def smallest
    @min_pal || OpenStruct.new(value: nil, factors: [])
  end

  def largest
    @max_pal || OpenStruct.new(value: nil, factors: [])
  end

  private

  def find_palindrome(direction)
    range = if direction == :down
              (@upper * @upper).step(@lower * @lower, -1)
            else
              (@lower * @lower).upto(@upper * @upper)
            end

    range.each do |n|
      if palindrome?(n)
        f = get_factors(n)
        return OpenStruct.new(value: n, factors: f) unless f.empty?
      end
    end
    nil
  end

  def palindrome?(n) = n.to_s == n.to_s.reverse

  def get_factors(n)
    factors = []
    limit = Math.sqrt(n).to_i
    (@lower..limit).each do |f1|
      next if n % f1 != 0
      f2 = n / f1
      factors << [f1, f2] if (@lower..@upper).cover?(f2)
    end
    factors
  end
end