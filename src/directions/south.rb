module Directions
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
end