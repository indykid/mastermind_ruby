class Mastermind
  attr_reader :output, :codebreaker, :input

  GREETING = "Welcome to the Mastermind"
  CORRECT_SCORE_REQUEST = "How many colours correct? "
  EXACT_SCORE_REQUEST = "How many colours are in the exact spot? "

  def initialize(output, codebreaker, input)
    @output = output
    @codebreaker = codebreaker
    @input = input
  end

  def start
    display(GREETING)
    display(codebreaker.guess)
    display(CORRECT_SCORE_REQUEST)
    capture_correct_score
    display(EXACT_SCORE_REQUEST)
    capture_exact_score
  end

  private

  def display(message)
    output.puts(message)
  end

  def capture_correct_score
    correct = input.gets
    codebreaker.corrects << correct.chomp if correct
  end

  def capture_exact_score
    exact = input.gets
    codebreaker.exacts << exact.chomp if exact
  end


end