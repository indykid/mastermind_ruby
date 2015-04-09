require 'pry'
class PermutationLogic

  def self.generate(options, spaces)
    result = []
    if spaces > 1
      permutation = []
      spaces.times do
        options.each do |option|
          permutation << option
        end
      end
      result << permutation
    else
      options.each do |option|
        result << [option]
      end
    end
    result
  end
end
