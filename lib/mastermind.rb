class Mastermind
  attr_reader :output, :codebreaker, :input

  GREETING              = "Welcome to the Mastermind"
  CORRECT_SCORE_REQUEST = "How many colours correct? "
  EXACT_SCORE_REQUEST   = "How many colours are in the exact spot? "
  USER_WIN_NOTICE       = "You rock!"
  USER_LOSS_NOTICE      = "Better luck next time"
  MAX_ATTEMPTS          = 10
  HIGHEST_SCORE         = 4

  def initialize(output, codebreaker, input)
    @output = output
    @codebreaker = codebreaker
    @input = input
  end

  def start
    display(GREETING)
    until over?
      play
    end
    display(winner_announcement)
  end

  def play
    display(codebreaker.guess)
    display(CORRECT_SCORE_REQUEST)
    capture_score(codebreaker.corrects)
    display(EXACT_SCORE_REQUEST)
    capture_score(codebreaker.exacts)
  end

  def over?
    code_broken? || too_many_attempts?
  end

  def capture_score(scores)
    score = input.gets
    scores << score.chomp.to_i if score
  end

  def winner_announcement
    code_broken? ? USER_LOSS_NOTICE : USER_WIN_NOTICE
  end

  private

  def display(message)
    output.puts(message)
  end

  def code_broken?
    codebreaker.exacts.last   == HIGHEST_SCORE
  end

  def too_many_attempts?
    codebreaker.guesses.count == MAX_ATTEMPTS
  end
end