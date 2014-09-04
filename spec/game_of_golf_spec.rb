require_relative '../app/game_of_golf'

describe GameOfGolf do
  describe '#get_player_name' do
    let(:player_name) { 'player name' }
    let(:inputted_name) { 'your mom' }
    it 'asks for the players name' do
      expect(subject).to receive(:print).with("Player Name: ")
      expect(subject).to receive(:gets) { inputted_name }
      expect(inputted_name).to receive(:chomp) { player_name }

      subject.get_player_name
      expect(subject.player_name).to eq(player_name)
    end
  end

  describe '#play_round' do
    let(:score) { 8 }
    let(:course) { double 'course', score: score }

    it 'plays a round of golf' do
      expect(course).to receive(:play)
      subject.play_round(course)

      expect(subject.score_total).to eq(score)
      #expect(subject.number_of_pars).to eq(1)
      #expect(subject.number_of_birdies).to eq(1)
      #expect(subject.number_of_bogies).to eq(1)
    end
  end
end

describe GameOfGolf do
  let(:score) { holes.map(&:score).inject(&:+) }
  let(:course) { double 'course', holes: holes }
  let(:holes) { [ hole1, hole2, hole3 ] }
  let(:hole1) { Hole.new(3) }
  let(:hole2) { Hole.new(4) }
  let(:hole3) { Hole.new(5) }
  let(:course) { Course.new(holes) }

  it 'plays a round' do
    subject.play_round(course)
    expect(subject.score_total).to eq(score)
  end
end
