class Game
  def initialize
    @rolls = []
    @frames = []
    @cur_frame = []
  end

  class BowlingError < StandardError; end
  
  def roll(pins)
    raise BowlingError unless (0..10).include?(pins)
    
    @rolls << pins
    if @frames.length == 10        # bonus rolls
      if @frames.last == [10]        # 2 fill ball for strike
        raise BowlingError if @cur_frame.length == 2
      elsif @frames.last.sum == 10   # 1 fill ball for spare
        raise BowlingError unless @cur_frame.empty?
      else
        raise BowlingError # cannot roll if game already has 10 frames
      end
      @cur_frame << pins
      raise BowlingError if @cur_frame.sum > 10 && @cur_frame[-2] != 10
      return
    end
    
    @cur_frame << pins
    if current_frame_full?
      raise BowlingError if @cur_frame.sum > 10
      @frames << @cur_frame
      @cur_frame = []
    end
  end

  def score
    raise BowlingError if missing_rolls?
    @frames << @cur_frame unless @cur_frame.empty?
    
    @frames.take(10).sum do |frame|
      case
      when frame == [10]            # strike
        @rolls = @rolls[1..]
        10 + @rolls[0] + @rolls[1]
      when frame.sum == 10          # spare
        @rolls = @rolls[2..]
        10 + @rolls[0]
      else                          # open frame
        @rolls = @rolls[2..]
        frame.sum
      end
    end
  end

  private

  def current_frame_full?
    @cur_frame == [10] || @cur_frame.length == 2 && @frames.length < 10
  end

  def missing_rolls?
    return true if @frames.length < 10
    if @frames.last == [10]
      true if @cur_frame.length != 2
    elsif @frames.last.sum == 10
      true if @cur_frame.length != 1
    else
      false
    end
  end
end