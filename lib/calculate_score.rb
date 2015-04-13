class CalculateScore
  def self.corrects(code, guess)
    return 1 if code == guess
    0
  end
end