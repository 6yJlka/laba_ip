class Triple
  attr_reader :string

  def initialize(operand1, operand2, operation)
    @operand1 = operand1
    @operand2 = operand2
    @operation = operation
    @string = "#{operand1} #{@operation} #{operand2}"
  end

  def result
    case @operation
    when '+'
      @operand1 + @operand2
    when '-'
      @operand1 - @operand2
    when '*'
      @operand1 * @operand2
    when '/'
      @operand1 / @operand2.to_f
    else
      "Неверная операция"
    end
  end
end

class TripleInBrackets < Triple
  def initialize(operand1, operand2, operation)
    super(operand1, operand2, operation)
    @string = "(#{@string})"
  end
end
