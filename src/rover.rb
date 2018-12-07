class Rover

  # @type [Array] coordinate
  def initialize(coordinate)
    @position = { x: Integer(coordinate[0]),
                  y: Integer(coordinate[1])
    }
    @direction = Directions.from_s(coordinate[2])
  end

  def turn_left
    @direction = @direction.turn_left
  end

  def turn_right
    @direction = @direction.turn_right
  end

  def move
    @position = @direction.move(@position)
  end

  # @type [Integer] coordinate_x
  # @type [Integer] coordinate_y
  def set_coordinates(coordinate_x, coordinate_y)
    @position[:x] += coordinate_x
    @position[:y] += coordinate_y
  end

  # @return [String]
  def get_status
    [@position[:x], @position[:y], @direction.to_s].join(' ')
  end

  # @return [Object]
  def position
    return @position
  end

  # @return [String]
  def direction
    @direction.to_s
  end
end