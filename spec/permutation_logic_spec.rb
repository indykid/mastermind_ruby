require 'permutation_logic'
describe PermutationLogic do
  describe ".generate" do
    context "given one option and one space generates one permutation" do
      it "[[0]]" do
        options = [0]
        spaces = 1
        expect(PermutationLogic.generate(options, spaces)).to eq([[0]])
      end
      it "[[1]]" do
        options = [1]
        spaces = 1
        expect(PermutationLogic.generate(options, spaces)).to eq([[1]])
      end
      it "[[2]]" do
        options = [2]
        spaces = 1
        expect(PermutationLogic.generate(options, spaces)).to eq([[2]])
      end
    end

    context "given two options and one space generates two permutations" do
      it "[[0], [1]]" do
        options = [0, 1]
        spaces = 1
        expect(PermutationLogic.generate(options, spaces)).to eq([[0], [1]])
      end

      it "[[1], [2]]" do
        options = [1, 2]
        spaces = 1
        expect(PermutationLogic.generate(options, spaces)).to eq([[1], [2]])
      end
    end

    context "given one option and two spaces generates one permutation" do
      it "[[0, 0]]" do
        options = [0]
        spaces = 2
        expect(PermutationLogic.generate(options, spaces)).to eq([[0, 0]])
      end
      it "[[1, 1]]" do
        options = [1]
        spaces = 2
        expect(PermutationLogic.generate(options, spaces)).to eq([[1, 1]])
      end
    end

  end
end