class Codebreaker
  attr_reader :guesses, :corrects, :exacts
  attr_accessor :guesses, :exacts

  def initialize
    @guesses = []
    @corrects = []
    @exacts = []
  end

  def guess
    @guesses << 'rrrg'
  end
end