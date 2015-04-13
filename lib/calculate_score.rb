class CalculateScore
  def self.corrects(code, guess)
    return 2 if code == guess && code.length == 2
    return 1 if code == guess
    0
  end
end