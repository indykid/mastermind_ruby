require 'mastermind'
require 'codebreaker'

describe Mastermind do
  describe '#start' do
    it 'displays welcome message' do
      output = StringIO.new
      codebreaker = Codebreaker.new
      mastermind = Mastermind.new(output, codebreaker)

      mastermind.start

      expect(mastermind.output.string).to start_with(Mastermind::GREETING)
    end

    it 'displays guess from codebreaker' do
      output = StringIO.new
      codebreaker = Codebreaker.new
      mastermind = Mastermind.new(output, codebreaker)

      mastermind.start

      expect(mastermind.output.string).to include(mastermind.codebreaker.guesses.last)
    end

    it 'asks user for "correct colour" score' do
      output = StringIO.new
      codebreaker = Codebreaker.new
      mastermind = Mastermind.new(output, codebreaker)

      mastermind.start

      expect(mastermind.output.string).to include(Mastermind::CORRECT_SCORE_REQUEST)
    end
  end
end