MOVES = {east: [1, 0], north: [0, 1], west: [-1, 0], south: [0, -1]}
COMMANDS = {'A' => :advance, 'L' => :turn_left, 'R' => :turn_right}
DIRECTIONS = MOVES.keys

class Robot
  attr_reader :bearing, :coordinates
  
  def orient(dir)
    raise ArgumentError unless DIRECTIONS.include?(dir)
    @bearing = dir
  end

  def at(x,y) = @coordinates = [x, y]

  def advance
    dx, dy = MOVES[bearing]
    self.at(coordinates[0] + dx, coordinates[1] + dy)
  end

  def turn_right 
    @bearing = DIRECTIONS[DIRECTIONS.index(@bearing) - 1]
  end
  
  def turn_left
    @bearing = DIRECTIONS[(DIRECTIONS.index(@bearing) + 1) % 4]
  end
end

class Simulator
  def initialize = @robots = []
  
  def instructions(commands) = commands.each_char.map { COMMANDS[_1] }

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
    @robots << robot
  end

  def evaluate(robot, commands)
    robot_to_move = @robots.find(robot)
    instructions(commands).each { robot.method(_1).call }
  end
end