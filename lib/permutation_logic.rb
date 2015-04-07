class PermutationLogic

  def self.generate(options, spaces)

    if options.length == 1
      [0]
    elsif options.length == 2
      [[0], [1]]
    elsif options.length == 3
      [[0], [1], [2]]
    end

  end

end