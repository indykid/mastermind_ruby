require 'codebreaker'
describe Codebreaker do
  describe "#guess" do
    it "as a first guess returns 4 colours, where 2 are the same color and 2 of another color (0011)" do
      codebreaker = Codebreaker.new
      guess = codebreaker.guess
      # puts guess.to_s
      expect(guess[0]).to eq(guess[1])
      expect(guess[2]).to eq(guess[3])
      expect(guess[0]).not_to eq(guess[3])
    end


  end
end

