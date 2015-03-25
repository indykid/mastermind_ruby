class Mastermind
  attr_reader :output, :codebreaker, :input

  GREETING = "Welcome to the Mastermind"
  CORRECT_SCORE_REQUEST = "How many colours correct? "
  EXACT_SCORE_REQUEST = "How many colours are in the exact spot? "
  MAX_ATTEMPTS = 10
  HIGHEST_SCORE = 4

  def initialize(output, codebreaker, input)
    @output = output
    @codebreaker = codebreaker
    @input = input
  end

  def start
    display(GREETING)
    until over? do
      play
    end
  end

  def play
    display(codebreaker.guess)
    display(CORRECT_SCORE_REQUEST)
    capture_score(codebreaker.corrects)
    display(EXACT_SCORE_REQUEST)
    capture_score(codebreaker.exacts)
  end

  def over?
    codebreaker.exacts.last == HIGHEST_SCORE || codebreaker.guesses.count == MAX_ATTEMPTS
  end

  def capture_score(scores)
    score = input.gets
    scores << score.chomp.to_i if score
  end

  private

  def display(message)
    output.puts(message)
  end

end