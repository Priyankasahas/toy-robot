# Face North
class FacingNorth
  attr_accessor :robot, :direction

  def initialize(robot)
    @robot = robot
    @direction = 'NORTH'
  end

  def left
    @robot.facing_direction = @robot.facing_west
  end

  def right
    @robot.facing_direction = @robot.facing_east
  end

  def move
    @robot.set_position(@robot.x_axis, @robot.y_axis + 1)
  end
end
