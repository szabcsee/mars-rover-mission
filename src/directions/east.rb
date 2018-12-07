module Directions
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
end
