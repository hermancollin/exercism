Knapsack = Struct.new(:capacity) do
  def max_value(items)
    max_values = (0..items.length).map { [0] * (capacity + 1) }
    (1..items.length).each do |i|
      w_i, v_i = items[i-1].weight, items[i-1].value
      best = max_values[i - 1]
      (1..capacity).each do |w|
        max_values[i][w] = 
          w_i > w ? best[w] : [best[w], best[w - w_i] + v_i].max
      end
    end
    max_values[items.length][capacity]
  end
end