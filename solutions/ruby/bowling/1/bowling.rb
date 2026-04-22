class Game
  def initialize
    @rolls = []
    @frames = []
    @current_frame = []
  end

  class BowlingError < StandardError; end
  
  def roll(pins)
    raise BowlingError unless (0..10).include?(pins)
    
    @rolls << pins
    if @frames.length == 10        # bonus rolls
      if @frames.last == [10]        # 2 fill ball for strike
        raise BowlingError if @current_frame.length == 2
      elsif @frames.last.sum == 10   # 1 fill ball for spare
        raise BowlingError unless @current_frame.empty?
      else
        raise BowlingError
      end
      @current_frame << pins
      raise BowlingError if @current_frame.sum > 10 && @current_frame[-2] != 10
      return
    end
    
    if pins == 10
      @frames << [10]
      @current_frame = []
    else
      @current_frame << pins
    end
    
    if @current_frame.length == 2 && @frames.length < 10
      raise BowlingError if @current_frame.sum > 10
      @frames << @current_frame
      @current_frame = []
    end
    
  end

  def score
    raise BowlingError if @frames.length < 10
    # bonus rolls must be rolled before score can be computed
    if @frames.last == [10]  # 2 bonus rolls required
      raise BowlingError if @current_frame.length != 2
    elsif @frames.last.sum == 10 # 1 bonus score required
      raise BowlingError if @current_frame.length != 1
    end
    @frames << @current_frame unless @current_frame.empty?
    
    score = 0
    frames_scored = 0
    @frames.each do |frame|
      break if frames_scored == 10
      if frame == [10]
        @rolls = @rolls[1..]
        score += (10 + @rolls[0] + @rolls[1])
      else
        pins = frame.sum
        @rolls = @rolls[2..]
        if pins == 10
          score += (10 + @rolls[0])
        else
          score += pins
        end
      end
      frames_scored += 1
    end
    score
  end
end