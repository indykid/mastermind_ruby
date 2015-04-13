class CalculateScore
  def self.corrects(code, guess)
    return code.length if code.sort == guess.sort
    0
  end
end