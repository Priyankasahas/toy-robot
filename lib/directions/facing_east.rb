# Face East
class FacingEast
  attr_reader :robot, :direction

  def initialize(robot)
    @robot = robot
    @direction = 'EAST'
  end

  def left
    @robot.facing_direction = @robot.facing_north
  end

  def right
    @robot.facing_direction = @robot.facing_south
  end

  def move
    @robot.set_position(@robot.x_axis + 1, @robot.y_axis)
  end
end
