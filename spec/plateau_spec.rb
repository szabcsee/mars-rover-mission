RSpec.describe Plateau do
  let(:plateau) { described_class.new([5, 5]) }

  describe '#within_boundaries?' do
    context 'when it gets a position way within boundaries facing north' do
      let(:position) { { x: 2, y: 2 } }
      let(:direction) { Directions::North.new }

      it 'reports true' do
        expect(plateau.within_boundaries?(position, direction)).to eq(true)
      end
    end

    context 'when it gets a position way within boundaries facing south' do
      let(:position) { { x: 2, y: 2 } }
      let(:direction) { Directions::South.new }

      it 'reports true' do
        expect(plateau.within_boundaries?(position, direction)).to eq(true)
      end
    end

    context 'when it gets a position on the last coordinate facing north' do
      let(:position) { { x: 0, y: 5 } }
      let(:direction) { Directions::North.new }

      it 'reports false' do
        expect(plateau.within_boundaries?(position, direction)).to eq(false)
      end
    end

    context 'when it gets a position on the last coordinate facing east' do
      let(:position) { { x: 5, y: 2 } }
      let(:direction) { Directions::East.new }

      it 'reports false' do
        expect(plateau.within_boundaries?(position, direction)).to eq(false)
      end
    end

    context 'when it gets a position on the last coordinate facing west' do
      let(:position) { { x: 0, y: 2 } }
      let(:direction) { Directions::West.new }

      it 'reports false' do
        expect(plateau.within_boundaries?(position, direction)).to eq(false)
      end
    end

    context 'when it gets a position on the last coordinate facing south' do
      let(:position) { { x: 2, y: 0 } }
      let(:direction) { Directions::South.new }

      it 'reports false' do
        expect(plateau.within_boundaries?(position, direction)).to eq(false)
      end
    end
  end
end