class AI
  attr_reader :scores
  def initialize
    @scores = []
  end
  def guess
    'rrrr'
  end
end


class Game

  WELCOME_MESSAGE = "Welcome to mastermind"
  SCORE_REQUEST   = "Please enter your score"

  def initialize(output, input, ai)
    self.output = output
    self.input  = input
    self.ai     = ai
  end

  def start
    display(WELCOME_MESSAGE)
  end

  def play
    display(ai.guess)
    display(SCORE_REQUEST)
    input.gets
  end

  def over?
    last_score == 4
  end

  def last_score
    ai.scores.last
  end

  private

  attr_accessor :output, :input, :ai

  def display(message)
    output.puts(message)
  end
end