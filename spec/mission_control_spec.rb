RSpec.describe MissionControl do
  let(:plateau) { Plateau.new([5, 5]) }
  let(:mission_control) { described_class.new(plateau) }

  describe '#add a rover' do
    let(:rover) { Rover.new([1, 2, 'N']) }

    it 'adds a Rover to Mission Control' do
      mission_control.add_rover(rover)
      expect(mission_control.get_rover).to eq(rover)
    end
  end

  describe '#get the plateau' do

    it 'retrieves the plateau coordinates from Mission Control' do
      expect(mission_control.get_plateau).to eq(plateau)
    end
  end

  describe '#execute' do
    before do
      mission_control.add_rover(rover)
      mission_control.execute(command)
    end

    context '#send a turn left command to the Rover' do
      let(:rover) { Rover.new([1, 2, 'N']) }
      let(:command) { 'L' }

      it 'and it turns left' do
        expect(mission_control.get_rover.get_status).to eq("1 2 W")
      end
    end

    context '#send a turn right command to the Rover' do
      let(:rover) { Rover.new([1, 2, 'N']) }
      let(:command) { 'R' }

      it 'and it turns right' do
        expect(mission_control.get_rover.get_status).to eq("1 2 E")
      end
    end

    context '#send a move command to the Rover positioned within boundaries facing North' do
      let(:rover) { Rover.new([1, 2, 'N']) }
      let(:command) { 'M' }

      it 'and it moves North' do
        expect(mission_control.get_rover.get_status).to eq("1 3 N")
      end
    end

    context '#send a move command to the Rover positioned on the north edge of the plateau facing North' do
      let(:rover) { Rover.new([1, 5, 'N']) }
      let(:command) { 'M' }

      it 'and it stays still' do
        expect(mission_control.get_rover.get_status).to eq("1 5 N")
      end
    end

    context '#send a move command to the Rover positioned on the south edge of the plateau facing South' do
      let(:rover) { Rover.new([0, 0, 'S']) }
      let(:command) { 'M' }

      it 'and it stays still' do
        expect(mission_control.get_rover.get_status).to eq("0 0 S")
      end
    end

    context '#send a move command to the Rover positioned on the west edge of the plateau facing West' do
      let(:rover) { Rover.new([0, 0, 'W']) }
      let(:command) { 'M' }

      it 'and it stays still' do
        expect(mission_control.get_rover.get_status).to eq("0 0 W")
      end
    end

    context '#send a move command to the Rover positioned on the east edge of the plateau facing East' do
      let(:rover) { Rover.new([5, 1, 'E']) }
      let(:command) { 'M' }

      it 'and it stays still' do
        expect(mission_control.get_rover.get_status).to eq("5 1 E")
      end
    end
  end

  describe '#start_mission' do
    let(:rover) { Rover.new([1, 2, 'N']) }
    before do
      mission_control.add_rover(rover)
      mission_control.start_mission(commands)
    end

    context '#sends a list of valid commands "L R M M" ' do
      let(:commands) { 'L R M M' }
      it 'and they get executed' do
        expect(mission_control.get_rover.get_status).to eq("1 4 N")
      end
    end

    context '#sends a mix of valid and invalid commands "R R M K P M" ' do
      let(:commands) { 'R R M K P M' }
      it 'and the valids get executed' do
        expect(mission_control.get_rover.get_status).to eq("1 0 S")
      end
    end

    context '#sends a list of invalid commands "K P Q" ' do
      let(:commands) { 'K P Q' }
      it 'and the rover stays still' do
        expect(mission_control.get_rover.get_status).to eq("1 2 N")
      end
    end

    context '#sends the TEST INPUT  "L M L M L M L M M" to 1 2 N positioned Rover' do
      let(:commands) { 'L M L M L M L M M' }
      it 'and gets 1 3 N expected result ' do
        expect(mission_control.get_rover.get_status).to eq("1 3 N")
      end
    end

    context '#sends the SECOND TEST INPUT  "M M R M M R M R R M" to 3 3 E positioned Rover' do
      let(:rover) { Rover.new([3, 3, 'E']) }
      let(:commands) { 'M M R M M R M R R M' }
      it 'and gets 5 1 E expected result ' do
        expect(mission_control.get_rover.get_status).to eq("5 1 E")
      end
    end
  end
end