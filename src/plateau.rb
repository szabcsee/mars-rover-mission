class Plateau

  # @type [array] coordinates
  def initialize(coordinates)
    @width = coordinates[0].to_i
    @height = coordinates[1].to_i
  end

  def within_boundaries?(position, direction)
    case direction.to_s
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