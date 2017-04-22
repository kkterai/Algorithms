#!/usr/bin/env ruby

#Q8 Evaluate an expression given only single digits and only two operators, * and +.

def evaluate(expression)
  v_stack = []
  o_stack = []
  precedence = {'+'=> 0, '*'=> 1 }

  expression.each_char do |c|
    if c != '+' && c != '*'
      v_stack << c
    elsif c == '+'|| c == '*'
      if !o_stack.empty?
        if precedence[c] <= precedence[o_stack.last]
          v1 = v_stack.pop
          v2 = v_stack.pop
          op = o_stack.pop

          v_stack.push(eval "#{v1}#{op}#{v2}")
          o_stack.push(c)
        else
          o_stack.push(c)
        end
      else
        o_stack.push(c)
      end
    end
  end

  while !o_stack.empty?
    v1 = v_stack.pop
    v2 = v_stack.pop
    op = o_stack.pop

    v_stack.push(eval "#{v1}#{op}#{v2}")
  end
 return v_stack.last
end
