module Change
  ImpossibleCombinationError = NegativeTargetError = Class.new(RuntimeError)

  def self.generate(coins, value)
    return [] if value.zero?
    raise NegativeTargetError if value.negative?

    1.upto(value) do |subproblem|
      coins.repeated_combination(subproblem)
           .each { |change| return change if change.sum == value }
    end
    raise ImpossibleCombinationError
  end
end