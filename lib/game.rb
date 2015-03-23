class AI
  def guess
    'rrrr'
  end

end


class Game

  WELCOME_MESSAGE = "Welcome to mastermind"
  SCORE_REQUEST   = "Please enter your score"

  def initialize(output, ai)
    self.output = output
    self.ai     = ai
  end

  def start
    display(WELCOME_MESSAGE)
  end

  def play
    display(ai.guess)
    display(SCORE_REQUEST)
  end

  private

  attr_accessor :output, :ai

  def display(message)
    output.puts(message)
  end
end