class Rover
  DIRECTIONS = %w[N E S W].freeze

  # @type [String] path
  # @type [Plateau]  plateau
  def start_mission(path, plateau)
    @plateau = plateau
    path.each_char do |character|
      case character
      when 'L' then turn_left
      when 'R' then turn_right
      when 'M' then move
      end
    end
    get_position
  end

  # @type [Array] coordinate
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
    @position = @plateau.move_rover(@position)
  end

  # @type [Integer] coordinate_x
  # @type [Integer] coordinate_y
  def set_coordinates(coordinate_x, coordinate_y)
    @position[:x] += coordinate_x
    @position[:y] += coordinate_y
  end

  # @return [String]
  def get_position
    [@position[:x], @position[:y], @position[:facing]].join(' ')
  end

  def direction
    @position[:facing].to_s
  end
end