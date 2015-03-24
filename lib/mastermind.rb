class Mastermind
  attr_reader :output, :codebreaker

  GREETING = "Welcome to the Mastermind"
  CORRECT_SCORE_REQUEST = "How many colours correct"

  def initialize(output, codebreaker)
    @output = output
    @codebreaker = codebreaker
  end

  def start
    output.puts(GREETING)
    output.puts(codebreaker.guess)
    output.puts(CORRECT_SCORE_REQUEST)
  end
end