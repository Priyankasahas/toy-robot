require 'spec_helper'
require './lib/directions/facing_east'
require './lib/robot'

RSpec.describe FacingSouth do
  let(:robot) { Robot.new(0, 0, 'South', 'place') }
  subject { FacingSouth.new(robot) }

  context '#intialize' do
    it 'its direction should be South' do
      expect(subject.direction).to eq 'SOUTH'
    end
  end

  context '#left' do
    before { subject.left }
    it 'should face the robot in the east direction' do
      expect(subject.robot.facing_direction.direction).to eq 'EAST'
    end
  end

  context '#right' do
    before { subject.right }
    it 'should face the robot in the west direction' do
      expect(subject.robot.facing_direction.direction).to eq 'WEST'
    end
  end

  context '#move' do
    before { subject.move }
    it 'should set the y_axis of the robot to be 0' do
      expect(subject.robot.y_axis).to eq 0
    end
  end
end
