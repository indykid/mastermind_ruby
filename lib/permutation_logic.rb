require 'pry'
class PermutationLogic

  def self.generate(options, spaces)
    result = []
    if spaces == 1
      options.each do |option|
        result << [option]
      end
    elsif spaces == 2
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
    elsif spaces == 3
      options.each do |a|
          permutation = []
          options.each do |b|
            options.each do |c|
              if permutation.length == spaces
                permutation = []
              end
              permutation << a
              permutation << b
              permutation << c
              result << permutation
            end
          end
        end
    end
    result
  end

end
