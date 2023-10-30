def calculate_b(x, y, z)
  if x.zero? || (x**4 + Math.sin(z)**2).zero?
    return Float::INFINITY
  else
    result = (1 + Math.cos(y - 2)) / (x**4 + Math.sin(z)**2)
    return result
  end
end