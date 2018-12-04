require_relative '../src/rover'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end


RSpec.describe Rover do

  describe '#initialize' do
    rover = described_class.new([1, 2, 'N'])
    it 'initializes with appropriate values' do
      expect(rover.direction).to eq('N')
      expect(rover.get_position).to eq('1 2 N')
    end

    it 'turns left and face West' do
      rover.turn_left
      expect(rover.direction).to eq('W')
    end

    it 'turns left and face South' do
      rover.turn_left
      expect(rover.direction).to eq('S')
    end

    it 'turns left and face East' do
      rover.turn_left
      expect(rover.direction).to eq('E')
    end

    it 'turns left and face North again' do
      rover.turn_left
      expect(rover.direction).to eq('N')
    end

    it 'turns right and face East' do
      rover.turn_right
      expect(rover.direction).to eq('E')
    end

    it 'turns right and face South' do
      rover.turn_right
      expect(rover.direction).to eq('S')
    end

    it 'turns right and face West' do
      rover.turn_right
      expect(rover.direction).to eq('W')
    end

    it 'turns right and face North again' do
      rover.turn_right
      expect(rover.direction).to eq('N')
    end
  end

  describe '#start_a_new_mission' do
    rover   = described_class.new([1, 2, 'N'])
    plateau = [5, 5]
    path    = 'L M L M L M L M M'

    it 'from 1 2 N with L M L M L M L M M arrive at 1 3 N' do
      expect(rover.start_mission(path, plateau)).to eq("1 3 N")
    end
  end

  describe '#second mission' do
    rover   = described_class.new([3, 3, 'E'])
    plateau = [5, 5]
    path    = 'M M R M M R M R R M'

    it 'from 3 3 E with M M R M M R M R R M arrive at 5 1 E' do
      expect(rover.start_mission(path, plateau)).to eq("5 1 E")
    end
  end

  describe '#third mission' do
    rover   = described_class.new([1, 3, 'N'])
    plateau = [5,5]
    path    = 'M R M L M M L M R M M'

    it 'from 1 3 N with M R M L M M L M R M M arrive at 1 3 N' do
      expect(rover.start_mission(path, plateau)).to eq("1 3 N")
    end
  end

  describe '#fourth mission' do
    rover   = described_class.new([1, 2, 'N'])
    plateau = [5,5]
    path    = 'M L M M R M M M L'

    it 'from 1 2 N with M L M M R M M M L arrive at 4 1 W' do
      expect(rover.start_mission(path, plateau)).to eq("4 1 W")
    end
  end

  describe '#fifth mission' do
    rover   = described_class.new([1, 2, 'N'])
    plateau = [10,10]
    path    = 'M L M M R M M M L'

    it 'from 1 2 N with M L M M R M M M L arrive at 4 1 W on a 10 10 plateau' do
      expect(rover.start_mission(path, plateau)).to eq("9 6 W")
    end
  end
end
