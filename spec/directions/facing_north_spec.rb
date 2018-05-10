require 'spec_helper'
require './lib/directions/facing_east'
require './lib/robot'

RSpec.describe FacingNorth do
  let(:robot) { Robot.new(0, 0, "North", "place") }
  subject { FacingNorth.new(robot) }

  context "#intialize" do
    it "its direction should be North" do
      expect(subject.direction).to eq "NORTH"
    end
  end

  context "#left" do
    before { subject.left }
    it "should face the robot in the west direction" do
      expect(subject.robot.facing_direction.direction).to eq "WEST"
    end
  end

  context "#right" do
    before { subject.right }
    it "should face the robot in the EAST direction" do
      expect(subject.robot.facing_direction.direction).to eq "EAST"
    end
  end

  context "#move" do
    before { subject.move }
    it "should set the y_axis of the robot to be 1" do
      expect(subject.robot.y_axis).to eq 1
    end
  end
end
