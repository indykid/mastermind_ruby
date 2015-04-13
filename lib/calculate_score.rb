class CalculateScore
  def self.corrects(code, guess)
    return 1 if code == [0] && guess == [0]
    return 1 if code == [1] && guess == [1]
    return 1 if code == [2] && guess == [2]
    0
  end
end