require './run_program'

# Positions Robot
class PositionCommand
  attr_accessor :position, :x_axis, :y_axis, :direction, :command, :robot

  def initialize(command)
    input = command.split(' ')
    @command = input[0]
    return unless input[1]
    @position = input[1].split(',')

    @x_axis = @position[0].to_i
    @y_axis = @position[1].to_i
    if valid_direction?(@position[2])
      @direction = @position[2]
    else
      RunProgram.new
    end
  end

  def process_command(command)
    command = command.split if command.is_a? String
    commands = valid_commands(command)
    @robot = Robot.new(@x_axis, @y_axis, @direction, commands)
  end

  def valid_direction?(direction)
    valid_directions = %w[NORTH SOUTH EAST WEST]
    direction = direction.upcase
    (valid_directions & direction.split(' ')).empty? ? false : true
  end

  def valid_commands(command)
    valid_commands = %w[PLACE MOVE LEFT RIGHT REPORT]
    command.each do |c|
      command - c.split unless valid_commands.include? c
    end
    command
  end
end
