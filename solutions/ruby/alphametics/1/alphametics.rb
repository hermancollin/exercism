module Alphametics
  def self.solve(puzzle)
    # Parse puzzle into a linear equation: SUM(coefficient * letter) = 0
    operands, sum_word = puzzle.split(" == ")
    words = operands.split(" + ") + [sum_word]
    
    coeffs_map = Hash.new(0)
    leading_letters = Set.new
    
    words.each_with_index do |word, w_idx|
      sign = (w_idx == words.length - 1) ? -1 : 1
      chars = word.chars
      leading_letters << chars.first
      
      chars.reverse.each_with_index do |char, power|
        coeffs_map[char] += sign * (10**power)
      end
    end

    # 2. Prepare data for the recursive solver
    sorted_letters = coeffs_map.keys.sort_by { |l| -coeffs_map[l].abs }
    coeffs = sorted_letters.map { |l| coeffs_map[l] }
    is_leading = sorted_letters.map { |l| leading_letters.include?(l) }
    
    # 3. Start Backtracking
    result_values = backtrack(coeffs, is_leading, Array.new(10, false), 0, 0)
    
    return {} unless result_values
    sorted_letters.zip(result_values).to_h
  end

  private

  def self.backtrack(coeffs, is_leading, used_digits, index, current_sum)
    # Base case: all letters assigned
    if index == coeffs.length
      return current_sum == 0 ? [] : nil
    end

    (0..9).each do |digit|
      next if used_digits[digit]
      next if digit == 0 && is_leading[index]
      
      # Try assigning this digit
      used_digits[digit] = true
      potential_sum = current_sum + (digit * coeffs[index])
      res = backtrack(coeffs, is_leading, used_digits, index + 1, potential_sum)
      
      if res
        return [digit] + res
      end
      
      # Backtrack
      used_digits[digit] = false
    end

    nil
  end
end