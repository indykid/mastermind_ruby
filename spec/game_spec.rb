require 'game'
describe Game do
  it 'displays welcome message at the start' do
    output = StringIO.new
    ai = AI.new
    game = Game.new(output, ai)

    game.start

    expect(output.string).to start_with(Game::WELCOME_MESSAGE)
  end

  describe '#play' do
    it "displays ai's guess" do
      output = StringIO.new
      ai = AI.new
      game = Game.new(output, ai)

      game.play

      expect(output.string.chomp).to include('rrrr')
    end

    it "asks user for score" do
      output = StringIO.new
      ai = AI.new
      game = Game.new(output, ai)

      game.play

      expect(output.string.chomp).to end_with(Game::SCORE_REQUEST)
    end
  end
end