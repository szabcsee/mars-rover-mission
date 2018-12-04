require_relative './rover'

ARGF.each_line do |line|
  case line.strip.split.count
    when 2
      @plateau = line.split
    when 3
      @rover = Rover.new(line.split)
    else
      puts @rover.start_mission(line, @plateau)
  end
end
