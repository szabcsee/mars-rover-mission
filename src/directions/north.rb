class North
  extend Directions

  def turn_left
    Directions::West.new
  end

  def turn_right
    Directions::East.new
  end

  def move(position)
    position[:y] += 1
  end

  def to_s
    'N'
  end
end