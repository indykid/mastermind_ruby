require 'mastermind'
require 'codebreaker'

describe Mastermind do

  let(:output) { StringIO.new }
  let(:input) { StringIO.new }
  let(:codebreaker) { Codebreaker.new }
  let(:mastermind) { Mastermind.new(output, codebreaker, input) }

  it 'displays welcome message' do
    mastermind.start

    expect(output.string).to start_with(Mastermind::GREETING)
  end

  describe '#play' do
    it 'displays guess from codebreaker' do
      mastermind.start

      expect(output.string).to include(codebreaker.guesses.last)
    end

    it 'asks user for "correct colours" score' do
      mastermind.start

      expect(output.string).to include(Mastermind::CORRECT_SCORE_REQUEST)
    end

    it 'asks user for "exact colours" score' do
      mastermind.start

      expect(output.string).to include(Mastermind::EXACT_SCORE_REQUEST)
    end
  end

  describe '#capture_score' do
    context 'when asking for correct score' do
      it 'updates "correct colours" score' do
        input = StringIO.new("2\n")
        mastermind = Mastermind.new(output, codebreaker, input)
# should i give it any array and test that?
        mastermind.capture_score(codebreaker.corrects)

        expect(codebreaker.corrects.last).to eq(2)
      end
    end
# is this test necessary?
    context 'when asking for exact score' do
      it 'updates "exact colours" score' do
        input = StringIO.new("1\n")
        mastermind = Mastermind.new(output, codebreaker, input)

        mastermind.capture_score(codebreaker.exacts)

        expect(codebreaker.exacts.last).to eq(1)
      end
    end
  end

  it 'is over when codebreaker uses max attempts' do
    codebreaker.guesses = ['rrrg', 'rrrg', 'rrrg', 'rrrg', 'rrrg', 'rrrg', 'rrrg', 'rrrg', 'rrrg', 'rrrg']

    expect(mastermind.over?).to be(true)
  end

  it 'is over when codebreaker gets correct code' do
    codebreaker.exacts = [1, 4]
    expect(mastermind.over?).to be(true)
  end

  it "doesn't ask for another guess if attempts are maxed out" do
    input = StringIO.new("2\n1\n"*Mastermind::MAX_ATTEMPTS)
    mastermind = Mastermind.new(output, codebreaker, input)

    mastermind.start
    expect(codebreaker.guesses.count).to eq(Mastermind::MAX_ATTEMPTS)
  end

  it "doesn't ask for another guess if code is broken" do
    input = StringIO.new("2\n1\n4\n4\n")
    mastermind = Mastermind.new(output, codebreaker, input)

    mastermind.start
    expect(codebreaker.guesses.count).to eq(2)
  end

  it 'anounces winner at the end' do
    mastermind.start
    expect(output.string.chomp).to end_with(mastermind.winner_announcement)
  end
end












