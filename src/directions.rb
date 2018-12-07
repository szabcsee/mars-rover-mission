module Directions

  def self.from_s(direction)
    case direction
    when 'N'
      Directions::North.new
    when 'E'
      Directions::East.new
    when 'W'
      Directions::West.new
    when 'S'
      Directions::South.new
    end
  end

  class East

    def turn_left
      Directions::North.new
    end

    def turn_right
      Directions::South.new
    end

    def move(position)
      position[:x] += 1
      return position
    end

    def to_s
      'E'
    end
  end

  class North

    def turn_left
      Directions::West.new
    end

    def turn_right
      Directions::East.new
    end

    def move(position)
      position[:y] += 1
      return position
    end

    def to_s
      'N'
    end
  end

  class South

    def turn_left
      Directions::East.new
    end

    def turn_right
      Directions::West.new
    end

    def move(position)
      position[:y] -= 1
      return position
    end

    def to_s
      'S'
    end
  end

  class West

    def turn_left
      Directions::South.new
    end

    def turn_right
      Directions::North.new
    end

    def move(position)
      position[:x] -= 1
      return position
    end

    def to_s
      'W'
    end
  end
end
