class CircularBuffer
  BufferEmptyException = BufferFullException = Class.new(RuntimeError)
  
  def initialize(capacity)
    @size = capacity
    @buffer = []
  end

  def write(val)
    raise BufferFullException if @buffer.length == @size
    @buffer.prepend(val)
  end

  def write!(val)
    if @buffer.length == @size
      @buffer[-1] = val
      @buffer.rotate!(-1)
    else
      write(val)
    end
  end

  def read
    raise BufferEmptyException if @buffer.empty?
    @buffer.pop
  end

  def clear = @buffer = []
end