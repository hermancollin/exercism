class Element
  attr_accessor :next, :datum
  def initialize(datum)
    @datum = datum
    @next = nil
  end
end

class SimpleLinkedList
  def initialize(values=nil)
    @head = nil
    values.each { |v| self.push(Element.new(v)) } if values
  end

  def push(elem)
    elem.next = @head
    @head = elem
    return self
  end

  def pop
    popped = @head
    if popped
      @head = popped.next
      popped.next = nil
    end
    return popped
  end

  def to_a
    current = @head
    array = []
    while current != nil
      array << current.datum
      current = current.next
    end
    array
  end

  def reverse!
    elems = []
    while elem = self.pop
      elems << elem
    end
    elems.each { |e| self.push(e) }
    return self
  end
end