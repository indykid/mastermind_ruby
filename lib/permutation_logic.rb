require 'pry'
class PermutationLogic

  def self.generate(options, spaces)
    result = []
    if spaces > 1
      permutation = []
      while permutation.length < spaces
        options.each do |option|
          permutation << option
        end
      end
      result << permutation
    else
      options.each do |option|
        permutation = []
        while permutation.length < spaces
          permutation << option
        end
        result << permutation
      end
    end

    result
  end
end
