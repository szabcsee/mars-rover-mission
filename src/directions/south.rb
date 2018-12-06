class South
  extend Directions

  def turn_left
    Directions::East.new
  end

  def turn_right
    Directions::West.new
  end

  def move(position)
    position[:y] -= 1
  end

  def to_s
    'S'
  end
end