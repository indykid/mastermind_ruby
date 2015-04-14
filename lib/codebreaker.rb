require 'permutation_logic'
require 'scorer'
class Codebreaker
  attr_reader :colours
  attr_accessor :corrects, :guesses, :exacts

  SIZE = 4

  def initialize
    @guesses = []
    @corrects = []
    @exacts = []
    @colours = ['r', 'g', 'b', 'y', 'p', 'o']
    @optimal_permutations = permutations
  end

  def guess
    if first_time?
      guess = first_guess
    else
      guess = half_smart_guess
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

  private

  def half_smart_guess
    optimize_permutations.sample
  end

  def optimize_permutations
    @optimal_permutations = @optimal_permutations.select do |option|
      Scorer.corrects(guesses.last, option) == corrects.last && Scorer.exacts(guesses.last, option) == exacts.last && !guesses.include?(option)
    end
    # puts @optimal_permutations.to_s
    @optimal_permutations
  end

  def permutations
    PermutationLogic.generate(colours, SIZE)
  end

end