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

    context "comparing two arrays of size 2" do

      context "without common elements returns 0 score" do
        it do
          code = [0, 1]
          guess = [2, 3]
          expect(CalculateScore.corrects(code, guess)).to eq(0)
        end
        it do
          code = [1, 4]
          guess = [3, 5]
          expect(CalculateScore.corrects(code, guess)).to eq(0)
        end
      end

      context "with two common elements returns score of 2" do

        context "elements are in the same order" do
          it do
            code = [1, 4]
            guess = [1, 4]
            expect(CalculateScore.corrects(code, guess)).to eq(2)
          end

          it do
            code = [3, 5]
            guess = [3, 5]
            expect(CalculateScore.corrects(code, guess)).to eq(2)
          end

          it do
            code = [2, 0]
            guess = [2, 0]
            expect(CalculateScore.corrects(code, guess)).to eq(2)
          end
        end


        context "elements are in different order" do
          it do
            code = [2, 0]
            guess = [0, 2]
            expect(CalculateScore.corrects(code, guess)).to eq(2)
          end

          it do
            code = [3, 1]
            guess = [1, 3]
            expect(CalculateScore.corrects(code, guess)).to eq(2)
          end

          it do
            code = [4, 5]
            guess = [5, 4]
            expect(CalculateScore.corrects(code, guess)).to eq(2)
          end
        end
      end

      context "with one common element returns score of 1" do
        it do
          code = [1, 4]
          guess = [3, 1]
          expect(CalculateScore.corrects(code, guess)).to eq(1)
        end

        it do
          code = [2, 5]
          guess = [2, 1]
          expect(CalculateScore.corrects(code, guess)).to eq(1)
        end

        it do
          code = [3, 5]
          guess = [0, 3]
          expect(CalculateScore.corrects(code, guess)).to eq(1)
        end
      end
    end

    context "comparing two arrays of size 3" do
      context "with three common elements returns score of 3" do
        context "elements are in the same order" do
          it do
            code = [2, 0, 1]
            guess = [2, 0, 1]
            expect(CalculateScore.corrects(code, guess)).to eq(3)
          end
        end

        context "elements are in different order" do
          it do
            code = [4, 5, 8]
            guess = [5, 4, 8]
            expect(CalculateScore.corrects(code, guess)).to eq(3)
          end
        end
      end
    end

    context "comparing two arrays of size 4 with 4 common elements which are in different order returns score of 4" do
      it do
       code = [4, 5, 1, 8]
       guess = [5, 4, 8, 1]
       expect(CalculateScore.corrects(code, guess)).to eq(4)
      end

      it do
        code = [4, 5, 1, 1]
        guess = [1, 4, 5, 1]
        expect(CalculateScore.corrects(code, guess)).to eq(4)
      end
    end


  end
end