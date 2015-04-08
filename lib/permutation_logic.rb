require 'pry'
class PermutationLogic

  def self.generate(options, spaces)
    result = []
    if spaces == 1
      options.each do |option|
        result << [option]
      end
    else
      options.each do |option|
        permutation = []
        options.each do |o|
          if permutation.length == spaces
            permutation = []
          end
          permutation << option
          permutation << o
          result << permutation
        end
      end
    end
    result
  end

end