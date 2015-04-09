require 'permutation_logic'
describe PermutationLogic do
  describe ".generate" do
    it "given one option generates one permutation" do
      options = [0]
      expect(PermutationLogic.generate(options)).to eq([[0]])
    end


  end
end