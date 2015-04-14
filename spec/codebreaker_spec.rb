require 'codebreaker'
require 'scorer'
describe Codebreaker do
  describe "#guess" do
    it "as a first guess returns 4 colours, where 2 are the same color and 2 of another color (0011)" do
      codebreaker = Codebreaker.new
      guess = codebreaker.guess
      expect(guess[0]).to eq(guess[1])
      expect(guess[2]).to eq(guess[3])
      expect(guess[0]).not_to eq(guess[3])
    end

    it "second guess is out of the subset of possibilities where each one has the same score as the last score relative to the last guess" do
      codebreaker = Codebreaker.new
      codebreaker.guess
      codebreaker.corrects << 2
      codebreaker.exacts   << 0
      last_guess = codebreaker.guesses.last
      next_guess = codebreaker.guess
      expect(Scorer.corrects(last_guess, next_guess)).to eq(2)
      expect(Scorer.exacts(last_guess, next_guess)).to eq(0)
    end
  end
end

