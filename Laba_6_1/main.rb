require_relative 'testing'

def calculate_series_with_precision(precision)
  result = 1.0
  term = 1.0
  k = 1

  while term.abs > precision
    k_factorial = (1..(2 * k)).reduce(1, :*)
    term = (-1)**k / k_factorial.to_f
    result += term
    k += 1
  end

  [result, k - 1]  # Возвращаем результат и количество итераций
end

if __FILE__ == $0  # Проверка, что программа выполняется напрямую
  precisions = [1e-4, 1e-6]

  precisions.each do |precision|
    result, iterations = calculate_series_with_precision(precision)
    puts "Точность: #{precision}, S приближенно равно: #{result}, Количество итераций: #{iterations}"
  end
end
