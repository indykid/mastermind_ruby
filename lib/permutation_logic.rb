require 'pry'
class PermutationLogic

  def self.generate(options, spaces)
    result = []

    if spaces == 1
      permutation = []
      options.each do |a|
        result << [a]
      end
    end

    if spaces == 2
      options.each do |a|
        options.each do |b|
          result << [a,b]
        end
      end
    end

    if spaces == 3
      options.each do |a|
        options.each do |b|
          options.each do |c|
            result << [a,b,c]
          end
        end
      end
    end

    if spaces == 4
      options.each do |a|
        options.each do |b|
          options.each do |c|
            options.each do |d|
              result << [a,b,c,d]
            end
          end
        end
      end
    end
    result
  end
end
