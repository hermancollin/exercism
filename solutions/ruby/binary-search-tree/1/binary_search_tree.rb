Node = Struct.new(:data, :left, :right)

class Bst
  
  attr_reader :data
  def initialize(root)
    @data = root
    @head = Node.new(root, nil, nil)
  end

  def left = @head.left
  def right = @head.right

  def insert(new_node)
    parent = nil
    node = @head
    while node
      parent = node
      go_left = new_node <= node.data
      node = go_left ? node.left : node.right
      if node == nil
        to_insert = Node.new(new_node, nil, nil)
        parent.left = to_insert if go_left
        parent.right = to_insert if not go_left
      end
    end
  end

  def each
    return to_enum(:each) unless block_given?
    @stack = []
    push_left_nodes(@head)
    while @stack.length > 0
      node = @stack.pop
      push_left_nodes(node.right)
      yield node.data
    end
  end

  private
  def push_left_nodes(node)
    while node
      @stack.push(node)
      node = node.left
    end
  end
end