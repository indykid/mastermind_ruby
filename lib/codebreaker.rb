class Codebreaker
  attr_reader :guesses
  attr_accessor :corrects, :exacts
  def initialize
    @guesses = []
    @corrects = []
    @exacts = []
  end

  def guess
    @guesses << 'rrrg'.split('').shuffle.join
  end

end