require_relative './lib/toy_robot'

TESTS = [
  "PLACE 0,0,NORTH MOVE MOVE MOVE RIGHT MOVE MOVE REPORT",
  "PLACE 0,0,NORTH MOVE RIGHT MOVE LEFT MOVE REPORT",
  "PLACE 3,2,EAST MOVE MOVE REPORT",
  "PLACE 0,5,NORTH MOVE MOVE REPORT",
]


TESTS.each do |test|
  robot = ToyRobot.new(test)
  puts "Running #{test}"
  robot.run!
  puts ""
end
