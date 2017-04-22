#!/usr/bin/env ruby

#Q9 Reverse a stack and put the reversed value back in the same stack. You can use only one other stack and a temp variable.

#very slow - O(n^2/2)

def reverse_stack(stack)
  stack_1 = stack
  stack_2 = []
  temp = nil

  counter = stack_1.size - 1
  while counter > 0
    temp = stack_1.pop
    counter.times do
      stack_2.push(stack_1.pop)
    end
    stack_1.push(temp)
    counter.times do
      stack_1.push(stack_2.pop)
    end
  end
  stack_1
end
