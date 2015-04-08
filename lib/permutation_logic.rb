class PermutationLogic

  def self.generate(options, spaces)
    result = []
    options.each do |option|
      result << [option]
    end
    result
  end

end