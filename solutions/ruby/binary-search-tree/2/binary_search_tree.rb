class Bst < Struct.new(:data, :left, :right)
  
  def insert(n)
    if n <= data
      left ? left.insert(n) : self.left = Bst.new(n)
    else
      right ? right.insert(n) : self.right = Bst.new(n)
    end
  end

  def each
    return to_enum(:each) unless block_given?

    left&.each { yield _1 }
    yield data
    right&.each { yield _1 }
  end
end