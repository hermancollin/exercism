module ListOps
  def ListOps.arrays(arr)
    result = 0
    arr.each { |_| result += 1 }

    result
  end

  def ListOps.factorial_reducer(arr)
    result = 1
    arr.each { |x| result *= x }

    result
  end
  
  def ListOps.sum_reducer(arr)
    result = 0
    arr.each { |x| result += x }

    result
  end
  
  def ListOps.filterer(arr)
    result = []
    arr.each { |x| result << x if yield(x)}

    result
  end
  
  def ListOps.concatter(arr1, arr2)
    len1 = ListOps.arrays(arr1)
    len2 = ListOps.arrays(arr2)
    result = []
    (0...len1).each { |index| result << arr1[index]}
    (0...len2).each { |index| result << arr2[index]}

    result
  end
    
  def ListOps.mapper(arr, &block)
    result = []
    arr.each { |x| result << yield(x) }
    
    result
  end

  def ListOps.reverser(arr)
    result = []
    len = ListOps.arrays(arr)
    arr.each_with_index { |x| result << arr[len - x] }
    
    result
  end
end