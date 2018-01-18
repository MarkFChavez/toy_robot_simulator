require 'spec_helper'

describe ToyRobot do
  context "edge-of-table cases" do
    describe "PLACE 0,0,NORTH RIGHT RIGHT MOVE REPORT" do
      it "cannot move further" do
        robot = ToyRobot.new("PLACE 0,0,NORTH RIGHT RIGHT MOVE REPORT")

        expect {
          robot.run!
        }.to raise_error(RuntimeError)
      end
    end

    describe "PLACE 0,2,WEST MOVE REPORT" do
      it "cannot move further" do
        robot = ToyRobot.new("PLACE 0,2,WEST MOVE REPORT")

        expect {
          robot.run!
        }.to raise_error(RuntimeError)
      end
    end

    describe "PLACE 5,3,EAST MOVE REPORT" do
      it "cannot move further" do
        robot = ToyRobot.new("PLACE 5,3,EAST MOVE REPORT")

        expect {
          robot.run!
        }.to raise_error(RuntimeError)
      end
    end

    describe "PLACE 5,0,SOUTH MOVE REPORT" do
      it "cannot move further" do
        robot = ToyRobot.new("PLACE 5,0,SOUTH MOVE REPORT")

        expect {
          robot.run!
        }.to raise_error(RuntimeError)
      end
    end
  end

  describe "PLACE command not provided" do
    it "raises an error" do
      robot = ToyRobot.new("5,0,EAST MOVE MOVE REPORT")
      
      expect {
        robot.run!
      }.to raise_error(RuntimeError)
    end
  end

  describe "PLACE 0,0,NORTH MOVE MOVE MOVE REPORT" do
    before(:each) do
      @robot = ToyRobot.new("PLACE 0,0,NORTH MOVE MOVE MOVE REPORT")
    end

    it "can still move" do
      expect {
        @robot.run!
      }.not_to raise_error(RuntimeError)
    end

    it "x is equal to 0" do
      @robot.run!
      expect(@robot.x).to eq 0
    end

    it "y is equal to 3" do
      @robot.run!
      expect(@robot.y).to eq 3
    end

    it "direction is north" do
      @robot.run! 
      expect(@robot.dir).to eq "NORTH"
    end
  end
end
