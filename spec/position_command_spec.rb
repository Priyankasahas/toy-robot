require 'spec_helper'
require './lib/position_command'
require './lib/robot'

RSpec.describe PositionCommand do
  subject { PositionCommand.new('place 0,0,north') }

  context '#initialize' do
    it 'position should return 0,0,north in array format' do
      expect(subject.position).to eq %w[0 0 north]
    end

    it 'x_axis should return 0' do
      expect(subject.x_axis).to eq 0
    end

    it 'y_axis should return 0' do
      expect(subject.y_axis).to eq 0
    end

    context 'direction' do
      it 'direction should return north' do
        expect(subject.direction).to eq 'north'
      end
    end
  end

  context '#process_command' do
    context 'when command is move' do
      before do
        subject.process_command(%w[MOVE REPORT])
      end

      it 'should create robot with x_axis as an attribute' do
        expect(subject.robot.x_axis).to eq 0
      end

      it 'should create robot with y_axis as an attribute' do
        expect(subject.robot.y_axis).to eq 1
      end

      it 'should create robot with direction as an attribute' do
        expect(subject.robot.facing_direction.direction).to eq 'NORTH'
      end
    end
    context 'when command is left' do
      before do
        subject.process_command(%w[LEFT REPORT])
      end

      it 'should create robot with x_axis as an attribute' do
        expect(subject.robot.x_axis).to eq 0
      end

      it 'should create robot with y_axis as an attribute' do
        expect(subject.robot.y_axis).to eq 0
      end

      it 'should create robot with direction as an attribute' do
        expect(subject.robot.facing_direction.direction).to eq 'WEST'
      end
    end

    context 'when command is right' do
      before do
        subject.process_command(%w[RIGHT REPORT])
      end

      it 'should create robot with x_axis as an attribute' do
        expect(subject.robot.x_axis).to eq 0
      end

      it 'should create robot with y_axis as an attribute' do
        expect(subject.robot.y_axis).to eq 0
      end

      it 'should create robot with direction as an attribute' do
        expect(subject.robot.facing_direction.direction).to eq 'EAST'
      end
    end
  end
end
