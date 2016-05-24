# RPNCalculator parses and calculates equation in Reverse Polish Notation
class RPNCalculator
  def calculate(input)
    input.chomp!
    stack = []

    while input.length > 0
      case input
      # match at begining of string that is a number (possibly decimal)
      when /\A-?\d+(\.\d+)?/
        stack.push($&.to_f)
      # match non-white characters
      when /\S*/
        fail 'Error: must have two numbers before operator' if stack.size < 2
        second = stack.pop
        first = stack.pop
        # take last two numbers and perform operation just detected,
        # push back onto stack
        begin
          stack.push(first.send($&, second))
        rescue
          raise "Error: #{$&} is not a valid operator"
        end

      end

      # what followed the last match (number or operator) and strip
      # begining white space
      input = $'
      input.lstrip!
    end

    # if we did not end up with one thing on then it was a bad equation
    fail 'Error: improper format of equation' if stack.size != 1

    stack.pop
  end
end
