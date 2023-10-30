def root_finder(equation, accuracy)
    x = -1.0
    max_negative_root = nil
  
    while x >= -1000
      if equation.call(x) <= 0 && (max_negative_root.nil? || x < max_negative_root)
        max_negative_root = x
      end
      x -= 0.1
    end
  
    max_negative_root
  end
  