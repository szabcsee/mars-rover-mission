class Plateau
  attr_reader :height, :width

  # @type [array] coordinates
  def initialize(coordinates)
    @width = coordinates[0].to_i
    @height = coordinates[1].to_i
  end

  # @type [array] position
  def move_rover(position)
    return unless within_boundaries?(position)

    case position[:facing]
    when 'N'
      position[:y] += 1
    when 'E'
      position[:x] += 1
    when 'S'
      position[:y] -= 1
    when 'W'
      position[:x] -= 1
    end
  end

  def within_boundaries?(position)
    case position[:facing]
    when 'N'
      position[:y] < @height
    when 'E'
      position[:x] < @width
    when 'S'
      position[:y] > 0
    when 'W'
      position[:x] > 0
    end
  end

end