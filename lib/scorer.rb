class Scorer
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

  def self.exacts(code, guess)
    exacts = 0
    code.length.times do |i|
      exacts += 1 if code[i] == guess[i]
    end
    exacts
  end
end