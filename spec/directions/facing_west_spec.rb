require 'spec_helper'
require './lib/directions/facing_east'
require './lib/robot'

RSpec.describe FacingWest do
  let(:robot) { Robot.new(0, 0, 'West', 'place') }
  subject { FacingWest.new(robot) }

  context '#intialize' do
    it 'its direction should be West' do
      expect(subject.direction).to eq 'WEST'
    end
  end

  context '#left' do
    before { subject.left }
    it 'should face the robot in the south direction' do
      expect(subject.robot.facing_direction.direction).to eq 'SOUTH'
    end
  end

  context '#right' do
    before { subject.right }
    it 'should face the robot in the north direction' do
      expect(subject.robot.facing_direction.direction).to eq 'NORTH'
    end
  end

  context '#move' do
    before { subject.move }
    it 'should set the y_axis of the robot to be 1' do
      expect(subject.robot.x_axis).to eq 0
    end
  end
end
