require 'mastermind'
require 'codebreaker'
describe Mastermind do

  let(:input) {StringIO.new}
  let(:output) {StringIO.new}
  let(:codebreaker) {Codebreaker.new}
  let(:mastermind) {Mastermind.new(output, input, codebreaker)}

  describe '#start' do
    it 'displays welcome message' do
      mastermind.start
      expect(output.string).to start_with(Mastermind::GREETING)
    end
  end

  describe '#play' do
    it "displays codebreaker's guess" do
      mastermind.play
      expect(output.string).to include(codebreaker.guesses.last)
    end

    it 'asks user for correct score' do
      mastermind.play
      expect(output.string).to include(Mastermind::CORRECT_SCORE_REQUEST)
    end

    it 'receives score for correct from the user' do
      input = StringIO.new("2\n")
      mastermind = Mastermind.new(output, input, codebreaker)
      mastermind.play
      expect(input.string).to include(codebreaker.corrects.first)
    end

    it 'asks user for exact score' do
      mastermind.play
      expect(output.string).to include(Mastermind::EXACT_SCORE_REQUEST)
    end

    it 'receives score for exact from the user' do
      input = StringIO.new("2\n1\n")
      mastermind = Mastermind.new(output, input, codebreaker)
      mastermind.play
      expect(input.string).to include(codebreaker.exacts.first)
    end

    it 'is not over to begin with' do
      expect(mastermind.over?).to be(false)
    end

    it 'is over if max attempts reached' do
      input = StringIO.new("2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n")
      mastermind = Mastermind.new(output, input, codebreaker)
      mastermind.start
      expect(mastermind.over?).to be(true)
    end

    it 'is over if code is broken' do
      input = StringIO.new("2\n1\n2\n1\n2\n1\n4\n4\n")
      mastermind = Mastermind.new(output, input, codebreaker)
      mastermind.start
      expect(mastermind.over?).to be(true)
    end

    it "doesn't ask for a guess if game is over" do
      input = StringIO.new("2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n")
      mastermind = Mastermind.new(output, input, codebreaker)
      mastermind.start
      expect(codebreaker.guesses.count).to eq(10)
    end

    it "doesn't ask user for a score if game is over" do
      input = StringIO.new("2\n1\n2\n1\n2\n1\n4\n4\n")
      mastermind = Mastermind.new(output, input, codebreaker)
      mastermind.start
      expect(codebreaker.exacts.count).to eq(4)
    end
  end

  context 'code is broken' do
    it 'notifies user of loss' do
      input = StringIO.new("2\n1\n2\n1\n2\n1\n4\n4\n")
      mastermind = Mastermind.new(output, input, codebreaker)
      mastermind.start
      expect(mastermind.winner_announcement).to eq(Mastermind::USER_LOST_MESSAGE)
    end
  end

  context 'code is not broken' do
    it 'notifies user of win' do
      input = StringIO.new("2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n")
      mastermind = Mastermind.new(output, input, codebreaker)
      mastermind.start
      expect(mastermind.winner_announcement).to eq(Mastermind::USER_WON_MESSAGE)
    end
  end


end