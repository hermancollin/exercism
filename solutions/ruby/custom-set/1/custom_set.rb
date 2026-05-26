class CustomSet
  attr_reader :data
  def initialize(values) = @data = values
  def empty? = data.empty?
  def member?(element) = data.include?(element)
  def subset?(other) = data.all? { other.member?(_1) }
  def ==(other) = self.subset?(other) && other.subset?(self)
  def disjoint?(other) = data.none? { other.member?(_1) }
  def intersection(other) = CustomSet.new data.select { other.member?(_1) }
  def difference(other) = CustomSet.new data.select { !other.member?(_1) }
    
  def add(element)
    data.push(element) unless self.member?(element)
    self
  end
  
  def union(other)
    result = CustomSet.new data
    other.data.each {|element| result.add(element)}
    result
  end
end