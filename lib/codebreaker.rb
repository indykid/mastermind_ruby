class Codebreaker
  attr_reader :guesses, :corrects, :exacts
  def initialize
    @guesses = []
    @corrects = []
    @exacts = []
  end

  def guess
    @guesses << 'rrrg'
  end
end