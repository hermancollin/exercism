class SecretHandshake
  def initialize(num)
    @num = num
  end

  COMMANDS = [1, 2, 4, 8].zip(
    ["wink", "double blink", "close your eyes", "jump"]
  ).to_h.freeze
  
  def commands
    result = COMMANDS.filter do |mask, _| 
      @num & mask == mask 
    end.values.then { @num & 16 == 16 ? _1.reverse : _1 }
  end
end