class BinarySearch
  def initialize(arr)
    @arr = arr
  end

  def search_for(n)
    return nil if @arr.empty? || @arr.none?(n)
    index = 0
    domain = @arr
    Math.log2(domain.length).ceil.times do
      step = (domain.length / 2).to_i
      mid = domain[step]
      if n >= mid
        return index + step if n == mid
        domain = domain[step..]
        index += step
      else
        domain = domain[..step]
      end
    end
    
    index
  end
end