require 'pry'
class PermutationLogic

  def self.generate(options)
    result = []
    options.each do |option|
      result << [option]
    end
    result
  end
end
