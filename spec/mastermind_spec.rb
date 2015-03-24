require 'mastermind'
require 'codebreaker'

describe Mastermind do

  let(:output) { StringIO.new }
  let(:input) { StringIO.new }
  let(:codebreaker) { Codebreaker.new }
  let(:mastermind) { Mastermind.new(output, codebreaker, input) }

  describe '#start' do
    it 'displays welcome message' do
      mastermind.start

      expect(output.string).to start_with(Mastermind::GREETING)
    end

    it 'displays guess from codebreaker' do
      mastermind.start

      expect(output.string).to include(codebreaker.guesses.last)
    end

    it 'asks user for "correct colours" score' do
      mastermind.start

      expect(output.string).to include(Mastermind::CORRECT_SCORE_REQUEST)
    end

    it 'codebreaker receives "correct colours" score' do
      input = StringIO.new("2\n")
      mastermind = Mastermind.new(output, codebreaker, input)

      mastermind.start

      expect(codebreaker.corrects.last).to eq("2")
    end

    it 'asks user for "exact colours" score' do
      mastermind.start

      expect(output.string).to include(Mastermind::EXACT_SCORE_REQUEST)
    end

    it 'codebreaker receives "correct colours" score' do
      input = StringIO.new("2\n1\n")
      mastermind = Mastermind.new(output, codebreaker, input)

      mastermind.start

      expect(codebreaker.exacts.last).to eq("1")
    end
  end
end












