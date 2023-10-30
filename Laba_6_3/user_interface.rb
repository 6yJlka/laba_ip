require_relative 'root_finder'

def find_max_negative_root(equation, accuracy)
  x = -1.0
  max_negative_root = nil

  while x >= -1000
    if equation.call(x) <= accuracy
      max_negative_root = x
    else
      break if x < max_negative_root
    end
    x -= 0.1
  end

  max_negative_root
end
