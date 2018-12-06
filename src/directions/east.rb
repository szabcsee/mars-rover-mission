class East
  extend Directions

  def turn_left
    Directions::North.new
  end

  def turn_right
    Directions::South.new
  end

  def move(position)
    position[:x] += 1
  end

  def to_s
    'E'
  end
end