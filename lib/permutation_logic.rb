require 'pry'
class PermutationLogic

  def self.generate(options, spaces)
    result = []
    if spaces == 2
      result << [0, 0]
    else
      options.each do |option|
        result << [option]
      end
    end
    result
  end
end
