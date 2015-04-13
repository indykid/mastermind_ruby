class CalculateScore
  def self.corrects(code, guess)
    return 3 if code == guess && code.length == 3
    return 2 if code == guess && code.length == 2
    return 1 if code == guess && code.length == 1
    0
  end
end