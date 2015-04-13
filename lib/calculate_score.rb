class CalculateScore
  def self.corrects(code, guess)
    corrects = 0
    commons = code & guess
    commons.each do |common|
      code_count = code.count(common)
      guess_count = guess.count(common)
      corrects += [code_count, guess_count].min
    end
    corrects
  end
end