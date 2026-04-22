class TwoBucket
  WORD_TO_INDEX = {"one" => 0, "two" => 1}.freeze
  
  attr_reader :moves, :goal_bucket, :other_bucket
  def initialize(size1, size2, desired, starting_bucket)
    raise ArgumentError if desired % size1.gcd(size2) != 0
    @to_fill = WORD_TO_INDEX[starting_bucket]
    @other = @to_fill - 1
    @sizes = [size1, size2]
    @state = [0, 0]
    @state[@to_fill] = @sizes[@to_fill] # first move is mandatory
    @moves = 1
    
    if @sizes[@other] == desired # special case
      @state[@other] = desired
      @moves += 1
    end
    
    until @state.include?(desired)
      if @state[@to_fill] == 0 then @state[@to_fill] = @sizes[@to_fill]
      elsif @state[@to_fill] == @sizes[@to_fill] then transfer!
      elsif @state[@other] == @sizes[@other] then @state[@other] = 0
      elsif @state[@other] < @sizes[@other] then transfer!
      else @state[@to_fill] = @sizes[@to_fill]
      end
      @moves += 1
    end
    @goal_bucket = WORD_TO_INDEX.invert[@state.index(desired)]
    @other_bucket = @state[WORD_TO_INDEX[@goal_bucket] - 1]
  end

  def transfer!
    to_transfer = @state[@to_fill]
    transferable = [@sizes[@other] - @state[@other], to_transfer].min
    @state[@to_fill] = to_transfer - transferable
    @state[@other] += transferable
  end
end