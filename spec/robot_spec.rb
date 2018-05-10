require 'spec_helper'
require './lib/robot'

RSpec.describe Robot do
  subject { Robot.new(0, 0, "north", "place") }

  context "#initialize" do
    it "x_axis should return 0" do
      expect(subject.x_axis).to eq 0
    end

    it "y_axis should return 0" do
      expect(subject.y_axis).to eq 0
    end

    it "facing_direction should return NORTH" do
      expect(subject.facing_direction.direction).to eq "NORTH"
    end
  end

  context "#run_command" do
    context "when command is Move" do
      before { subject.run_command(["Move"]) }

      it "y_axis should return 1" do
        expect(subject.y_axis).to eq 1
      end
    end

    context "when command is Left" do
      before { subject.run_command(["Left"]) }

      it "direction should return WEST" do
        expect(subject.facing_direction.direction).to eq "WEST"
      end
    end

    context "when command is Right" do
      before { subject.run_command(["Right"]) }

      it "direction should return EAST" do
        expect(subject.facing_direction.direction).to eq "EAST"
      end
    end
  end

  context "#set_position" do
    context "should set the position of the robot" do
      it "x_axis should return 1" do
        subject.set_position(1, 0)
        expect(subject.x_axis).to eq 1
      end

      it "y_axis should return 1" do
        subject.set_position(0, 1)
        expect(subject.y_axis).to eq 1
      end

      it "x_axis should not return -1" do
        subject.set_position(-1, 0)
        expect(subject.x_axis).not_to eq -1
      end
      it "y_axis should not return -1" do
        subject.set_position(0, -1)
        expect(subject.y_axis).not_to eq -1
      end
    end
  end

  context "#output" do
    it "should return 0,0,NORTH" do
      expect(subject.output).to eq "0,0,NORTH"
    end
  end
end
