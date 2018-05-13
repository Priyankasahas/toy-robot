require './lib/directions/facing_north'
require './lib/directions/facing_south'
require './lib/directions/facing_east'
require './lib/directions/facing_west'
require './lib/position_command'

# Robot Actions
class Robot
  attr_accessor :position, :facing_direction, :command, :facing_west,
                :facing_east, :facing_south, :facing_north, :x_axis, :y_axis

  def initialize(x_axis, y_axis, direction, command)
    @x_axis = x_axis
    @y_axis = y_axis
    @facing_direction = get_direction(direction)

    @facing_north = get_direction('north')
    @facing_south = get_direction('south')
    @facing_east = get_direction('east')
    @facing_west = get_direction('west')

    @command = run_command(command) unless command.to_s.capitalize == 'Place'
  end

  # Initialization of the Command models
  def run_command(command)
    return unless command
    command.each do |c|
      com = c.split(/[^a-z0-9]/i).map(&:capitalize).join
      get_command(com)
    end
  end

  def get_command(command)
    case command.to_s
    when 'Move'
      facing_direction.move
    when 'Left'
      facing_direction.left
    when 'Right'
      facing_direction.right
    else
      puts "The current position of the robot is: #{output}"
    end
  end

  # Sets the new position of the robot
  def set_position(position_x, position_y)
    @x_axis = position_x if valid?(position_x)
    @y_axis = position_y if valid?(position_y)
  end

  def valid?(position)
    position >= 0 && position <= 5
  end

  # Outputs the current position and direction of the robot
  def output
    "#{@x_axis},#{@y_axis},#{@facing_direction.direction}"
  end

  def get_direction(d)
    case d.to_s.upcase
    when 'SOUTH'
      FacingSouth.new(self)
    when 'EAST'
      FacingEast.new(self)
    when 'WEST'
      FacingWest.new(self)
    else
      FacingNorth.new(self)
    end
  end
end
