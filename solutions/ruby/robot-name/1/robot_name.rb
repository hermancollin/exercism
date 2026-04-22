require 'set'

class Robot

  @@taken_names = Set.new

  attr_reader :name
  def initialize = @name = Robot.new_name

  def reset = @name = Robot.new_name

  def Robot.forget
    @@taken_names = Set.new
  end

  def Robot.new_name
    candidate = rand(26 * 26 * 1000)
    until @@taken_names.add?(candidate)
      candidate = rand(26*26*1000)
    end
    digits = format('%03d', candidate % 1000)
    chars = ('AA'..'ZZ').drop(candidate / 1000).first
    [chars, digits].join
  end

end
