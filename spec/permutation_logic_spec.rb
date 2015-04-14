require 'permutation_logic'
describe PermutationLogic do
  describe ".generate" do
    context "given one space" do
      it "and one option generates one permutation" do
        options = [0]
        spaces  = 1
        expect(PermutationLogic.generate(options, spaces)).to eq([[0]])
      end

      it "and two options generates 2 permutations" do
        options = [0, 1]
        spaces  = 1
        expect(PermutationLogic.generate(options, spaces)).to eq([[0], [1]])
      end

      it "and three options generates three permutations" do
        options = [0, 1, 2]
        spaces  = 1
        expect(PermutationLogic.generate(options, spaces)).to eq([[0], [1], [2]])
      end
    end


    it "given two options and two spaces generates four permutations" do
      options = [0, 1]
      spaces  = 2
      expect(PermutationLogic.generate(options, spaces)).to eq(
        [ [0, 0],
          [0, 1],
          [1, 0],
          [1, 1]
        ])
    end

    it "given three options and three spaces generates twenty seven permutations" do
      options = [0, 1, 2]
      spaces  = 3
      expect(PermutationLogic.generate(options, spaces)).to eq(
        [ [0, 0, 0],
          [0, 0, 1],
          [0, 0, 2],
          [0, 1, 0],
          [0, 1, 1],
          [0, 1, 2],
          [0, 2, 0],
          [0, 2, 1],
          [0, 2, 2],
          [1, 0, 0],
          [1, 0, 1],
          [1, 0, 2],
          [1, 1, 0],
          [1, 1, 1],
          [1, 1, 2],
          [1, 2, 0],
          [1, 2, 1],
          [1, 2, 2],
          [2, 0, 0],
          [2, 0, 1],
          [2, 0, 2],
          [2, 1, 0],
          [2, 1, 1],
          [2, 1, 2],
          [2, 2, 0],
          [2, 2, 1],
          [2, 2, 2]
        ])
    end

    it "given 6 options and four spaces generates 1296" do
      options = [0, 1, 2, 3, 4, 5]
      spaces  = 4
      result  = PermutationLogic.generate(options, spaces)
      expect(result.length).to eq(1296)
      expect(result == result.uniq).to be(true)
    end

  end
end