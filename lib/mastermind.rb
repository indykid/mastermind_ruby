class Mastermind

  attr_reader :output, :input, :codebreaker

  MAX_ATTEMPTS          = 10
  GREETING              = "Welcome to the Mastermind"
  CORRECT_SCORE_REQUEST = "How many are correct? "
  EXACT_SCORE_REQUEST   = "How many are exact? "
  USER_WON_MESSAGE      = "You won!"
  USER_LOST_MESSAGE     = "You lost, better luck next time"

  def initialize(output, input, codebreaker)
    @output       = output
    @input        = input
    @codebreaker  = codebreaker
  end

  def start
    display(GREETING)
    until over?
      play
    end
    display(winner_announcement)
  end

  def play
    display(codebreaker.guess.last)
    ask_for_correct
    update_corrects(input.gets)
    ask_for_exact
    update_exacts(input.gets)
  end

  def over?
    used_all_attempts? || code_broken?
  end

  def winner_announcement
    code_broken? ? USER_LOST_MESSAGE : USER_WON_MESSAGE
  end

  private

  def update_corrects(correct)
    codebreaker.corrects << correct.chomp if correct
  end

  def update_exacts(exact)
    codebreaker.exacts << exact.chomp if exact
  end

  def ask_for_correct
    output.print(CORRECT_SCORE_REQUEST)
  end

  def ask_for_exact
    output.print(EXACT_SCORE_REQUEST)
  end

  def code_broken?
    codebreaker.exacts.last.to_i == 4
  end

  def used_all_attempts?
    codebreaker.guesses.count == MAX_ATTEMPTS
  end

  def display(message)
    output.puts(message)
  end
end