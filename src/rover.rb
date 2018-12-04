class Rover
  DIRECTIONS = %w[N E S W].freeze

  # # # # # # # # # # # # #
  # @type [String] path
  # @type [Array]  plateau
  # # # # # # # # # # # # #
  def start_mission(path, plateau)
    @plateau = {x: Integer(plateau[0]), y: Integer(plateau[1])}
    path.each_char do |character|
      case character
      when 'L' then turn_left
      when 'R' then turn_right
      when 'M' then move
      end
    end
    get_position
  end

  # # # # # # # # # # # # #
  # @type [Array] coordinate
  # # # # # # # # # # # # #
  def initialize(coordinate)
    @position = {x: coordinate[0].to_i, y: coordinate[1].to_i, facing: coordinate[2]}
  end

  def turn_left
    index = DIRECTIONS.index(@position[:facing])
    index.zero? ? @position[:facing] = DIRECTIONS[3] : @position[:facing] = DIRECTIONS[index - 1]
  end

  def turn_right
    index = DIRECTIONS.index(@position[:facing])
    index == 3 ? @position[:facing] = DIRECTIONS[0] : @position[:facing] = DIRECTIONS[index + 1]
  end

  def move
    case @position[:facing]
    when 'N'
      @position[:y] == @plateau[:y] ? @position[:y] = 1 : @position[:y] += 1
    when 'E'
      @position[:x] == @plateau[:x] ? @position[:x] = 1 : @position[:x] += 1
    when 'S'
      @position[:y].zero? ? @position[:y] = @plateau[:y] - 1 : @position[:y] -= 1
    when 'W'
      @position[:x].zero? ? @position[:x] = @plateau[:x] - 1 : @position[:x] -= 1
    end
  end

  # # # # # # # # # # # # #
  # @type [Integer] coordinate_x
  # @type [Integer] coordinate_y
  # # # # # # # # # # # # #
  def set_coordinates(coordinate_x, coordinate_y)
    @position[:x] += coordinate_x
    @position[:y] += coordinate_y
  end

  # # # # # # # # # # # # #
  # @return [String]
  # # # # # # # # # # # # #
  def get_position
    [@position[:x], @position[:y], @position[:facing]].join(' ')
  end

  def direction
    @position[:facing].to_s
  end
end