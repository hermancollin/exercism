class SecretHandshake
  def initialize(num) = @num = num
  
  COMMANDS = ["wink", "double blink", "close your eyes", "jump"]
  
  def commands
    [1, 2, 4, 8].zip(COMMANDS).to_h
                .filter { |mask, _| @num & mask == mask }
                .values
                .send(@num & 16 == 16 ? :reverse : :itself)
  end
end