class CalculateScore
  def self.corrects(code, guess)
    return code.length if code == guess
    0
  end
end