require './lib/directions/facing_north'
require './lib/directions/facing_south'
require './lib/directions/facing_east'
require './lib/directions/facing_west'
require './lib/position_command'

class Robot
  attr_accessor :position, :facing_direction, :command, :facing_west, :facing_east, :facing_south, :facing_north, :x_axis, :y_axis

  def initialize (x_axis, y_axis, direction, command)
    @x_axis = x_axis
    @y_axis = y_axis
    @facing_direction = get_direction(direction) #Gets the current direction of the robot

    @facing_north = get_direction("north")
    @facing_south = get_direction("south")
    @facing_east = get_direction("east")
    @facing_west = get_direction("west")

    unless command.to_s.capitalize == "Place"
      @command = run_command(command)
    end
  end

  #Initialization of the Command models
  def run_command(command)
    unless command.nil?
      command.each do |command|
        command = command.split(/[^a-z0-9]/i).map { |w| w.capitalize }.join
        get_command(command)
      end
    end
  end

  def get_command(command)
    case command.to_s
      when "Move"
        self.facing_direction.move
      when "Left"
        self.facing_direction.left
      when "Right"
        self.facing_direction.right
      else
        puts "The current position of the robot is: #{self.output}"
    end
  end

  #Sets the new position of the robot
  def set_position(position_x, position_y)
    if is_valid?(position_x)
      @x_axis = position_x
    end
    if is_valid?(position_y)
      @y_axis = position_y
    end
  end

  def is_valid?(position)
    position >= 0 && position <= 5
  end

  #Outputs the current position and direction of the robot
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