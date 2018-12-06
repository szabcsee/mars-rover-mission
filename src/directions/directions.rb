module Directions
  def create_from_param(param)
    if param == 'N'
      Directions::North.new
    elsif param == 'E'
      Directions::East.new
    elsif param == 'W'
      Directions::West.new
    elsif param == 'S'
      Directions::South.new
    end
  end
end