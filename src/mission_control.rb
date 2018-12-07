class MissionControl
  COMMANDS = {L: 'turn_left', R: 'turn_right', M: 'move'}

  # @type [String] path
  def start_mission(path)
    path.each_char do |character|
      execute(character) unless COMMANDS[character.to_sym].nil?
    end
  end

  def initialize(plateau)
    @plateau = plateau
  end

  def add_rover(rover)
    @rover = rover
  end

  def execute(command)
    if command == 'M'
      return unless @plateau.within_boundaries?(@rover.position, @rover.direction)
    end
    @rover.send(COMMANDS[command.to_sym])
  end
end