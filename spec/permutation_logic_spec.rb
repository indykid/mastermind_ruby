require 'permutation_logic'
describe PermutationLogic do
  describe ".generate" do
    it "given one option and no spaces generates no permutations" do
      options = [0]
      spaces  = 0
      expect(PermutationLogic.generate(options, spaces)).to eq([])
    end

    it "given one option and one space generates one permutation" do
      options = [0]
      spaces  = 1
      expect(PermutationLogic.generate(options, spaces)).to eq([[0]])
    end

    it "given one option and one space generates one permutation" do
      options = [0]
      spaces  = 1
      expect(PermutationLogic.generate(options, spaces)).to eq([[0]])
    end

    it "given two options and one space returns two permutations" do
      options = [0, 1]
      spaces  = 1
      expect(PermutationLogic.generate(options, spaces)).to eq([[0], [1]])
    end
  end
end