class CalculateScore
  def self.corrects(code, guess)
    return 2 if code[0] == guess[1] && guess[0] == code[1]
    return 2 if code[0] == guess[1] && guess[0] == code[1]
    return 2 if code[0] == guess[1] && guess[0] == code[1]
    return code.length if code == guess
    0
  end
end