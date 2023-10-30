def calculate_series_with_precision(precision)
    result = 1.0
    term = 1.0
    k = 1
  
    enumerator = Enumerator.new do |yielder|
      loop do
        k_factorial = (1..(2 * k)).reduce(1, :*)
        term = (-1)**k / k_factorial.to_f
        result += term
        yielder.yield(result, k - 1)
        k += 1
      end
    end
  
    enumerator.find { |_, iterations| term.abs <= precision }
  end
  
  precisions = [1e-4, 1e-6]
  
  precisions.each do |precision|
    result, iterations = calculate_series_with_precision(precision)
    puts "Точность: #{precision}, S приближенно равно: #{result}, Количество итераций: #{iterations}"
  end
  