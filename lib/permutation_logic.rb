class PermutationLogic

  def self.generate(options, spaces)
    if options.length == 1 && spaces == 1
      [options]
    elsif options.length == 2 && spaces == 1
      [[options.first], [options.last]]

    else
      []
    end
  end

end