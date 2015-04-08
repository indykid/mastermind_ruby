require 'pry'
class PermutationLogic

  def self.generate(options, spaces)
    result = []
    if spaces == 1
      options.each do |a|
        permutation = []
        permutation << a
        result << permutation
      end
    elsif spaces == 2
      options.each do |a|
        options.each do |b|
          permutation = []
          permutation << a
          permutation << b
          result << permutation
        end
      end
    elsif spaces == 3
      options.each do |a|
          options.each do |b|
            options.each do |c|
              permutation = []
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
