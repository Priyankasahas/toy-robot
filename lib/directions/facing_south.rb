# Face south
class FacingSouth
  attr_reader :robot, :direction

  def initialize(robot)
    @robot = robot
    @direction = 'SOUTH'
  end

  def left
    @robot.facing_direction = @robot.facing_east
  end

  def right
    @robot.facing_direction = @robot.facing_west
  end

  def move
    @robot.set_position(@robot.x_axis, @robot.y_axis - 1)
  end
end
