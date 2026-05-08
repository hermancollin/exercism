module Change
  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end

  def self.generate(coins, value)
    return [] if value.zero?
    raise NegativeTargetError if value < 0
    raise ImpossibleCombinationError if value < coins.min

    # initialize change-making matrix
    cmm = []
    (coins.length + 1).times { cmm << [0] * (value + 1)}
    cmm[0] = [Float::INFINITY] * (value + 1)

    # fill change-making matrix iteratively for every subproblem
    coins.each_with_index do |coin, c|
      i = c + 1
      (1..value).each do |j|
        if coin == j
          cmm[i][j] = 1
        elsif coin > j
          cmm[i][j] = cmm[i - 1][j]
        else
          cmm[i][j] = [
            cmm[i - 1][j],
            1 + cmm[i][j - coin]
          ].min
        end
      end
    end
    raise ImpossibleCombinationError if cmm[-1][-1] == Float::INFINITY

    # reconstruct optimal solution of length cmm[-1][-1]
    solution = []
    rest = value    
    until rest.zero?
      coins.reverse.each_with_index do |coin, c|
        i = coins.length - c
        next if cmm[i][rest] == cmm[i - 1][rest]
        if cmm[i][rest] < cmm[i - 1][rest]
          solution << coin
          rest -= coin
          break
        end
      end
    end
    solution.sort
  end
end