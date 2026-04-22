class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    if not ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation.new()
    end

    if not [first_operand, second_operand].all? {|op| op.is_a?(Integer)}
      raise ArgumentError.new()
    end

    begin
      result = case operation
      when '+' then first_operand + second_operand
      when '/' then first_operand / second_operand
      when '*' then first_operand * second_operand
      end
      "#{first_operand} #{operation} #{second_operand} = #{result}"
    rescue ZeroDivisionError => e
      "Division by zero is not allowed."
    end
  end
end
