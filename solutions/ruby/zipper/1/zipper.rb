class Node
  attr_accessor :value, :children
  def initialize(value, *children)
    @value = value
    @children = children
  end

  def ==(other)
    value == other.value && 
      children.zip(other.children).all? { _1 == _2 }
  end
end

class Zipper
  def initialize(tree)
    @tree = tree
    @focus = tree
    @parents = [nil]
  end

  def ==(other) = @tree == other.to_tree
  
  def self.from_tree(tree) = Zipper.new(tree)
    
  def to_tree = @tree

  def value = @focus.value

  def set_value(val)
    @focus.value = val
    self
  end

  def set_child(val, index)
    @focus.children[index] = val
    self
  end
  
  def set_left(val) = set_child(val, 0)
  def set_right(val) = set_child(val, 1)

  def down(left_or_right)
    @parents << @focus
    @focus = @focus.children[left_or_right]
    return @focus ? self : nil
  end

  def left = down(0)
  def right = down(1)

  def up
    @focus = @parents.pop
    return @focus ? self : nil
  end
end