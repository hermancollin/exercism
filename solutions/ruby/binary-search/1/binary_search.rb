class BinarySearch
  def initialize(arr)
    @arr = arr
  end

  def search_for(n)
    return nil if @arr.empty?
    return nil unless (@arr[0]..@arr[-1]).include?(n)
    index = 0
    domain = @arr
    n_iter = Math.log2(domain.length).ceil
    n_iter.times do
      step = (domain.length / 2).to_i
      mid = domain[step]
      debug "#{domain} #{mid}"
      if n >= mid
        return index + step if n == mid
        domain = domain[step..]
        index += step
      else
        domain = domain[..step]
      end
    end
    return nil unless domain.include?(n)
    index
  end
end