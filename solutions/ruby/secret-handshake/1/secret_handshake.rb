class SecretHandshake
  def initialize(num)
    @num = num
  end

  COMMANDS = {
    1 => "wink", 2 => "double blink",
    4 => "close your eyes", 8 => "jump"
  }.freeze
  
  def commands
    result = COMMANDS.filter do |mask, _| 
      @num & mask == mask 
    end.values
    result.reverse! if @num & 16 == 16
    
    result
  end
end