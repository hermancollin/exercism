class Knapsack
  def initialize(max_weight) = @max_weight = max_weight

  def max_value(items)
    max_values = [[0] * (@max_weight + 1)]
    items.length.times { max_values << [0] * (@max_weight + 1) }
    (1..items.length).each do |i|
      w_i, v_i = items[i-1].weight, items[i-1].value
      last_row = max_values[i - 1]
      (1..@max_weight).each do |w|
        max_values[i][w] =
          if w_i > w
            last_row[w]
          else
            [ last_row[w], last_row[w - w_i] + v_i ].max
          end
      end
    end
    
    max_values[-1][-1]
  end
end