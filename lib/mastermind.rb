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
    capture_score(codebreaker.corrects)
    display(EXACT_SCORE_REQUEST)
    capture_score(codebreaker.exacts)
  end

  private

  def display(message)
    output.puts(message)
  end

  def capture_score(scores)
    score = input.gets
    scores << score.chomp if score
  end


end