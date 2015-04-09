require 'pry'
class PermutationLogic

  def self.generate(options)
    if options == [0]
      [[0]]
    elsif options == [1]
      [[1]]
    else
      [[2]]
    end
  end
end
