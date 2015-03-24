require 'game'
describe Game do
  it 'displays welcome message at the start' do
    output = StringIO.new
    input = StringIO.new
    ai = AI.new
    game = Game.new(output, input, ai)

    game.start

    expect(output.string).to start_with(Game::WELCOME_MESSAGE)
  end

  describe '#play' do
    it "displays ai's guess" do
      output = StringIO.new
      input = StringIO.new
      ai = AI.new
      game = Game.new(output, input, ai)

      game.play

      expect(output.string.chomp).to include('rrrr')
    end

    it "asks user for score" do
      output = StringIO.new
      input = StringIO.new
      ai = AI.new
      game = Game.new(output, input, ai)

      game.play

      expect(output.string.chomp).to end_with(Game::SCORE_REQUEST)
    end

    it "receives user's score" do
      output = StringIO.new
      input = StringIO.new("2\n1")
      ai = AI.new
      game = Game.new(output, input, ai)

      game.play

      expect(input.string.).to eq(game.last_score)
    end
  end

  it 'is not over to begin with' do
    output = StringIO.new
    input = StringIO.new
    ai = AI.new
    game = Game.new(output, input, ai)

    game.start

    expect(game.over?).to be(false)
  end

  it 'is over if winning score is received' do
    output = StringIO.new
    input = StringIO.new("4\n4")
    ai = AI.new
    game = Game.new(output, input, ai)

    game.start

    expect(game.over?).to be(true)
  end
end







