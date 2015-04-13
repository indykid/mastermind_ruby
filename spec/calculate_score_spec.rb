require 'calculate_score'

describe CalculateScore do
  describe ".corrects" do
    context "comparing two arrays of size 1" do
      context "without common elements returns score 0" do
        it do
          code = [0]
          guess = [1]
          expect(CalculateScore.corrects(code, guess)).to eq(0)
        end

        it do
          code = [0]
          guess   = [2]
          expect(CalculateScore.corrects(code, guess)).to eq(0)
        end
      end

      context "with common elements returns score 1" do
        it do
          code = [0]
          guess   = [0]
          expect(CalculateScore.corrects(code, guess)).to eq(1)
        end

        it do
          code = [1]
          guess   = [1]
          expect(CalculateScore.corrects(code, guess)).to eq(1)
        end

        it do
          code = [2]
          guess   = [2]
          expect(CalculateScore.corrects(code, guess)).to eq(1)
        end
      end
    end



  end
end