require 'pry'
class PermutationLogic

  def self.generate(options, spaces)
    result = []
    if spaces == 1
      options.each do |option|
        result << [option]
      end
    else
      permutation = []
      options.each do |option|
        permutation << option
        options.each do |o|
          if permutation.length == spaces
            permutation = []
          end

          permutation << o
          if result.include?(permutation)
            permutation = permutation.reverse
          end
          result << permutation
        end
      end
    end
    result
  end

end