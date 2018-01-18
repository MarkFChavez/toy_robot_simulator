require 'pry'

class ToyRobot

  attr_reader :x, :y, :dir

  ORIENTATION_DATA = 1
  START_OF_COMMAND = 2
  LEFT_GUIDE = { "NORTH" => "WEST", "WEST" => "SOUTH", "SOUTH" => "EAST", "EAST" => "NORTH" }
  RIGHT_GUIDE = { "NORTH" => "EAST", "EAST" => "SOUTH", "SOUTH" => "WEST", "WEST" => "NORTH" }

  def initialize(commands)
    @commands = commands.split(" ")
  end

  def run!
    raise "PLACE should be the first command!" if @commands[0] != "PLACE"
    set_location_and_move!(@commands)
  end

  private

    def set_location_and_move!(commands)
      @orientation = commands[ORIENTATION_DATA]
      x, y, @dir = @orientation.split(",")
      @x = x.to_i
      @y = y.to_i

      commands[START_OF_COMMAND, commands.length].each do |command|
        send(command.downcase)
      end
    end

    def left
      @dir = move_to_left
    end

    def right
      @dir = move_to_right
    end

    def move
      raise "Cannot move #{@dir} from location (#{@x}, #{@y})" if edge_of_table?
      send("move_#{@dir.downcase}")
    end

    def move_north
      @y = @y + 1
    end

    def move_south
      @y = @y - 1
    end
    def move_east
      @x = @x + 1
    end

    def move_west
      @x = @x - 1
    end

    def move_to_left
      LEFT_GUIDE[@dir]
    end

    def move_to_right
      RIGHT_GUIDE[@dir]
    end

    def report
      puts [@x, @y, @dir].join(",")
    end

    def edge_of_table?
      return @y >= 5 if @dir == "NORTH"
      return @y <= 0 if @dir == "SOUTH"
      return @x >= 5 if @dir == "EAST"
      return @x <= 0 if @dir == "WEST"
    end

end

