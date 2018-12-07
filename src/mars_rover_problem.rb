require_relative './rover'
require_relative './plateau'
require_relative './mission_control'
require_relative './directions'

@plateau = Plateau.new(ARGF.gets.split)
@mission_control = MissionControl.new(@plateau)
while !ARGF.eof
  @rover = Rover.new(ARGF.gets.split)
  @mission_control.add_rover(@rover)
  @path = ARGF.gets
  @mission_control.start_mission(@path)
  puts @rover.get_status
end
