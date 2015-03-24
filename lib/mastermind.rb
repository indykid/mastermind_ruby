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
    output.puts(GREETING)
    output.puts(codebreaker.guess)
    output.puts(CORRECT_SCORE_REQUEST)
    correct = input.gets
    codebreaker.corrects << correct.chomp if correct
    output.puts(EXACT_SCORE_REQUEST)
    exact = input.gets
    codebreaker.exacts << exact.chomp if exact
  end
end