class Codebreaker
  attr_reader :colours
  attr_accessor :corrects, :guesses, :exacts

  def initialize
    @guesses = []
    @corrects = []
    @exacts = []
    @colours = ['r', 'g', 'b', 'y', 'p', 'o']
  end

  def guess
    if first_time?
      guess = first_guess
    else
      guess == ['r', 'r', 'g', 'y']
    end
    @guesses << guess
    guess
  end

  private

  def first_guess
    first_colour  = colours.sample
    second_colour = colours.sample
    while second_colour == first_colour
      second_colour = colours.sample
    end
    return [first_colour, first_colour, second_colour, second_colour]
  end

  def first_time?
    guesses.length == 0
  end



end