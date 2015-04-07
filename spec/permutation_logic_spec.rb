require 'permutation_logic'
describe PermutationLogic do
  describe ".generate" do
    it "given one option and one space generates one permutation" do
      options = [0]
      spaces  = 1
      expect(PermutationLogic.generate(options, spaces)).to eq([0])
    end

    it "given two options and one space generates 2 permutations" do
      options = [0, 1]
      spaces  = 1
      expect(PermutationLogic.generate(options, spaces)).to eq([[0], [1]])
    end


  end
end