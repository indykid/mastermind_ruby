class Codebreaker
  attr_reader :guesses
  def initialize
    @guesses = []
  end

  def guess
    @guesses << 'rrrg'
  end
end