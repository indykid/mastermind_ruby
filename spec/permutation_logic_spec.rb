require 'permutation_logic'
describe PermutationLogic do
  describe ".generate" do
    context "given one option and one space generates one permutation" do
      it "[0]" do
        options = [0]
        expect(PermutationLogic.generate(options)).to eq([[0]])
      end
      it "[1]" do
        options = [1]
        expect(PermutationLogic.generate(options)).to eq([[1]])
      end
      it "[2]" do
        options = [2]
        expect(PermutationLogic.generate(options)).to eq([[2]])
      end
    end
  end
end