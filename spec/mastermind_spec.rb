require 'mastermind'
require 'codebreaker'

describe Mastermind do
  describe '#start' do
    it 'displays welcome message' do
      output = StringIO.new
      input = StringIO.new
      codebreaker = Codebreaker.new
      mastermind = Mastermind.new(output, codebreaker, input)

      mastermind.start

      expect(mastermind.output.string).to start_with(Mastermind::GREETING)
    end

    it 'displays guess from codebreaker' do
      output = StringIO.new
      input = StringIO.new
      codebreaker = Codebreaker.new
      mastermind = Mastermind.new(output, codebreaker, input)

      mastermind.start

      expect(mastermind.output.string).to include(mastermind.codebreaker.guesses.last)
    end

    it 'asks user for "correct colours" score' do
      output = StringIO.new
      input = StringIO.new
      codebreaker = Codebreaker.new
      mastermind = Mastermind.new(output, codebreaker, input)

      mastermind.start

      expect(mastermind.output.string).to include(Mastermind::CORRECT_SCORE_REQUEST)
    end

    it 'codebreaker receives "correct colours" score' do
      output = StringIO.new
      input = StringIO.new("2\n")
      codebreaker = Codebreaker.new
      mastermind = Mastermind.new(output, codebreaker, input)

      mastermind.start

      expect(mastermind.codebreaker.corrects.last).to eq("2")
    end

    it 'asks user for "exact colours" score' do
      output = StringIO.new
      input = StringIO.new
      codebreaker = Codebreaker.new
      mastermind = Mastermind.new(output, codebreaker, input)

      mastermind.start

      expect(mastermind.output.string).to include(Mastermind::EXACT_SCORE_REQUEST)
    end

    it 'codebreaker receives "correct colours" score' do
      output = StringIO.new
      input = StringIO.new("2\n1\n")
      codebreaker = Codebreaker.new
      mastermind = Mastermind.new(output, codebreaker, input)

      mastermind.start

      expect(mastermind.codebreaker.exacts.last).to eq("1")
    end
  end
end












