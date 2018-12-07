module Directions
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