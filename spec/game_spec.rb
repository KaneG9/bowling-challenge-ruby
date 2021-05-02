require 'game'

describe Game do
  after(:each) {Game.begin_game(nil)}
  let(:scorecard_double) { double(:scorecard) }
  let(:subject) { Game.new( scorecard: scorecard_double)}
  
  before do 
    allow(scorecard_double).to receive(:add_score)
  end
  
  describe '#load_game' do
    it 'Returns nil if begin game hasnt been called' do
      expect(Game.load_game).to be_nil
    end

    it 'Returns a game object if it has been created' do
      Game.begin_game(subject)
      expect(Game.load_game).to be_instance_of Game
    end
  end

  describe '#begin_game' do
    it 'Creates a class variable containing a Game object' do
      expect(Game.begin_game(subject)).to be_instance_of Game
    end
  end

  describe '#bowl' do
    it 'calls add score to scorecard' do
      expect(scorecard_double).to receive(:add_score).with(5)
      subject.bowl(5)
    end
  end
end