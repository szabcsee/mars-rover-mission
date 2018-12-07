RSpec.describe Rover do

  describe '#turn_left' do
    before { rover.turn_left }

    context 'when it faces north' do
      let(:rover) { described_class.new([1, 2, 'N']) }

      it 'turns to west' do
        expect(rover.get_status).to eq('1 2 W')
      end
    end

    context 'when it faces west' do
      let(:rover) { described_class.new([1, 2, 'W']) }

      it 'turns to south' do
        expect(rover.get_status).to eq('1 2 S')
      end
    end

    context 'when it faces south' do
      let(:rover) { described_class.new([1, 2, 'S']) }

      it 'turns to east' do
        expect(rover.get_status).to eq('1 2 E')
      end
    end

    context 'when it faces east' do
      let(:rover) { described_class.new([1, 2, 'E']) }

      it 'turns back to north' do
        expect(rover.get_status).to eq('1 2 N')
      end
    end
  end

  describe '#turn_right' do
    before { rover.turn_right }

    context 'when it faces north' do
      let(:rover) { described_class.new([1, 2, 'N']) }

      it 'turns to east' do
        expect(rover.get_status).to eq('1 2 E')
      end
    end

    context 'when it faces east' do
      let(:rover) { described_class.new([1, 2, 'E']) }

      it 'turns to south' do
        expect(rover.get_status).to eq('1 2 S')
      end
    end

    context 'when it faces south' do
      let(:rover) { described_class.new([1, 2, 'S']) }

      it 'turns to west' do
        expect(rover.get_status).to eq('1 2 W')
      end
    end

    context 'when it faces west' do
      let(:rover) { described_class.new([1, 2, 'W']) }

      it 'turns back to north' do
        expect(rover.get_status).to eq('1 2 N')
      end
    end
  end

  describe '#move' do
    before { rover.move }

    context 'when it faces north' do
      let(:rover) { described_class.new([1, 2, 'N']) }

      it 'moves to the north' do
        expect(rover.get_status).to eq('1 3 N')
      end
    end

    context 'when it faces west' do
      let(:rover) { described_class.new([1, 2, 'W']) }

      it 'moves to the west' do
        expect(rover.get_status).to eq('0 2 W')
      end
    end

    context 'when it faces east' do
      let(:rover) { described_class.new([1, 2, 'E']) }

      it 'moves to the east' do
        expect(rover.get_status).to eq('2 2 E')
      end
    end

    context 'when it faces south' do
      let(:rover) { described_class.new([1, 2, 'S']) }

      it 'moves to the south' do
        expect(rover.get_status).to eq('1 1 S')
      end
    end
  end
end
