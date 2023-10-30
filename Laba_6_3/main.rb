require_relative 'user_interface'

# Уравнение -x^2 + sin(x^2) = 0
equation1 = lambda { |x| -x**2 + Math.sin(x**2) }
accuracy = 0.0001  # Увеличим точность
result1 = find_max_negative_root(equation1, accuracy)
puts "Максимальный отрицательный корень уравнения 1: #{result1.round(4)}"

# Уравнение x^5 + 3x^3 + x^2 + 1 = 0
equation2 = lambda { |x| x**5 + 3 * x**3 + x**2 + 1 }
result2 = find_max_negative_root(equation2, accuracy)
puts "Максимальный отрицательный корень уравнения 2: #{result2.round(4)}"
