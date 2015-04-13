class CalculateScore
  def self.corrects(code, guess)

    difference = code - guess
    return code.length - difference.length

  end
end