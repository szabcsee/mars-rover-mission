require_relative './rover'
require_relative './plateau'
require_relative './directions/directions'
require_relative './directions/east'
require_relative './directions/west'
require_relative './directions/south'
require_relative './directions/north'


ARGF.each_line do |line|
  case line.strip.split.count
    when 2
      @plateau = Plateau.new(line.split)
    when 3
      @rover = Rover.new(line.split)
    else
      puts @rover.start_mission(line, @plateau)
  end
end
