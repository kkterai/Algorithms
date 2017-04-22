# Find missing parenthesis in a given expression: -2 * (3 + 5 (sasdfasdfasd)
# * What happens when there are different types of brackets? (included in solution)


def missing_brackets?(expression)
  stack = []
  pairs = {'{'=>'}','('=>')','['=>']'}

  expression.each_char do |chr|
    if pairs.has_key?(chr)
      stack << chr
    elsif pairs.key(chr) == stack[-1]
      stack.pop
    end
  end

  if stack.empty?
    return "No missing brackets"
  else
    return "A '#{pairs[stack[-1]]}' is missing"
  end
end
