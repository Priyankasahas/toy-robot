require './run_program'

class PositionCommand
  attr_accessor :position, :x_axis, :y_axis, :direction, :command, :robot

  def initialize(command)
    input = command.split(' ')
    @command = input[0]
    unless input[1].nil?
      @position = input[1].split(",")

      @x_axis = @position[0].to_i
      @y_axis = @position[1].to_i
      if is_valid_direction?(@position[2])
        @direction = @position[2]
      else
        RunProgram.new()
      end
    end
  end

  def process_command(command)
    if command.kind_of? String
      command = command.split
    end
    commands = valid_commands(command)
    @robot = Robot.new(@x_axis, @y_axis, @direction, commands)
  end

  def is_valid_direction?(direction)
    valid_directions = ["NORTH", "SOUTH", "EAST", "WEST"]
    direction = direction.upcase
    (valid_directions & direction.split(" ")).empty? ? false : true
  end

  def valid_commands(command)
    valid_commands = ["PLACE", "MOVE", "LEFT", "RIGHT", "REPORT"]
    command.each do |c|
      unless valid_commands.include? c
        command - c.split
      end
    end
    command
  end

end