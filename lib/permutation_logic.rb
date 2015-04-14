require 'pry'
class PermutationLogic

  def self.generate(options, size)
    result = []

    if size == 1
      options.each do |a|
        result << [a]
      end
    end

    if size == 2
      options.each do |a|
        options.each do |b|
          result << [a,b]
        end
      end
    end

    if size == 3
      options.each do |a|
        options.each do |b|
          options.each do |c|
            result << [a,b,c]
          end
        end
      end
    end

    if size == 4
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
