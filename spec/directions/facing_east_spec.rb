require 'spec_helper'
require './lib/directions/facing_east'
require './lib/robot'

RSpec.describe FacingEast do
  let(:robot) { Robot.new(0, 0, 'East', 'place') }
  subject { FacingEast.new(robot) }

  context '#intialize' do
    it 'its direction should be EAST' do
      expect(subject.direction).to eq 'EAST'
    end
  end

  context '#left' do
    before { subject.left }
    it 'should face the robot in the north direction' do
      expect(subject.robot.facing_direction.direction).to eq 'NORTH'
    end
  end

  context '#right' do
    before { subject.right }
    it 'should face the robot in the south direction' do
      expect(subject.robot.facing_direction.direction).to eq 'SOUTH'
    end
  end

  context '#move' do
    before { subject.move }
    it 'should set the x_axis of the robot to be 1' do
      expect(subject.robot.x_axis).to eq 1
    end
  end
end
