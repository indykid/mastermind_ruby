require 'pry'
class PermutationLogic

  def self.generate(options)
    if options.length == 1
      [options]
    else
      result = []
      options.each do |option|
        result << [option]
      end
      result
    end
  end
end
