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

    context "comparing two arrays of size 4" do
      context "with 4 common elements which are in different order returns score of 4" do
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

      context "with 1 common element returns score of 1" do
        it do
         code = [4, 5, 1, 0]
         guess = [3, 3, 2, 1]
         expect(CalculateScore.corrects(code, guess)).to eq(1)
        end

        it do
          code = [4, 5, 6, 0]
          guess = [3, 2, 0, 1]
          expect(CalculateScore.corrects(code, guess)).to eq(1)
        end

        it do
          code = [2, 2, 2, 0]
          guess = [3, 2, 1, 1]
          expect(CalculateScore.corrects(code, guess)).to eq(1)
        end
      end

      context "with 2 common element returns score of 2" do
        it do
          code = [4, 5, 1, 3]
          guess = [3, 3, 2, 1]
          expect(CalculateScore.corrects(code, guess)).to eq(2)
        end

        it do
          code = [4, 5, 6, 0]
          guess = [6, 6, 0, 6]
          expect(CalculateScore.corrects(code, guess)).to eq(2)
        end

        it do
          code = [2, 2, 0, 0]
          guess = [0, 2, 1, 1]
          expect(CalculateScore.corrects(code, guess)).to eq(2)
        end
      end

      context "with 3 common element returns score of 3" do
        it do
          code = [4, 1, 3, 3]
          guess = [3, 3, 2, 1]
          expect(CalculateScore.corrects(code, guess)).to eq(3)
        end

        it do
          code = [4, 5, 6, 0]
          guess = [6, 4, 5, 6]
          expect(CalculateScore.corrects(code, guess)).to eq(3)
        end

        it do
          code = [2, 2, 1, 0]
          guess = [0, 2, 1, 1]
          expect(CalculateScore.corrects(code, guess)).to eq(3)
        end
      end
    end
  end

  describe ".exacts" do
    it "comparing 2 arrays of 1 element returns 0 if no common elements in the same place" do
      code = [0]
      guess = [1]
      expect(CalculateScore.exacts(code, guess)).to eq(0)
    end

    it "comparing 2 arrays of 1 element returns 1 if they have common element" do
      code = [0]
      guess = [0]
      expect(CalculateScore.exacts(code, guess)).to eq(1)
    end

    it "comparing 2 arrays of 2 elements returns 2 if both elements are common and in the same places" do
      code = [0, 1]
      guess = [0, 1]
      expect(CalculateScore.exacts(code, guess)).to eq(2)
    end

    it "comparing 2 arrays of 2 elements returns 0 if both elements are common but in different places" do
      code = [0, 1]
      guess = [1, 0]
      expect(CalculateScore.exacts(code, guess)).to eq(0)
    end

    it "comparing 2 arrays of 2 elements returns 1 if one elements in common and in the same place" do
      code = [0, 1]
      guess = [2, 1]
      expect(CalculateScore.exacts(code, guess)).to eq(1)
    end


  end

end